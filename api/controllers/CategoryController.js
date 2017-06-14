/**
 * CategoryController
 *
 * @description :: Server-side logic for managing Categories
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    addNew: function(req, res) {
        var data = {
            category_name: req.param('category'),
            removed: 'false'
        };
        Category.create(data).exec(function(err) {
            if (err) {
                return res.badRequest(err);
            }
            return res.redirect('/admin/settings');
        });
    }
};

