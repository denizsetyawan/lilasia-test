import { createRouter, createWebHistory } from 'vue-router';
import ProductsPage from '../views/Product/ProductsPage.vue';
import Login from '../views/Auth/Login.vue';
import CreateProduct from '@/views/Product/CreateProduct.vue';
import EditProduct from '@/views/Product/EditProduct.vue';

const routes = [
  {
    path: '/',
    name: 'home',
    component: Login,
  },
  {
    path: '/about',
    name: 'about',
    component: () => import('../views/AboutView.vue'), // Lazy loading
  },
  // auth
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  // products
  {
    path: '/products',
    name: 'Products',
    component: ProductsPage,
    meta: { requiresAuth: true },
  },
  {
    path: '/products/create',
    name: 'CreateProduct',
    component: CreateProduct,
    meta: { requiresAuth: true, requiresAdmin: true },
  },
  {
    path: '/products/:id',
    name: 'EditProduct',
    component: EditProduct,
    meta: { requiresAuth: true },
  }
];

// Hanya panggil createRouter sekali
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

// Middleware untuk memeriksa otentikasi
router.beforeEach((to, from, next) => {
  const isAuthenticated = !!localStorage.getItem('token');
  const userRole = localStorage.getItem('userRole');

  if ((to.name === 'Login' || to.name === 'home') && isAuthenticated) {
    next({ name: 'Products' });
  } else if (to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated) {
    next({ name: 'Login' });
  } else if (to.matched.some(record => record.meta.requiresAdmin) && userRole !== 'admin') {
    next({ name: 'Products' });
  } else {
    next();
  }
});

export default router;
