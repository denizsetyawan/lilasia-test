<script>
    import { ref } from 'vue';
    import { useAuth } from '../../composables/useAuth';

    export default {
        setup() {
            const email = ref('');
            const password = ref('');
            const errorMsg = ref('');
            const { login } = useAuth();

            const handleLogin = async () => {
                try {
                    await login({ email: email.value, password: password.value });
                } catch (error) {
                    errorMsg.value = 'Invalid email or password';
                }
            };

            return {
                email,
                password,
                handleLogin,
                errorMsg
            };
        }
    };
</script>

<template>
    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-body">
                <h1>Login</h1>
                <form @submit.prevent="handleLogin">
                    <p v-if="errorMsg" class="text-danger">{{ errorMsg }}</p>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" v-model="email" id="email" class="form-control" required />
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" v-model="password" id="password" class="form-control" required />
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
            </div>
        </div>
    </div>
</template>

<style scoped>
    .card {
        width: 400px !important;
    }
</style>