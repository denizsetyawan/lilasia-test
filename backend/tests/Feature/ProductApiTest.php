<?php

namespace Tests\Unit;

use App\Models\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ProductApiTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test product creation.
     *
     * @return void
     */
    public function test_product_creation(): void
    {
        $product = Product::factory()->create([
            'name' => 'Test Product',
            'description' => 'This is a test product.',
            'price' => 99.99,
            'category' => 'Test Category',
            'image' => 'test_image.jpg',
        ]);

        $this->assertDatabaseHas('products', [
            'name' => 'Test Product',
            'description' => 'This is a test product.',
            'price' => 99.99,
            'category' => 'Test Category',
            'image' => 'test_image.jpg',
        ]);
    }

    /**
     * Test reading a product.
     *
     * @return void
     */
    public function test_product_reading(): void
    {
        $product = Product::factory()->create([
            'name' => 'Test Product',
            'description' => 'This is a test product.',
            'price' => 99.99,
            'category' => 'Test Category',
            'image' => 'test_image.jpg',
        ]);

        $foundProduct = Product::find($product->id);

        $this->assertEquals($product->name, $foundProduct->name);
        $this->assertEquals($product->description, $foundProduct->description);
        $this->assertEquals($product->price, $foundProduct->price);
        $this->assertEquals($product->category, $foundProduct->category);
        $this->assertEquals($product->image, $foundProduct->image);
    }

    /**
     * Test updating a product.
     *
     * @return void
     */
    public function test_product_updating(): void
    {
        $product = Product::factory()->create([
            'name' => 'Test Product',
            'description' => 'This is a test product.',
            'price' => 99.99,
            'category' => 'Test Category',
            'image' => 'test_image.jpg',
        ]);

        $product->update([
            'name' => 'Updated Test Product',
            'price' => 199.99,
        ]);

        $this->assertDatabaseHas('products', [
            'id' => $product->id,
            'name' => 'Updated Test Product',
            'price' => 199.99,
        ]);
    }

    /**
     * Test deleting a product.
     *
     * @return void
     */
    public function test_product_deleting(): void
    {
        $product = Product::factory()->create([
            'name' => 'Test Product',
            'description' => 'This is a test product.',
            'price' => 99.99,
            'category' => 'Test Category',
            'image' => 'test_image.jpg',
        ]);

        // Delete the product
        $product->delete();

        // Assert that the product is missing from the database
        $this->assertDatabaseMissing('products', [
            'id' => $product->id,
        ]);
    }
}

