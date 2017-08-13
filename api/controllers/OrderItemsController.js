/**
 * OrderItemsController
 *
 * @description :: Server-side logic for managing Orderitems
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    getOrderItems: function(req, res) {
        OrderItems.find({ order: req.param('order_id') }).populate('product').exec(function(err, items) {
            if (err) return;
            UserContact.findOne({ user: req.param('user_id') }).exec(function(err, address) {
                if (err) return;
                return res.json(200, { status: 'success', items: items, address: address.address });
            });
        });
    }
};

