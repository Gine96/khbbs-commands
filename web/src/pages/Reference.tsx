import { useEffect, useState } from 'react';
import { api, type Crystal, type Ability, type TypeAbility } from '../api';

const TYPES = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P'];

export default function Reference() {
  const [crystals, setCrystals] = useState<Crystal[]>([]);
  const [abilities, setAbilities] = useState<Ability[]>([]);
  const [selectedType, setSelectedType] = useState('A');
  const [typeAbilities, setTypeAbilities] = useState<TypeAbility[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([api.crystals(), api.abilities()])
      .then(([c, a]) => { setCrystals(c); setAbilities(a); })
      .finally(() => setLoading(false));
  }, []);

  useEffect(() => {
    api.typeAbilities(`Type ${selectedType}`).then(setTypeAbilities).catch(() => setTypeAbilities([]));
  }, [selectedType]);

  if (loading) return <p className="loading">Loading...</p>;

  return (
    <div className="page">
      <h1>Reference</h1>

      <section className="ref-section">
        <h2>Abilities by Type</h2>
        <div className="type-tabs">
          {TYPES.map((t) => (
            <button
              key={t}
              className={`type-tab ${selectedType === t ? 'active' : ''}`}
              onClick={() => setSelectedType(t)}
            >
              {t}
            </button>
          ))}
        </div>
        {typeAbilities.length > 0 && (
          <table className="ref-table">
            <thead>
              <tr>
                <th>Crystal</th>
                <th>Ability</th>
              </tr>
            </thead>
            <tbody>
              {typeAbilities.map((ta) => (
                <tr key={ta.crystal}>
                  <td>{ta.crystal}</td>
                  <td>{ta.ability}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </section>

      <div className="ref-columns">
        <section className="ref-section">
          <h2>Crystals</h2>
          <ul className="ref-list">
            {crystals.map((c) => <li key={c.id}>{c.name}</li>)}
          </ul>
        </section>

        <section className="ref-section">
          <h2>Abilities</h2>
          <ul className="ref-list">
            {abilities.map((a) => <li key={a.id}>{a.name}</li>)}
          </ul>
        </section>
      </div>
    </div>
  );
}
