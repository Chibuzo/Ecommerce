/**
 * PaymentController
 *
 * @description :: Server-side logic for managing Payments
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    async confirmPayment(req, res) {
        try {
            if (!req.body.reference) throw new Error('Payment reference not found');
            const { reference, status, amount, orderId } = req.body;

            const order = await Order.findOne(orderId);
            if (!order) throw new Error('Order not found');

            const data = {
                order: orderId,
                payment_method: order.payment_method,
                user: order.user,
                amount,
                reference,
                status
            };
            if (! await Payment.create(data)) throw new Error('Error saving payment details');

            const reservationStatus = status == 'success' ? 'Paid' : 'Pending';
            // EmailService.sendOrderDetails(reservation);
            return res.json({ status: 'success' });
        } catch (err) {
            return res.json({ status: 'error', message: err.message });
        }
    }
};

