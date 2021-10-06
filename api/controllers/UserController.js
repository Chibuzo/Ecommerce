/**
 * UserController
 *
 * @description :: Server-side logic for managing Users
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var Emailaddresses = require('machinepack-emailaddresses');
var Passwords = require('machinepack-passwords');

module.exports = {
    signup: function (req, res) {

    },

    //activateAccount: function(req, res) {
    //
    //},

    findAccount: function (req, res) {
        User.findOne({ email: req.param('email') }).exec(function (err, foundUser) {
            if (err) return res.json(200, { status: 'Err', msg: err });
            if (!foundUser) return res.json(200, { status: 'Err', msg: 'User not found' });
            return res.json(200, { status: 'Found' });
        });
    },

    signin: function (req, res) {
        User.findOne({ email: req.param('email') }).exec(function (err, foundUser) {
            if (err) return res.json(200, { status: 'Err', msg: err });
            if (!foundUser) return res.json(200, { status: 'Err', msg: 'User not found' });

            Passwords.checkPassword({
                passwordAttempt: req.param('l_password'),
                encryptedPassword: foundUser.password
            }).exec({
                error: function (err) {
                    return res.json(200, { status: 'Err', msg: err });
                },
                incorrect: function () {
                    return res.json(200, { status: 'Err', msg: 'User not found' });
                },
                success: function () {
                    if (foundUser.deleted) {
                        return res.json(200, { status: 'Err', msg: "'Your account has been deleted. Please visit http://cpbit.com/restore to restore your account.'" });
                    }

                    if (foundUser.banned) {
                        return res.json(200, { status: 'Err', msg: "'Your account has been banned, most likely for violation of the Terms of Service. Please contact us.'" });
                    }
                    req.session.userId = foundUser.id;
                    req.session.fname = foundUser.fullname;
                    req.session.admin = foundUser.admin;
                    var user_type = foundUser.admin ? 'admin' : 'user';
                    return res.json(200, { status: 'Ok', user_type: user_type });
                }
            });
        });
    },

    dashboard: function (req, res) {
        if (!req.session.userId) {
            return res.view('user/signin');
        }
        User.findOne({ id: req.session.userId }).populate('contacts').exec(function (err, user) {
            if (err) {
                return res.negotiate(err);
            }
            return res.view('user/dashboard', { user: user });
        });
    },

    updateDetails: function (req, res) {
        var q = req.param;
        var data = {
            phone: q('phone'),
            address: q('address'),
            user: req.session.userId
        };
        User.update({ id: q('user_id') }, { fullname: q('fullname'), phone: q('phone') }).exec(function () { });
        UserContact.findOne({ id: q('contact_id') }).exec(function (err, cn) {
            if (err) { return res.json(200, { status: 'error', msg: err }); }
            if (cn) {
                UserContact.update({ id: q('contact_id') }, data).exec(function () { });
            } else {
                UserContact.create(data).exec(function (err) {
                    if (err) console.log(err);
                });
            }
        });
        return res.json(200, { status: 'success' });
    },

    signout: function (req, res) {
        if (!req.session.userId) return res.redirect('/');
        User.findOne(req.session.userId, function foundUser(err, createdUser) {
            if (err) return res.negotiate(err);

            if (!createdUser) {
                sails.log.verbose('Session refers to a user who no longer exists.');
                return res.redirect('/');
            }
            req.session.userId = null;
            return res.redirect('/');
        });
    },

    profile: function (req, res) {
        User.findOne(req.session.userId, function (err, _user) {
            return res.view('user/profile', { user: _user, acc: account });
        });
    },

    updateProfile: function (req, res) {
        var udata = {
            fullname: req.param('fullname'),
            email: req.param('email'),
            phone: req.param('phone')
        };
        User.update({ id: req.session.userId }, udata).exec(function (err) {
            if (err) {
                return res.negotiate(err);
            }
            return res;
        });
    }
};

