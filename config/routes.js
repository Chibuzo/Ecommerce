module.exports.routes = {

    '/': 'BrowseController.index',
    
    //'GET /admin/login': {
    //    veiw: 'admin/login'
    
    'GET /admin/login': 'AdminController.showLogin',
    
    'GET /admin/add': {
        view: 'admin/create'
    },

    'GET /user/signin': {
        view: 'user/signin'
    },

    'GET /user/signup': {
        view: 'user/signup'
    },
    
    'POST /user/signup': 'UserController.signup',

    'POST /user/signin': 'UserController.signin',

    'GET /user/signout': 'UserController.signout',

    'GET /user/dashboard': 'UserController.dashboard',
    
    'POST /user/update-details': 'UserController.updateDetails',
    
    'POST /admin/login': 'AdminController.login',
    
    'POST /admin/create': 'AdminController.addAdmin',

    'GET /admin/dashboard': 'AdminController.dashboard',

    'GET /admin/settings': 'AdminController.settings',
    
    'POST /account/add-account': 'BankAccountController.addBankAccount',
    
    'POST /category/add-new': 'CategoryController.addNew',
    
    'POST /category/update': 'CategoryController.update',
    
    'POST /category/delete': 'CategoryController.remove',
    
    'POST /sub-category/add-new': 'SubCategoryController.addNew',
    
    'POST /sub-category/update': 'SubCategoryController.update',
    
    'POST /sub-category/delete': 'SubCategoryController.remove',
    
    'GET /sub-category/get-sub': 'SubCategoryController.getSubCategories',
    
    'GET /inventory/show-all': 'ProductController.getAll',
    
    'POST /product/add-new': 'ProductController.addNew',
    
    'POST /product-photo/add-photo': 'ProductPhotoController.addPhoto',
    
    'GET /productphoto/delete/:picname': 'ProductPhotoController.deletePhoto',
    
    'POST /product/edit': 'ProductController.update',
    
    'GET /product/delete/:id': 'ProductController.deleteProduct',
    
    'POST /product/add-feature': 'KeyFeaturesController.addFeature',
    
    'POST /product/update-feature': 'KeyFeaturesController.update',
    
    'GET /remove-feature/:id': 'KeyFeaturesController.removeFeature',
    
    'GET /item/:id': 'ProductController.showItem',
    
    'GET /item/view/:id': 'BrowseController.itemDisplay',
    
    'GET /view-cart': 'CheckoutController.cartPage',
    
    'GET /checkout': 'CheckoutController.checkoutPage',
    
    'POST /checkout/cart-items': 'CheckoutController.confirmationPage',
    
    'GET /order/show-all': 'OrderController.showAll', 
    
    //'GET /payment': 'PaymentController.paymentPage'
    // category route
    //'GET /*/:id': 'BrowseController.findByCategory'
};
