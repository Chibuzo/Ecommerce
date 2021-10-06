/**
 * ProductPhotoController
 *
 * @description :: Server-side logic for managing Productphotoes
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const fs = require('fs');
const path = require('path');
const Jimp = require('jimp');

module.exports = {
    addPhoto: function (req, res) {
        let filename;
        const allowedImgTypes = ['image/png', 'image/jpeg', 'image/gif'];
        const originalPhotoPath = 'assets/product_photos/zoom';

        const old_photo = req.param('photo_name').split('.')[0];
        req.file('photo').upload({
            dirname: require('path').resolve(sails.config.appPath, originalPhotoPath),
            saveAs: function (file, cb) {
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
            function (err) {
                if (err) {
                    return res.badRequest(err);
                }
                if (old_photo == 'product') {
                    var data = {
                        photo_name: filename,
                        product: req.param('product_id')
                    };
                    ProductPhoto.create(data).exec(function (err) {
                        if (err) return res.badRequest(err);
                    });
                }
                // resize product photos
                try {
                    const uploadedPhoto = path.resolve(sails.config.appPath, originalPhotoPath) + '/' + filename;

                    Jimp.read(uploadedPhoto, (err, photo) => {
                        if (err) return console.log(err);

                        // resize zoom
                        const zoomphoto = path.resolve(sails.config.appPath, 'assets/product_photos') + '/' + filename;
                        const zoomTemp = path.resolve(sails.config.appPath, '.tmp/public/product_photos') + '/' + filename;
                        photo
                            .resize(700, 700)
                            .quality(90)
                            .write(zoomphoto);

                        const zoomCRS = fs.createReadStream(zoomphoto);
                        const zoomCWS = fs.createWriteStream(zoomTemp);
                        zoomCRS.on('error', (err) => console.log(err));
                        zoomCWS.on('error', (err) => console.log('Write Error'));

                        zoomCRS.pipe(zoomCWS);

                        // resize browse
                        const browse = path.resolve(sails.config.appPath, 'assets/product_photos/browse') + '/' + filename;
                        const browseTemp = path.resolve(sails.config.appPath, '.tmp/public/product_photos/browse') + '/' + filename;

                        photo
                            .resize(400, 400)
                            .quality(90)
                            .write(browse);

                        const bwsCRS = fs.createReadStream(browse);
                        const bwsCWS = fs.createWriteStream(browseTemp);
                        bwsCRS.on('error', (err) => console.log(err));
                        bwsCWS.on('error', (err) => console.log('Write Error'));

                        bwsCRS.pipe(bwsCWS);

                        const thumbphoto = path.resolve(sails.config.appPath, 'assets/product_photos/thumbnail') + '/' + filename;
                        const thumbTemp = path.resolve(sails.config.appPath, '.tmp/public/product_photos/thumbnail') + '/' + filename;

                        photo
                            .resize(100, 100)
                            .quality(90)
                            .write(thumbphoto);

                        const thumbCRS = fs.createReadStream(thumbphoto);
                        const thumbCWS = fs.createWriteStream(thumbTemp);
                        thumbCRS.on('error', (err) => console.log(err));
                        thumbCWS.on('error', (err) => console.log('Write Error'));

                        thumbCRS.pipe(thumbCWS);
                    });

                } catch (err) {
                    console.log(err);
                }

                return res.redirect('/item/' + req.param('product_id'));
            });
    },

    async deletePhoto(req, res) {
        const { unlink } = require('fs/promises');
        const photo_name = req.param('picname');
        try {
            await Promise.all([
                ProductPhoto.destroy({ photo_name: photo_name }),
                unlink(sails.config.appPath + '/assets/product_photos/' + photo_name),
                unlink(sails.config.appPath + '/assets/product_photos/zoom/' + photo_name),
                unlink(sails.config.appPath + '/assets/product_photos/browse/' + photo_name),
                unlink(sails.config.appPath + '/assets/product_photos/thumbnail/' + photo_name)
            ]);
        } catch (err) {
            return res.serverError(err);
        }
        return res.json(200, { status: 'success' });
    }
};

