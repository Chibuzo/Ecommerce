const UtillityService = require("./UtillityService");

module.exports = {
    fetchProducts: async () => {
        const products = await Product.find({ removed: false, stock: { '>': 0 } }).populate('productphotos');
        return products.map(product => ({
            product_name: product.product_name,
            description: product.description,
            quantity: product.stock,
            colour: product.color,
            price: UtillityService.formateCurrency(product.selling_price)
        }));
    }
}