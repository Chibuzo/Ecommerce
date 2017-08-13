/**
 * SubCategory.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        sub_category_name:  {
            type: 'string',
            unique: 'true'
        },
        
        category: {
            model: 'category'
        },
        
        products: {
            collection: 'product',
            via: 'sub_category'
        },
        
        removed: {
            type: 'boolean',
            defaultsTo: 'false'
        }
    }
};

