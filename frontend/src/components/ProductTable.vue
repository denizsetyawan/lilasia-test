<script>
    import { ref, onMounted, computed } from 'vue';
    import axios from 'axios';
    import router from '@/router';

    export default {
        setup() {
            const getUserRole = () => {
                return localStorage.getItem('userRole');
            };

            const products = ref([]);
            const categories = ref([]);
            const selectedCategory = ref('All');
            const minPrice = ref(0);
            const maxPrice = ref(0);
            const userRole = getUserRole();
            const isAdmin = userRole === 'admin';

            const fetchProducts = async () => {
                try {
                    const response = await axios.get('/api/products');
                    products.value = response.data;
                    products.value.sort((a, b) => b.id - a.id);

                    // Extract unique categories from products
                    const uniqueCategories = [...new Set(products.value.map(product => product.category))];
                    categories.value = ['All', ...uniqueCategories];

                    // Set maxPrice to the highest product price as default
                    maxPrice.value = Math.max(...products.value.map(product => product.price));
                } catch (error) {
                    console.error('Error fetching products:', error);
                }
            };

            const filteredProducts = computed(() => {
                return products.value.filter(product => {
                    const isCategoryMatch = selectedCategory.value === 'All' || product.category === selectedCategory.value;
                    const isPriceMatch = product.price >= minPrice.value && product.price <= maxPrice.value;
                    return isCategoryMatch && isPriceMatch;
                });
            });

            // Fungsi untuk mengedit produk
            const editProduct = (id) => {
                router.push(`/products/${id}`);
            };

            // Fungsi untuk menghapus produk
            const deleteProduct = async (id) => {
                if (confirm('Are you sure you want to delete this product?')) {
                    try {
                        await axios.delete(`/api/products/${id}`);
                        await fetchProducts();
                    } catch (error) {
                        console.error('Error deleting product:', error);
                    }
                }
            };

            onMounted(fetchProducts);

            return {
                products,
                categories,
                selectedCategory,
                minPrice,
                maxPrice,
                filteredProducts,
                isAdmin,
                editProduct,
                deleteProduct
            };
        }
    }
</script>

<template>
    <div>
        <h1>Product List</h1>

        <!-- Filter by Category -->
        <div class="mb-3">
            <label for="categoryFilter" class="form-label">Filter by Category:</label>
            <select id="categoryFilter" v-model="selectedCategory" class="form-select">
                <option v-for="category in categories" :key="category" :value="category">
                    {{ category }}
                </option>
            </select>
        </div>

        <!-- Filter by Price Range -->
        <div class="mb-3">
            <label for="priceRange" class="form-label">Filter by Price Range:</label>
            <div class="d-flex align-items-center">
                <input type="number" v-model="minPrice" class="form-control me-2" placeholder="Min Price" />
                <input type="number" v-model="maxPrice" class="form-control" placeholder="Max Price" />
            </div>
        </div>

        <RouterLink class="btn btn-primary mb-3" to="/products/create" v-if="isAdmin">Create</RouterLink>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Image</th>
                    <th v-if="isAdmin">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(product, index) in filteredProducts" :key="product.id">
                    <td>{{ index + 1 }}</td>
                    <td>{{ product.name }}</td>
                    <td>{{ product.description }}</td>
                    <td>{{ product.price }}</td>
                    <td>{{ product.category }}</td>
                    <td>
                        <img :src="product.image" alt="Product Image" width="50" />
                    </td>
                    <td v-if="isAdmin">
                        <button class="btn btn-sm btn-info mx-1" @click="editProduct(product.id)">Edit</button>
                        <button class="btn btn-sm btn-danger mx-1" @click="deleteProduct(product.id)">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
