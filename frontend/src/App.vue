<script setup>
import { RouterView } from 'vue-router'
import Navbar from './components/Navbar.vue'
</script>

<template>
  <div class="container-fluid">
    <Navbar />
    <div class="content container">
      <RouterView />
    </div>
  </div>
</template>

<style scoped>
.content {
  margin-top: 20px;
}
</style>
