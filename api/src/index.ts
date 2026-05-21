import { Hono } from "hono";
import { cors } from "hono/cors";
import { logger as honoLogger } from "hono/logger";
import { commands } from "./routes/commands.ts";
import { recipes } from "./routes/recipes.ts";
import { crystals } from "./routes/crystals.ts";
import { abilities } from "./routes/abilities.ts";
import { types } from "./routes/types.ts";
import { logger } from "./logger.ts";

const app = new Hono();

app.use("*", cors());
app.use("*", honoLogger());

app.route("/api/commands", commands);
app.route("/api/recipes", recipes);
app.route("/api/crystals", crystals);
app.route("/api/abilities", abilities);
app.route("/api/types", types);

app.get("/", (c) => c.json({ name: "KH BBS Command Meld API", version: "1.0.0" }));

const host = process.env.HOST || "localhost";
const port = parseInt(process.env.PORT || "3000");
const protocol = host === "0.0.0.0" || host === "::" ? "http://localhost" : `http://${host}`;
logger.info("Server started", { url: `${protocol}:${port}` });

export default {
  hostname: host,
  port,
  fetch: app.fetch,
};
