/**
 * BrowseController
 *
 * @description :: Server-side logic for managing Browses
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */


module.exports = {
    async index(req, res) {
        try {
            const [products, categories] = await Promise.all([
                ProductService.fetchProducts(),
                ProductService.fetchCategories(req)
            ]);
            return res.view('products/index', { products, categories, popular_categories: categories.length = 6 });
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
                Product.find({ category: categoryId, removed: false }).populate('productphotos'),
                ProductService.fetchCategories(req)
            ]);
            return res.view('products/index', { products, categories });
        } catch (err) {
            return res.badRequest(err);
        }
    }
};

