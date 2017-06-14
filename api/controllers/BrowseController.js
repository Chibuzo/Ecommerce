/**
 * BrowseController
 *
 * @description :: Server-side logic for managing Browses
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    index: function(req, res) {
        Product.find({ removed: false }).populate('productphotos').exec(function(err, items) {
            if (err) return res.badRequest(err);
            return res.view('products/index', { products: items });
        });
    },
    
    itemDisplay: function(req, res) {
        Product.findOne({ id: req.param('id') }).populate('productphotos').populate('keyfeatures').exec(function(err, item) {
            if (err) return res.badRequest(err);
            return res.view('products/view-item', { item: item });
        });
    },
    
    findByCategory: function(req, res) {
      
    }
};

