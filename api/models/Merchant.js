/**
 * Merchant.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        name: {
            type: 'string',
            unique: 'true'
        },

        email: {
            type: 'string',
            unique: 'true'
        },

        address: {
            type: 'string'
        },

        phone: {
            type: 'string'
        },

        status: {
            type: 'string',
            defaultsTo: 'active'
        }
    }
}

