/**
 * Product.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        product_name: {
            type: 'string'
        },
        
        description: {
            type: 'string'
        },
        
        category: {
            model: 'category'
        },
        
        sub_category: {
            model: 'subcategory'
        },
        
        stock: {
            type: 'integer'
        },
        
        color: {
            type: 'string'
        },
        
        cost_price: {
            type: 'float'
        },
        
        selling_price: {
            type: 'float'
        },
        
        productphotos: {
            collection: 'productphoto',
            via: 'product'
        },
        
        keyfeatures: {
            collection: 'keyfeatures',
            via: 'product'
        },
        
        removed: {
            type: 'boolean',
            defaultsTo: 'false'
        }
    }
};

