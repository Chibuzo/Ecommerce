/**
 * OrderController
 *
 * @description :: Server-side logic for managing Orders
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    showAll: function(req, res) {
        Order.find().sort({ createdAt: 'desc' }).exec(function(err, orders) {
            if (err) return console.log(err);
            return res.view('order/index', { orders: orders });
        });
    }
};

