import { Hono } from "hono";
import { getDb } from "../db.ts";

export const abilities = new Hono();

abilities.get("/", (c) => {
  const db = getDb();
  const rows = db.query("SELECT * FROM abilities ORDER BY name").all();
  return c.json(rows);
});
