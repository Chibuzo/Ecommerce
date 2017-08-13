/**
 * CategoryController
 *
 * @description :: Server-side logic for managing Categories
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    addNew: function(req, res) {
        var data = {
            category_name: req.param('category')
        };
        Category.create(data).exec(function(err) {
            if (err) {
                return res.badRequest(err);
            }
            return res.redirect('/admin/settings');
        });
    },
    
    update: function(req, res) {
        Category.update({ id: req.param('id') }, { category_name: req.param('category') }).exec(function(err) {
            if (err) return;
            return res.json(200);
        });
    },
    
    remove: function(req, res) {
        Category.update({ id: req.param('id') }, { removed: true }).exec(function() {
         return res.json(200);  
        });
    }
};

