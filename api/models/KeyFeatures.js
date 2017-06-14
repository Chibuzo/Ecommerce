/**
 * KeyFeatures.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

    attributes: {
        feature_name: {
            type: 'string'
        },
        
        feature_value: {
            type: 'string'
        },
        
        product: {
            model: 'product'
        },
        
        removed: {
            type: 'boolean'
        }
    }
};

