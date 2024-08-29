import axios from 'axios';
import {
    ref,
    watchEffect
} from 'vue';
import {
    useRouter
} from 'vue-router';

const isAuthenticated = ref(!!localStorage.getItem('token'));

export function useAuth() {
    const router = useRouter();

    const login = async (credentials) => {
        try {
            const response = await axios.post('/api/login', credentials);
            localStorage.setItem('token', response.data.access_token);
            localStorage.setItem('userRole', response.data.user.role);
            isAuthenticated.value = true;
            router.push('/products');
        } catch (error) {
            throw new Error(error.response?.data.message || 'Login failed');
        }
    };

    const logout = () => {
        localStorage.removeItem('token');
        localStorage.removeItem('userRole');
        isAuthenticated.value = false;
        router.push('/login');
    };

    watchEffect(() => {
        isAuthenticated.value = !!localStorage.getItem('token');
    });

    return {
        isAuthenticated,
        login,
        logout,
    };
}