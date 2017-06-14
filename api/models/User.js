/**
 * User.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        fullname: {
          type: 'string'
        },
    
        email: {
          type: 'string',
          email: 'true',
          unique: 'true'
        },
    
        phone: {
          type: 'string'
        },
    
        password: {
          type: 'string'
        },
        
        contacts: {
            collection: 'usercontact',
            via: 'user'
        },
        
        orders: {
            collection: 'order',
            via: 'user'
        },
        
        admin: {
            type: 'boolean'
        },
    
        deleted: {
          type: 'boolean'
        },
    
        banned: {
          type: 'boolean'
        }
    }
};

