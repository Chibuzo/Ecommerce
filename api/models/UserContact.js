/**
 * UserContact.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        phone: {
            type: 'string'
        },

        address: {
            type: 'string'
        },

        city: {
            type: 'string'
        },

        state: {
            type: 'string'
        },

        user: {
            model: 'user'
        }
    }
};

