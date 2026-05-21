import { Hono } from "hono";
import { getDb } from "../db.ts";

export const recipes = new Hono();

recipes.get("/", (c) => {
  const db = getDb();
  const result = c.req.query("result");
  const ingredient = c.req.query("ingredient");
  const character = c.req.query("character");
  const type = c.req.query("type");

  const conditions: string[] = [];
  const params: (string | number)[] = [];

  if (result) {
    conditions.push("result LIKE ?");
    params.push(`%${result}%`);
  }

  if (ingredient) {
    conditions.push("(ingredient1 LIKE ? OR ingredient2 LIKE ?)");
    params.push(`%${ingredient}%`, `%${ingredient}%`);
  }

  if (character) {
    const char = character.toLowerCase();
    if (["terra", "ventus", "aqua"].includes(char)) {
      conditions.push(`${char} > 0`);
    } else {
      return c.json({ error: "character must be terra, ventus, or aqua" }, 400);
    }
  }

  if (type) {
    conditions.push("recipe_type = ?");
    params.push(type);
  }

  let sql = "SELECT * FROM v_recipes";
  if (conditions.length > 0) {
    sql += " WHERE " + conditions.join(" AND ");
  }
  sql += " ORDER BY id";

  const rows = db.query(sql).all(...params);
  return c.json(rows);
});

recipes.get("/:id", (c) => {
  const id = parseInt(c.req.param("id"));
  if (isNaN(id)) return c.json({ error: "Invalid id" }, 400);

  const db = getDb();
  const row = db.query("SELECT * FROM v_recipes WHERE id = ?").get(id);
  if (!row) return c.json({ error: "Recipe not found" }, 404);
  return c.json(row);
});
