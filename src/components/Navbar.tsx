import { Link } from 'react-router-dom'
import useAppStore from '../lib/store'

const Navbar = () => {
  const { user } = useAppStore()

  return (
    <nav>
      <div className="nav-container">
        <Link to="/">Todo App</Link>
        <div>
          {user ? (
            <>
              <Link to="/tasks">Tasks</Link>
              <Link to="/settings">Settings</Link>
              <button>Logout</button>
            </>
          ) : (
            <>
              <Link to="/login">Login</Link>
              <Link to="/register">Register</Link>
            </>
          )}
        </div>
      </div>
    </nav>
  )
}

export default Navbar
```