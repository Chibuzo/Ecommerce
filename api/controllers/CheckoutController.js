/**
 * CheckoutController
 *
 * @description :: Server-side logic for managing Checkouts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    async cartPage(req, res) {
        const categories = await ProductService.fetchCategories(req);
        return res.view('cart', { categories });
    },

    async checkoutPage(req, res) {
        const categories = await ProductService.fetchCategories(req);
        return res.view('checkout', { user: req.session.user, categories });
    },

    async confirmationPage(req, res) {
        const categories = await ProductService.fetchCategories(req);
        return res.view('confirmation', { categories });
    }
};

