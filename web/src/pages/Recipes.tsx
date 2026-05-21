import { useEffect, useState } from 'react';
import { api, type Recipe, type TypeAbility } from '../api';

const CHARACTERS = ['', 'terra', 'ventus', 'aqua'] as const;
const TYPES = ['', 'Type A', 'Type B', 'Type C', 'Type D', 'Type E', 'Type F', 'Type G', 'Type H', 'Type I', 'Type J', 'Type K', 'Type L', 'Type M', 'Type N', 'Type O', 'Type P'] as const;

function RateCell({ value }: { value: number }) {
  if (value === 0) return <td className="rate rate-zero">—</td>;
  if (value === 100) return <td className="rate rate-full">{value}%</td>;
  return <td className="rate rate-partial">{value}%</td>;
}

function TypeAbilities({ type }: { type: string }) {
  const [abilities, setAbilities] = useState<TypeAbility[]>([]);
  const [open, setOpen] = useState(false);

  useEffect(() => {
    if (open && abilities.length === 0) {
      api.typeAbilities(type).then(setAbilities).catch(() => {});
    }
  }, [open, type, abilities.length]);

  return (
    <div className="type-abilities-inline">
      <button className="btn-small" onClick={() => setOpen(!open)}>
        {open ? 'Hide' : 'Abilities'}
      </button>
      {open && abilities.length > 0 && (
        <ul className="ability-list-inline">
          {abilities.map((a) => (
            <li key={a.crystal}>
              <span className="crystal-name">{a.crystal}</span> → {a.ability}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default function Recipes() {
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [loading, setLoading] = useState(true);
  const [result, setResult] = useState('');
  const [ingredient, setIngredient] = useState('');
  const [character, setCharacter] = useState('');
  const [type, setType] = useState('');

  useEffect(() => {
    const timeout = setTimeout(() => {
      setLoading(true);
      const params: Record<string, string> = {};
      if (result) params.result = result;
      if (ingredient) params.ingredient = ingredient;
      if (character) params.character = character;
      if (type) params.type = type;
      api.recipes(Object.keys(params).length > 0 ? params : undefined)
        .then(setRecipes)
        .finally(() => setLoading(false));
    }, 250);
    return () => clearTimeout(timeout);
  }, [result, ingredient, character, type]);

  return (
    <div className="page">
      <h1>Recipes</h1>
      <div className="filters">
        <input
          type="text"
          placeholder="Filter by result..."
          value={result}
          onChange={(e) => setResult(e.target.value)}
          className="search-input"
        />
        <input
          type="text"
          placeholder="Filter by ingredient..."
          value={ingredient}
          onChange={(e) => setIngredient(e.target.value)}
          className="search-input"
        />
        <select value={character} onChange={(e) => setCharacter(e.target.value)} className="select-input">
          <option value="">All Characters</option>
          {CHARACTERS.filter(Boolean).map((c) => (
            <option key={c} value={c}>{c.charAt(0).toUpperCase() + c.slice(1)}</option>
          ))}
        </select>
        <select value={type} onChange={(e) => setType(e.target.value)} className="select-input">
          <option value="">All Types</option>
          {TYPES.filter(Boolean).map((t) => (
            <option key={t} value={t}>{t}</option>
          ))}
        </select>
      </div>

      {loading ? (
        <p className="loading">Loading...</p>
      ) : (
        <>
          <p className="result-count">{recipes.length} recipe{recipes.length !== 1 ? 's' : ''} found</p>
          <div className="table-wrap">
            <table>
              <thead>
                <tr>
                  <th>Result</th>
                  <th>Ingredient 1</th>
                  <th>Lv</th>
                  <th>Ingredient 2</th>
                  <th>Lv</th>
                  <th>Type</th>
                  <th>Terra</th>
                  <th>Ventus</th>
                  <th>Aqua</th>
                </tr>
              </thead>
              <tbody>
                {recipes.map((r) => (
                  <tr key={r.id}>
                    <td className="cell-result">{r.result}</td>
                    <td>{r.ingredient1}</td>
                    <td className="cell-lv">{r.ingredient1_lv}</td>
                    <td>{r.ingredient2}</td>
                    <td className="cell-lv">{r.ingredient2_lv}</td>
                    <td>
                      <span className="recipe-type">{r.recipe_type}</span>
                      <TypeAbilities type={r.recipe_type} />
                    </td>
                    <RateCell value={r.terra} />
                    <RateCell value={r.ventus} />
                    <RateCell value={r.aqua} />
                  </tr>
                ))}
              </tbody>
            </table>
            {recipes.length === 0 && <p className="empty">No recipes match your filters.</p>}
          </div>
        </>
      )}
    </div>
  );
}
