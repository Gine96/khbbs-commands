import { Hono } from "hono";
import { getDb } from "../db.ts";

export const types = new Hono();

types.get("/:type/abilities", (c) => {
  let type = c.req.param("type");
  if (type.startsWith("Type ")) type = type.slice(5);
  const db = getDb();
  const rows = db.query("SELECT * FROM v_type_abilities WHERE recipe_type = ? ORDER BY crystal").all(type);
  if (rows.length === 0) return c.json({ error: "Type not found" }, 404);
  return c.json(rows);
});
