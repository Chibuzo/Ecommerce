/**
 * KeyFeaturesController
 *
 * @description :: Server-side logic for managing Keyfeatures
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    addFeature: function(req, res) {
        var data = {
            feature_name: req.param('feature'),
            feature_value: req.param('feature_value'),
            product: req.param('product_id')
        };
        KeyFeatures.create(data).exec(function(err) {
            if (err) return res.badRequest(err);
            res.redirect('/item/' + req.param('product_id'));
        });
    },
    
    update: function(req, res) {
        var data = {
            feature_name: req.param('feature'),
            feature_value: req.param('feature_value'),
        };
        KeyFeatures.update({ id: req.param('id') }, data).exec(function(err) {
            if (err) return res.badRequest(err);
            res.redirect('/item/' + req.param('product_id'));
        });
    },
    
    removeFeature: function(req, res) {
        KeyFeatures.update({ id: req.param('id') }, { removed: true }).exec(function(err, feat) {
            if (err) console.log(err);
            res.redirect('/item/' + feat[0].product);            
        });
        
    }
};

