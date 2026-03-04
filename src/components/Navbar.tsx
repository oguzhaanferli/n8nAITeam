import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav className="bg-white shadow-md">
      <div className="container mx-auto px-4 py-3 flex justify-between items-center">
        <Link to="/" className="text-2xl font-bold text-blue-600">TodoAI</Link>
        <div className="space-x-4">
          <Link to="/tasks" className="hover:text-blue-600">Görevler</Link>
          <Link to="/tasks/new" className="hover:text-blue-600">Yeni Görev</Link>
          <Link to="/settings" className="hover:text-blue-600">Ayarlar</Link>
          <Link to="/login" className="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600">Giriş</Link>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
```