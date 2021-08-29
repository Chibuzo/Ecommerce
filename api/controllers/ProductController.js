/**
 * ProductController
 *
 * @description :: Server-side logic for managing Products
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    async getAll(req, res) {
        try {
            const [items, categories, merchants] = await Promise.all([
                Product.find({ removed: 'false' }).populate('category').populate('sub_category').sort({ createdAt: 'desc' }),
                Category.find({ removed: 'false' }),
                Merchant.find({ status: 'active' })
            ]);

            return res.view('inventory/index', { items, categories, merchants });
        } catch (err) {
            res.serverError(err);
        }
    },

    addNew: function (req, res) {
        var q = req.param;
        var data = {
            product_name: q('product_name'),
            description: q('description'),
            merchant: q('merchant'),
            category: q('category_id'),
            sub_category: q('sub_category_id'),
            stock: q('stock'),
            selling_price: q('price'),
        };
        Product.create(data).exec(function (err, item) {
            if (err) return res.badRequest(err);
            return res.redirect('/item/' + item.id);
        });
    },

    update: function (req, res) {
        var q = req.param;
        var data = {
            product_name: q('product_name'),
            description: q('description'),
            category: q('category_id'),
            sub_category: q('sub_category_id'),
            stock: q('stock'),
            color: q('color'),
            cost_price: q('cost'),
            selling_price: q('price'),
        };
        Product.update({ id: q('product_id') }, data).exec(function (err) {
            if (err) return res.badRequest(err);
            return res.redirect('/item/' + q('product_id'));
        });
    },

    showItem: function (req, res) {
        var id = req.param('id');
        Product.findOne({ id: id }).populate('productphotos').populate('keyfeatures').exec(function (err, item) {
            if (err) res.badRequest(err);
            // process product photos
            if (!_.isUndefined(item)) {
                var photos = [];
                for (var i = 0; i < 4; i++) {
                    if (!_.isUndefined(item.productphotos[i])) {
                        photos.push(item.productphotos[i].photo_name);
                    } else {
                        photos.push('product.png');
                    }
                }
                return res.view('inventory/itempage', { item: item, photos: photos });
            }
        });
    },

    deleteProduct: function (req, res) {
        var id = req.param('id');
        Product.update({ id: id }, { removed: true }).exec(function (err) {
            if (err) return console.log(err);
            return res.redirect('/inventory/show-all');
        });
    }
};

