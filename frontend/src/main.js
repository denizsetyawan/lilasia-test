import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './axios';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap';
import { getUserRole } from './globalFunctions';

const app = createApp(App)

app.use(router)
app.config.globalProperties.getUserRole = getUserRole

app.mount('#app')
