import { Database } from "bun:sqlite";

const DB_PATH = process.env.DB_PATH ?? "/app/db/khbbs.db";

let db: Database;

export function getDb(): Database {
  if (!db) {
    db = new Database(DB_PATH, { readonly: true });
    db.run("PRAGMA foreign_keys=ON");
  }
  return db;
}
