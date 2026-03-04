import { Routes, Route } from 'react-router-dom';
import routes from './routes';
import Layout from './components/Layout';

function App() {
  return (
    <Layout>
      <Routes>
        {routes.map((route, index) => (
          <Route key={index} path={route.path} element={route.element} />
        ))}
      </Routes>
    </Layout>
  );
}

export default App;
```