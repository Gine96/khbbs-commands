const BASE = '/api';

export interface Command {
  id: number;
  name: string;
}

export interface Recipe {
  id: number;
  recipe_type: string;
  ingredient1: string;
  ingredient1_lv: number;
  ingredient2: string;
  ingredient2_lv: number;
  result: string;
  terra: number;
  ventus: number;
  aqua: number;
}

export interface Crystal {
  id: number;
  name: string;
}

export interface Ability {
  id: number;
  name: string;
}

export interface TypeAbility {
  recipe_type: string;
  crystal: string;
  ability: string;
}

async function get<T>(path: string): Promise<T> {
  const res = await fetch(`${BASE}${path}`);
  if (!res.ok) throw new Error(`API error: ${res.status}`);
  return res.json();
}

export const api = {
  commands: (q?: string) =>
    get<Command[]>(q ? `/commands?q=${encodeURIComponent(q)}` : '/commands'),
  command: (id: number) => get<Command>(`/commands/${id}`),
  recipes: (params?: Record<string, string>) => {
    const qs = params ? '?' + new URLSearchParams(params).toString() : '';
    return get<Recipe[]>(`/recipes${qs}`);
  },
  crystals: () => get<Crystal[]>('/crystals'),
  abilities: () => get<Ability[]>('/abilities'),
  typeAbilities: (type: string) => get<TypeAbility[]>(`/types/${encodeURIComponent(type)}/abilities`),
};
