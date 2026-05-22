# KH BBS Command Meld

A reference app for the command meld system in *Kingdom Hearts Birth by Sleep*. Look up recipes, filter by result, ingredient, ability, character, or recipe type.

## Structure

```
api/   — REST API (Bun + Hono + SQLite)
web/   — Frontend (React + Vite, served by nginx)
```

## API

**Base URL:** `http://localhost:3000`

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/api/commands` | List all commands. Optional `?q=` for name search. |
| `GET` | `/api/commands/:id` | Single command by ID. |
| `GET` | `/api/recipes` | List recipes. See filters below. |
| `GET` | `/api/crystals` | List all crystals. |
| `GET` | `/api/abilities` | List all abilities. |
| `GET` | `/api/types/:type/abilities` | Abilities granted by a recipe type (e.g. `Type%20A`). |

**Recipe filters** (query params):

| Param | Example | Description |
|-------|---------|-------------|
| `result` | `?result=fire` | Filter by result name (partial match). |
| `ingredient` | `?ingredient=blizzard` | Filter by either ingredient (partial match). |
| `character` | `?character=terra` | Only recipes available to `terra`, `ventus`, or `aqua`. |
| `type` | `?type=Type%20A` | Filter by recipe type. |
| `ability` | `?ability=fire+boost` | Filter by ability granted by the recipe type (partial match). |

## Development

### Prerequisites

- [Bun](https://bun.sh) ≥ 1.3
- `sqlite3` CLI (for database generation)
- Node.js (for the web dev server, provided by Bun)

### API

```bash
cd api

# Generate the SQLite database (first time / after SQL changes)
sqlite3 db/khbbs.db < db/khbbs_commands.sql

# Start dev server (with hot reload)
bun run dev
```

The API will be available at `http://localhost:3000`.

### Web

```bash
cd web
bun install
bun run dev
```

The web app will be available at `http://localhost:5173`. In development, Vite proxies `/api` requests to `http://localhost:3000`.

## Docker

Both services have hardened, non-root Docker images.

**Build manually:**

```bash
# API — generate db first
sqlite3 api/db/khbbs.db < api/db/khbbs_commands.sql
docker build -t khbbs-api ./api

# Web
docker build -t khbbs-web ./web
```

| Service | Port | Healthcheck |
|---------|------|-------------|
| API | `3000` | `GET /` |
| Web | `8080` | `GET /` |

## CI/CD

Docker images are built and pushed to the GitHub Container Registry automatically.

| Branch push | Image built | Tags applied |
|-------------|-------------|--------------|
| `api/v1.2.3` | `ghcr.io/<owner>/khbbs-commands-api` | `v1.2.3`, `latest` |
| `web/v1.2.3` | `ghcr.io/<owner>/khbbs-commands-web` | `v1.2.3`, `latest` |

**To release a new version:**

```bash
# API
git checkout -b api/v1.2.3
git push origin api/v1.2.3

# Web
git checkout -b web/v1.2.3
git push origin web/v1.2.3
```

## Data source

Recipe data sourced from the [Kingdom Hearts Wiki](https://www.khwiki.com/Command_Meld). The `api/db/parse_html.py` script can regenerate `khbbs_commands.sql` from the saved HTML page.
