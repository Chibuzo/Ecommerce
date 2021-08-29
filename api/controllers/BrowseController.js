/**
 * BrowseController
 *
 * @description :: Server-side logic for managing Browses
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const Product = require("../models/Product");
const ProductService = require("../services/ProductService");

module.exports = {
    async index(req, res) {
        try {
            const products = await ProductService.fetchProducts();
            return res.view('products/index', { products });
        } catch (err) {
            return res.badRequest(err);
        }
    },

    itemDisplay: function (req, res) {
        Product.findOne({ id: req.param('id') }).populate('productphotos').populate('keyfeatures').exec(function (err, item) {
            if (err) return res.badRequest(err);
            return res.view('products/view-item', { item: item });
        });
    },

    findByCategory: function (req, res) {
        var id = req.param('id');
        Product.find({ category: id, removed: false }).populate('productphotos').exec(function (err, items) {
            if (err) return res.badRequest(err);
            return res.view('products/index', { products: items });
        });
    }
};

