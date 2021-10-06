/**
 * CheckoutController
 *
 * @description :: Server-side logic for managing Checkouts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    cartPage: function (req, res) {
        return res.view('cart');
    },

    checkoutPage: function (req, res) {

        return res.view('checkout');
    },

    confirmationPage: function (req, res) {
        return res.view('confirmation');
    }
};

