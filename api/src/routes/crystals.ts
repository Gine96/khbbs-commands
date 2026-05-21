import { Hono } from "hono";
import { getDb } from "../db.ts";

export const crystals = new Hono();

crystals.get("/", (c) => {
  const db = getDb();
  const rows = db.query("SELECT * FROM crystals ORDER BY id").all();
  return c.json(rows);
});
