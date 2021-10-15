/**
 * BrowseController
 *
 * @description :: Server-side logic for managing Browses
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const ProductService = require("../services/ProductService");


module.exports = {
    async index(req, res) {
        try {
            const [products, categories, newArrivals] = await Promise.all([
                ProductService.fetchProducts(),
                ProductService.fetchCategories(req),
                ProductService.fetchNewArrivals()
            ]);
            return res.view('products/index', { products, newArrivals, categories, popular_categories: categories.length = 6 });
        } catch (err) {
            return res.badRequest(err);
        }
    },

    async itemDisplay(req, res) {
        try {
            const [product, categories] = await Promise.all([
                ProductService.fetchProduct(req.params.id),
                ProductService.fetchCategories(req)
            ]);

            if (!product) throw new Error('Item not found!');
            return res.view('products/view-item', { item: product, categories });
        } catch (err) {
            return res.badRequest(err);
        }
    },

    async findByCategory(req, res) {
        try {
            const categoryId = req.param('id');
            const [products, categories] = await Promise.all([
                ProductService.findByCategory(categoryId),
                ProductService.fetchCategories(req)
            ]);
            return res.view('products/index', { products, categories });
        } catch (err) {
            return res.badRequest(err);
        }
    },

    async findBySubCategory(req, res) {
        try {
            const subCategoryId = req.param('id');
            const [products, categories] = await Promise.all([
                ProductService.findBySubCategory(subCategoryId),
                ProductService.fetchCategories(req)
            ]);
            return res.view('products/index', { products, categories });
        } catch (err) {
            return res.badRequest(err);
        }
    }
};

