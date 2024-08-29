<script setup>
    import {
        ref,
        onMounted
    } from 'vue';
    import ProductForm from '../../components/ProductForm.vue';
    import axios from 'axios';

    const productToEdit = ref(null);

    onMounted(async () => {
        const productId = window.location.pathname.split('/').pop();
        const response = await axios.get(`/api/products/${productId}`);
        productToEdit.value = response.data;
    });
</script>

<template>
    <ProductForm :product="productToEdit" :isEdit="true" />
</template>