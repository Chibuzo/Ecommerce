/**
 * OrderController
 *
 * @description :: Server-side logic for managing Orders
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    showAll: function (req, res) {
        Order.find().populate('user').sort({ createdAt: 'desc' }).exec(function (err, orders) {
            if (err) return console.log(err);
            return res.view('order/index', { orders: orders });
        });
    },

    async save(req, res) {
        try {
            const { checkout_payment_method: payment_method, delivery_opt, note, shipping = 500, items = [{}] } = req.body;
            const { fname, lname, email, phone, city, state, address, password } = req.body;

            const order_items = JSON.parse(items);
            if (Array.isArray(order_items) && order_items.length < 1) throw Error('No items found');

            const user = req.session.userId ?? await UserService.create({ fname, lname, email, phone, password });
            const userId = typeof user === "object" ? user.id : user;
            await UserContact.create({ phone, city, state, address, user: userId });
            await OrderService.saveOrder({ userId, payment_method, delivery_opt, shipping, items: order_items, note });
            return res.json({ status: 'success' });
        } catch (err) {
            return res.json({ status: 'error', message: err.message });
        }
    },

    changeStatus: function (req, res) {
        Order.update({ id: req.param('id') }, { status: req.param('status') }).exec(function (err) {
            if (err) return;
            return res.json(200, { status: 'success' });
        });
    }
};

