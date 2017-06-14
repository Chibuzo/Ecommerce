/**
 * CheckoutController
 *
 * @description :: Server-side logic for managing Checkouts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    cartPage: function(req, res) {
        return res.view('cart');
    },
    
    checkoutPage: function(req, res) {
        if (!req.session.userId) {
            return res.view('user/signin', { page: '/payment' });
        }
        BankAccount.find().exec(function(err, acc) {
            if (err) {
                return console.log(err);
            }
            UserContact.findOne({ user: req.session.userId }).exec(function(err, addr) {
                if (err) {
                    return console.log(err);
                }
                return res.view('checkout', { contact: addr, accounts: acc });
            });
        });
    },
    
    confirmationPage: function(req, res) {
        var q = req.param;
        var order = {
            user: req.session.userId,
            item_count: q('itemCount'),
            total: q('total'),
            payment_method: q('payment_method'),
            delivery: q('delivery_opt')
        };
        Order.create(order).exec(function(err, ord) {
            if (err) return console.log(err);
            var item, id;
            for (var i = 1; i < q('itemCount'); i++) {
                id = q('item_options_' + i).split(': ').pop();
                item = {
                    order: ord.id,
                    product: id,
                    qty: q('item_quantity_' + i),
                    unit_price: q('item_price_' + i)
                };
                OrderItems.create(item).exec(function(err) {
                    if (err) return console.log(err);
                });
            }
        });
        return res.view('confirmation');
    }
};

