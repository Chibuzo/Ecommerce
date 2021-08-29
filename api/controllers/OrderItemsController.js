/**
 * OrderItemsController
 *
 * @description :: Server-side logic for managing Orderitems
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    async getOrderItems(req, res) {
        try {
            const [items, address] = await Promise.all([
                OrderItems.find({ order: req.param('order_id') }).populate('product'),
                UserContact.findOne({ user: req.param('user_id') })
            ]);
            return res.json(200, { status: 'success', items, address: address.address });
        } catch (err) {
            return res.json(500, { status: 'error', message: err.message });
        }
    }
};

