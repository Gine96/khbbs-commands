# Stage 1: install production dependencies
FROM oven/bun:1.3-alpine AS deps
WORKDIR /app
COPY package.json bun.lock* ./
RUN bun install --frozen-lockfile --production

# Stage 2: runtime
FROM oven/bun:1.3-alpine AS runtime
WORKDIR /app

# Create a non-root user with no shell or home directory
RUN addgroup --system --gid 1001 bunapp && \
    adduser --system --uid 1001 --ingroup bunapp --no-create-home --shell /sbin/nologin bunapp

# Copy deps and app files with correct ownership
COPY --from=deps --chown=bunapp:bunapp /app/node_modules ./node_modules
COPY --chown=bunapp:bunapp package.json ./
COPY --chown=bunapp:bunapp src/ ./src/
COPY --chown=bunapp:bunapp db/ ./db/

USER bunapp

ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost:3000/ || exit 1

CMD ["bun", "run", "src/index.ts"]
