/**
 * BankAccountController
 *
 * @description :: Server-side logic for managing Bankaccounts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    addBankAccount: function(req, res) {
        var data = {
            bank: req.param('bank'),
            account_name: req.param('account_name'),
            account_number: req.param('account_number')
        };

        BankAccount.create(data).exec(function(err) {
            if (err) {
                console.log(err);
            }
            return res.redirect('/admin/settings');
        });
    },
    
    getAccounts: function (req, res) {
        BankAccount.find().exec(function(err, account) {
            return res.view('account/index', { account_details: account });
        });
    }
};

