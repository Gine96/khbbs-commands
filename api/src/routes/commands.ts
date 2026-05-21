import { Hono } from "hono";
import { getDb } from "../db.ts";

export const commands = new Hono();

commands.get("/", (c) => {
  const q = c.req.query("q");
  const db = getDb();

  if (q) {
    const rows = db.query("SELECT * FROM commands WHERE name LIKE ? ORDER BY name").all(`%${q}%`);
    return c.json(rows);
  }

  const rows = db.query("SELECT * FROM commands ORDER BY name").all();
  return c.json(rows);
});

commands.get("/:id", (c) => {
  const id = parseInt(c.req.param("id"));
  if (isNaN(id)) return c.json({ error: "Invalid id" }, 400);

  const db = getDb();
  const row = db.query("SELECT * FROM commands WHERE id = ?").get(id);
  if (!row) return c.json({ error: "Command not found" }, 404);
  return c.json(row);
});
