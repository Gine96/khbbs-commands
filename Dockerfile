# ─── API: install production dependencies ────────────────────────────────────
FROM oven/bun:1.3-alpine AS api-deps

WORKDIR /app

COPY api/package.json api/bun.lock* ./

RUN bun install --frozen-lockfile --production

# ─── Web: build ───────────────────────────────────────────────────────────────
FROM oven/bun:1.3-alpine AS web-build

WORKDIR /app

ARG VITE_API_URL=http://localhost:3000

COPY web/package.json web/bun.lock* ./
RUN bun install --frozen-lockfile
COPY web/ .

RUN VITE_API_URL=$VITE_API_URL bun run build

# ─── Unified runtime ──────────────────────────────────────────────────────────
FROM nginx:1.31-alpine

# Copy bun binary from official image (statically linked musl build)
COPY --from=oven/bun:1.3-alpine /usr/local/bin/bun /usr/local/bin/bun

# Install supervisord for process management
RUN apk add --no-cache supervisor

# Create a non-root user for the API process
RUN addgroup --system --gid 1001 bunapp && \
    adduser --system --uid 1001 --ingroup bunapp --no-create-home --shell /sbin/nologin bunapp

# Set up API files
WORKDIR /app/api
COPY --from=api-deps --chown=bunapp:bunapp /app/node_modules ./node_modules
COPY --chown=bunapp:bunapp api/package.json ./
COPY --chown=bunapp:bunapp api/src/ ./src/
COPY --chown=bunapp:bunapp api/db/ ./db/

# Set up nginx static files
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=web-build /app/dist /usr/share/nginx/html
COPY web/nginx.conf /etc/nginx/conf.d/app.conf
RUN mkdir -p /var/cache/nginx/client_temp \
    /var/cache/nginx/proxy_temp \
    /var/cache/nginx/fastcgi_temp \
    /var/cache/nginx/uwsgi_temp \
    /var/cache/nginx/scgi_temp \
    && chown -R nginx:nginx /var/cache/nginx /var/log/nginx \
    && chown nginx:nginx /etc/nginx/conf.d/app.conf \
    && touch /var/run/nginx.pid \
    && chown nginx:nginx /var/run/nginx.pid

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost:8080/ || exit 1

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
