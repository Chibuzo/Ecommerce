/**
 * OrderItems.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        merchant: {
            model: 'merchant'
        },

        order: {
            model: 'order'
        },

        product: {
            model: 'product'
        },

        quantity: {
            type: 'integer'
        },

        unit_price: {
            type: 'float'
        }
    }
};

