/**
 * OrderController
 *
 * @description :: Server-side logic for managing Orders
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    showAll: function(req, res) {
        Order.find().populate('user').sort({ createdAt: 'desc' }).exec(function(err, orders) {
            if (err) return console.log(err);
            return res.view('order/index', { orders: orders });
        });
    },
    
    changeStatus: function(req, res) {
        Order.update({ id: req.param('id') }, { status: req.param('status') }).exec(function(err) {
            if (err) return;
            return res.json(200, { status: 'success' });
        });
    }
};

