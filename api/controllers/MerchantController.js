/**
 * MerchantController
 *
 * @description :: Server-side logic for managing Merchants
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */


module.exports = {
    async view(req, res) {
        const merchants = await Merchant.find();
        res.view('merchant/index', { merchants });
    },

    async create(req, res) {
        const { name, address, email, phone } = req.body;
        try {
            await Merchant.create({ name, address, email, phone });
            res.redirect('/merchants/show-all');
        } catch (err) {
            console.log(err)
            res.serverError(err);
        }
    }
};

