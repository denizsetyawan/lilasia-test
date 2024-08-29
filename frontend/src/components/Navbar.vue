<script>
    import { useAuth } from '../composables/useAuth';
    
    export default {
        setup() {
            const { isAuthenticated, logout } = useAuth();

            return {
                isAuthenticated,
                logout,
            };
        },
    };
</script>

<template>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Denis</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <router-link class="nav-link" to="/">Home</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/products">Products</router-link>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item" v-if="!isAuthenticated">
                        <router-link class="nav-link" to="/login">Login</router-link>
                    </li>
                    <li class="nav-item" v-if="isAuthenticated">
                        <button class="nav-link btn btn-link" @click="logout">Logout</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<style scoped>
    .navbar {
        margin-bottom: 20px;
    }
</style>