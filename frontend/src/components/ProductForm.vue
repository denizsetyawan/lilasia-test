<script setup>
    import {
        ref,
        watch,
    } from 'vue';
    import {
        useRouter
    } from 'vue-router';
    import axios from 'axios';

    const props = defineProps({
        product: {
            type: Object,
            default: () => ({
                name: '',
                description: '',
                price: 0,
                category: '',
                image: '',
            }),
        },
        isEdit: {
            type: Boolean,
            default: false,
        },
    });

    const emit = defineEmits(['productCreated', 'productUpdated']);

    const router = useRouter();
    const errorMsg = ref('');
    const product = ref({
        ...props.product
    });
    const imageFile = ref(null);

    const handleImageUpload = (event) => {
        const file = event.target.files[0];
        if (file) {
            imageFile.value = file;
        }
    };

    const submitForm = async () => {
        errorMsg.value = '';

        const updatedProductData = {
            name: product.value.name,
            description: product.value.description,
            price: product.value.price,
            category: product.value.category,
        };

        // Initialize FormData and append the updated data
        const formData = new FormData();
        for (const key in updatedProductData) {
            formData.append(key, updatedProductData[key]);
        }

        if (imageFile.value) {
            formData.append('image', imageFile.value);
        }

        try {
            if (props.isEdit) {
                const response = await axios.post(`/api/products/${props.product.id}?_=${new Date().getTime()}`, formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                });
                emit('productUpdated', response.data);
            } else {
                await axios.post('/api/products', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                });
                emit('productCreated');
            }
            router.push('/products');
        } catch (error) {
            errorMsg.value = 'Make sure all fields are filled in correctly.';
            console.error(errorMsg.value);
        }
    };

    watch(() => props.product, (newValue) => {
        product.value = {
            ...newValue
        };
    });
</script>

<template>
    <div class="product-form-container">
        <h2>{{ isEdit ? 'Edit Product' : 'Create Product' }}</h2>
        <form @submit.prevent="submitForm">
            <div class="mb-3">
                <label for="name" class="form-label">Product Name</label>
                <input v-model="product.name" type="text" class="form-control" id="name" required />
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea v-model="product.description" class="form-control" id="description" required></textarea>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input v-model="product.price" type="number" step="0.01" class="form-control" id="price" required />
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input v-model="product.category" type="text" class="form-control" id="category" required />
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <div v-if="isEdit">
                    <a :href="product.image" target="_blank" type="button" class="btn btn-sm btn-secondary mb-1">view</a>
                </div>
                <input type="file" @change="handleImageUpload" class="form-control" id="image" />
            </div>
            <button type="submit" class="btn btn-primary">{{ isEdit ? 'Update' : 'Create' }}</button>
            <div v-if="errorMsg" class="text-danger mt-2">{{ errorMsg }}</div>
        </form>
    </div>
</template>

<style scoped>
    .product-form-container {
        max-width: 600px;
        margin: 2rem auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>