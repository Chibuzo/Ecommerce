
module.exports = {
    fetchProducts: async (criteria = {}) => {
        const products = await Product.find({
            limit: 30, ...criteria, removed: false, stock: { '>': 0 }
        }).populate('merchant').populate('productphotos');

        return products.map(product => sanitizeProduct(product));
    },

    fetchProduct: async id => {
        const product = await Product.findOne(id).populate('merchant').populate('productphotos').populate('keyfeatures');
        return sanitizeProduct(product);
    },

    fetchCategories: async req => {
        if (req.session.categories) return req.session.categories;

        req.session.categories = await Category.find({ removed: false, select: ['id', 'category_name'] })
            .populate('subcategories', { removed: false, select: ['id', 'sub_category_name'] });
        req.session.save();
        return req.session.categories;
    },

    fetchNewArrivals: async () => {
        const criteria = {
            limit: 12,
            sort: 'createdAt DESC'
        };
        return module.exports.fetchProducts(criteria);
    },

    findByCategory: async categoryId => {
        return module.exports.fetchProducts({ category: categoryId });
    },

    findBySubCategory: async subCategoryId => {
        return module.exports.fetchProducts({ sub_category: subCategoryId });
    }


}

function sanitizeProduct(product) {
    return {
        id: product.id,
        product_name: product.product_name,
        description: product.description,
        quantity: product.stock,
        colour: product.color,
        price: UtillityService.formateCurrency(product.selling_price),
        unformatted_price: product.selling_price,
        productphotos: product.productphotos,
        photo: product.productphotos[0] && product.productphotos[0].photo_name || 'product.png',
        keyfeatures: product.keyfeatures || [],
        merchant: product.merchant
    }
}