/**
 * SubCategoryController
 *
 * @description :: Server-side logic for managing Subcategories
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    addNew: function(req, res) {
        var data = {
            sub_category_name: req.param('sub_category'),
            category: req.param('category_id')
        };
        SubCategory.create(data).exec(function(err) {
            if (err) {
                return res.badRequest(err);
            }
            return res.redirect('/admin/settings');
        });
    },
    
    getSubCategories: function(req, res) {
        var category_id = req.param('category_id');
        SubCategory.find({ category: category_id }).exec(function(err, sub) {
            if (err) console.log(err);
            return res.json(200, { status: 'success', sub_cat: sub });
        });
    },
    
    update: function(req, res) {
        var q = req.param;
        var data = {
            sub_category_name: q('sub_category'),
            category: q('category'),
        };
        SubCategory.update({ id: q('id') }, data).exec(function() {
            return res.json(200);
        });
    },
    
    
    remove: function(req, res) {
        SubCategory.update({ id: req.param('id') }, { removed: true }).exec(function() {
            return res.json(200);  
        });
    }
};

