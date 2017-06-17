/**
 * ProductPhotoController
 *
 * @description :: Server-side logic for managing Productphotoes
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var gm = require('gm');

module.exports = {
    addPhoto: function(req, res) {
        var filename;
        var allowedImgTypes = ['image/png', 'image/jpeg', 'image/gif'];
        
        var old_photo = req.param('photo_name').split('.')[0];
        req.file('photo').upload({
            dirname: require('path').resolve(sails.config.appPath, 'assets/product_photos/zoom/'),
            saveAs: function(file, cb) {
                if (allowedImgTypes.indexOf(file.headers['content-type']) === -1) {
                    return res.badRequest('Unsupported picture format.');
                }
                if (old_photo == 'product') {
                    var ext = file.filename.split('.').pop();
                    var hr = process.hrtime();
                    filename = hr[1] + '.' + ext; 
                } else {
                    filename = req.param('photo_name');
                }
                return cb(null, filename);
            }
        },
        function(err) {
            if (err) {
                return res.badRequest(err);
            }
            if (old_photo == 'product') {
                var data = {
                    photo_name: filename,
                    product: req.param('product_id')
                };
                ProductPhoto.create(data).exec(function(err) {
                    if (err) return res.badRequest(err);
                });
            }
            // resize product photos
            // zoom image
            gm(sails.config.appPath + '/assets/product_photos/zoom/' + filename)
            .resizeExact(245, null)
            .write(sails.config.appPath + '/assets/product_photos/' + filename, function (err) {
                if (err) console.log(err);
            });
            
            // browse image
            gm(sails.config.appPath + '/assets/product_photos/zoom/' + filename)
            .resizeExact(null, 200)
            .write(sails.config.appPath + '/assets/product_photos/browse/' + filename, function (err) {
                if (err) console.log(err);
            });
            
            // thumbnail image
            gm(sails.config.appPath + '/assets/product_photos/zoom/' + filename)
            .resizeExact(null, 89)
            .write(sails.config.appPath + '/assets/product_photos/thumbnail/' + filename, function () {
                if (err) console.log('done');
            });
            return res.redirect('/item/' + req.param('product_id'));
        });
    },
    
    deletePhoto: function(req, res) {
        var photo_name = req.param('picname');
        ProductPhoto.destroy({ photo_name: photo_name }).exec(function(err) {
            if (err) return console.log(err);
            const fs = require('fs');
            fs.stat(sails.config.appPath + '/assets/product_photos/' + photo_name, function(err) {
                if (err) {
                    console.log(err);
                    return;
                }
                fs.unlink(sails.config.appPath + '/assets/product_photos/' + photo_name);
                fs.unlink(sails.config.appPath + '/assets/product_photos/zoom/' + photo_name);
                fs.unlink(sails.config.appPath + '/assets/product_photos/browse/' + photo_name);
                fs.unlink(sails.config.appPath + '/assets/product_photos/thumbnail/' + photo_name);
            });
            return res.json(200, { status: 'success' });
        });
    }
};

