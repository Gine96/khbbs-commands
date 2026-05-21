import { useEffect, useState } from 'react';
import { api, type Command } from '../api';

export default function Commands() {
  const [commands, setCommands] = useState<Command[]>([]);
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const timeout = setTimeout(() => {
      setLoading(true);
      api.commands(search || undefined).then(setCommands).finally(() => setLoading(false));
    }, 200);
    return () => clearTimeout(timeout);
  }, [search]);

  return (
    <div className="page">
      <h1>Commands</h1>
      <input
        type="text"
        placeholder="Search commands..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="search-input"
      />
      {loading ? (
        <p className="loading">Loading...</p>
      ) : (
        <div className="command-grid">
          {commands.map((cmd) => (
            <div key={cmd.id} className="command-card">
              {cmd.name}
            </div>
          ))}
          {commands.length === 0 && <p className="empty">No commands found.</p>}
        </div>
      )}
    </div>
  );
}
