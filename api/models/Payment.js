/**
 * Payment.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        order: {
            model: 'order'
        },

        user: {
            model: 'user'
        },

        amount: {
            type: 'float'
        },

        payment_method: {
            type: 'string'
        },

        reference: {
            type: 'string'
        },

        status: {
            type: 'string',
            defaultsTo: 'Pending'
        }
    }
};

