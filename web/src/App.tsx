import { Routes, Route, NavLink } from 'react-router-dom'
import Commands from './pages/Commands'
import Recipes from './pages/Recipes'
import Reference from './pages/Reference'
import './App.css'

function App() {
  return (
    <div className="app">
      <nav className="navbar">
        <span className="nav-brand">KH BBS Commands</span>
        <div className="nav-links">
          <NavLink to="/" end>Recipes</NavLink>
          <NavLink to="/commands">Commands</NavLink>
          <NavLink to="/reference">Reference</NavLink>
        </div>
      </nav>
      <main>
        <Routes>
          <Route path="/" element={<Recipes />} />
          <Route path="/commands" element={<Commands />} />
          <Route path="/reference" element={<Reference />} />
        </Routes>
      </main>
    </div>
  )
}

export default App