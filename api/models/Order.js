/**
 * Order.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        user: {
            model: 'user'
        },

        item_count: {
            type: 'integer'
        },

        total: {
            type: 'string'
        },

        payment_method: {
            type: 'string'
        },

        payment: {
            model: 'payment'
        },

        status: {
            type: 'string',  // Pending, Processing, Delivered, cancelled
            defaultsTo: 'Pending'
        },

        delivery: {
            type: 'string'  // Pick up, Courier
        },

        delivery_fee: {
            type: 'float'
        },

        delivery_note: {
            type: 'text'
        }
    }
};

