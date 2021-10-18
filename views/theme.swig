<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>ShoppingAnswer - {{ title }}</title>
    <link rel="icon" type="image/png" href="/images/favicon.png"><!-- fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i"><!-- css -->
    <link rel="stylesheet" href="/styles/font-awesome.min.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/style.css"><!-- js -->
    <link rel="stylesheet" href="/css/custom.css">
    <link rel="stylesheet" href="/css/all.min.css"><!-- font - stroyka -->
    <link rel="stylesheet" href="/fonts/stroyka/stroyka.css">
</head>

<body>
    <!-- quickview-modal -->
    <div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content"></div>
        </div>
    </div><!-- quickview-modal / end -->
    <!-- mobilemenu -->
    <div class="mobilemenu">
        <div class="mobilemenu__backdrop"></div>
        <div class="mobilemenu__body">
            <div class="mobilemenu__header">
                <div class="mobilemenu__title">Menu</div>
                <button type="button" class="mobilemenu__close">
                    <svg width="20px" height="20px">
                        <use xlink:href="/images/sprite.svg#cross-20"></use>
                    </svg>
                </button>
            </div>
            <div class="mobilemenu__content">
                <ul class="mobile-links mobile-links--level--0" data-collapse data-collapse-opened-class="mobile-links__item--open">
                   <!-- <li class="mobile-links__item" data-collapse-item>
                        <div class="mobile-links__item-title">
                            <a href="/" class="mobile-links__item-link">Home</a>
                        </div>
                    </li>-->
                    <li class="mobile-links__item" data-collapse-item>
                        <div class="mobile-links__item-title"><a href="#" class="mobile-links__item-link">Categories</a>
                            <button class="mobile-links__item-toggle" type="button" data-collapse-trigger>
                                <svg class="mobile-links__item-arrow" width="12px" height="7px">
                                    <use xlink:href="/images/sprite.svg#arrow-rounded-down-12x7"></use>
                                </svg>
                            </button>
                        </div>
                        <div class="mobile-links__item-sub-links" data-collapse-content>
                            <ul class="mobile-links mobile-links--level--1">
                                {% for category in categories %}
                                    {% if category.subcategories.length %}
                                        <li class="mobile-links__item" data-collapse-item>
                                            <div class="mobile-links__item-title">
                                                <a href="#" class="mobile-links__item-link">{{ category.category_name }}</a>
                                                <button class="mobile-links__item-toggle" type="button" data-collapse-trigger>
                                                    <svg class="mobile-links__item-arrow" width="12px" height="7px">
                                                        <use xlink:href="/images/sprite.svg#arrow-rounded-down-12x7"></use>
                                                    </svg>
                                                </button>
                                            </div>
                                            <div class="mobile-links__item-sub-links" data-collapse-content>
                                                <ul class="mobile-links mobile-links--level--2">
                                                    {% for subcategory in category.subcategories %}
                                                        <li class="mobile-links__item" data-collapse-item>
                                                            <div class="mobile-links__item-title">
                                                                <a href="#" class="mobile-links__item-link">{{ subcategory.sub_category_name }}</a>
                                                            </div>
                                                        </li>
                                                    {% endfor %}    
                                                </ul>
                                            </div>
                                        </li>   
                                    {% else %}
                                        <li class="mobile-links__item">
                                            <div class="mobile-links__item-title">
                                                <a href="#" class="mobile-links__item-link">{{ category.category_name }}</a>
                                            </div>
                                        </li>
                                    {% endif %}    
                                {% endfor %}    
                            </ul>
                        </div>
                    </li>
                    <!--<li class="mobile-links__item" data-collapse-item>
                        <div class="mobile-links__item-title">
                            <a href="/browse" class="mobile-links__item-link">Shop</a>
                        </div>
                    </li>
                    <li class="mobile-links__item" data-collapse-item>
                        <div class="mobile-links__item-title">
                            <a href="/contact" class="mobile-links__item-link">Contact Us</a>
                        </div>
                    </li>-->
                </ul>
            </div>
        </div>
    </div><!-- mobilemenu / end -->
    <!-- site -->
    <div class="site">
        <!-- mobile site__header -->
        <header class="site__header d-lg-none">
            <div class="mobile-header mobile-header--sticky mobile-header--stuck">
                <div class="mobile-header__panel">
                    <div class="container">
                        <div class="mobile-header__body">
                            <button class="mobile-header__menu-button">
                                <svg width="18px" height="14px">
                                    <use xlink:href="/images/sprite.svg#menu-18x14"></use>
                                </svg>
                            </button> 
                            <a class="mobile-header__logo" href="/"><img src="/images/logo.jpg" alt="Shopping answer logo" style="width: 99px" /></a>
                            <div class="mobile-header__search">
                                <form class="mobile-header__search-form" action="#"><input
                                        class="mobile-header__search-input" name="search"
                                        placeholder="Search over 10,000 products" aria-label="Site search" type="text"
                                        autocomplete="off"> <button
                                        class="mobile-header__search-button mobile-header__search-button--submit"
                                        type="submit"><svg width="20px" height="20px">
                                            <use xlink:href="/images/sprite.svg#search-20"></use>
                                        </svg></button> <button
                                        class="mobile-header__search-button mobile-header__search-button--close"
                                        type="button"><svg width="20px" height="20px">
                                            <use xlink:href="/images/sprite.svg#cross-20"></use>
                                        </svg></button>
                                    <div class="mobile-header__search-body"></div>
                                </form>
                            </div>
                            <div class="mobile-header__indicators">
                                <div class="indicator indicator--mobile-search indicator--mobile d-sm-none">
                                    <button class="indicator__button"><span class="indicator__area">
                                        <svg width="20px" height="20px">
                                            <use xlink:href="/images/sprite.svg#search-20"></use>
                                        </svg>
                                        </span>
                                    </button>
                                </div>
                                <div class="indicator indicator--mobile">
                                    <a href="/view-cart" class="indicator__button">
                                        <span class="indicator__area">
                                            <svg width="20px" height="20px">
                                                <use xlink:href="/images/sprite.svg#cart-20"></use>
                                            </svg>
                                            <span class="indicator__value">0</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header><!-- mobile site__header / end -->
        <!-- desktop site__header -->
        <header class="site__header d-lg-block d-none">
            <div class="site-header">
                <!-- .topbar -->
                <div class="site-header__topbar topbar">
                    <div class="topbar__container container">
                        <div class="topbar__row float-right">
                            <div class="topbar__item">
                                <div class="topbar-dropdown">
                                    <button class="topbar-dropdown__btn" type="button">
                                        {% if req.session.user %}
                                            <a href="/user/dashboard">My Dashboard</a>
                                        {% else %}    
                                            <a href="/account">My Account</a>
                                        {% endif %}    
                                    </button>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- .topbar / end -->
                <div class="site-header__middle container">
                    <div class="site-header__logo">
                        <a href="/"><img src="/images/logo.jpg" alt="Shopping answer logo" style="width: 99px" /></a>
                    </div>
                    <div class="site-header__search">
                        <div class="search">
                            <form class="search__form" action="#">
                                <input class="search__input" name="search" placeholder="Search over 10,000 products" aria-label="Site search" type="text" autocomplete="off">
                                <button class="search__button" type="submit">
                                    <svg width="20px" height="20px">
                                        <use xlink:href="/images/sprite.svg#search-20"></use>
                                    </svg></button>
                                <div class="search__border"></div>
                            </form>
                        </div>
                    </div>
                    <div class="site-header__phone">
                        <div class="site-header__phone-title">Customer Service</div>
                        <div class="site-header__phone-number">(+234) 708-6536-634</div>
                    </div>
                </div>
                <div class="site-header__nav-panel">
                    <div class="nav-panel">
                        <div class="nav-panel__container container">
                            <div class="nav-panel__row">
                                <div class="nav-panel__departments">
                                    <!-- .departments -->
                                    {% block category %}

                                    {% endblock %}
                                        <div class="departments__body">
                                            <div class="departments__links-wrapper">
                                                <ul class="departments__links">
                                                    <!--<li class="departments__item departments__item--menu"><a
                                                            href="#">Electrical <svg class="departments__link-arrow"
                                                                width="6px" height="9px">
                                                                <use
                                                                    xlink:href="/images/sprite.svg#arrow-rounded-right-6x9">
                                                                </use>
                                                            </svg></a>
                                                        <div class="departments__menu">
                                                            <ul class="menu menu--layout--classic">
                                                                <li><a href="#">Soldering Equipment <svg
                                                                            class="menu__arrow" width="6px"
                                                                            height="9px">
                                                                            <use
                                                                                xlink:href="/images/sprite.svg#arrow-rounded-right-6x9">
                                                                            </use>
                                                                        </svg></a>
                                                                    <div class="menu__submenu">
                                                                        <ul class="menu menu--layout--classic">
                                                                            <li><a href="#">Soldering Station</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                                <li><a href="#">Light Bulbs</a></li>
                                                            </ul>
                                                        </div>
                                                    </li>-->
                                                    {% for category in categories %}
                                                        {% set category_path = category.category_name.split(' ') %}
                                                        {% if category.subcategories.length %}
                                                            <li class="departments__item departments__item--menu">
                                                                <a href="/category/{{ category.id }}/{{ category_path.join('-') }}">{{ category.category_name }}
                                                                    <svg class="departments__link-arrow" width="6px" height="9px">
                                                                        <use
                                                                            xlink:href="/images/sprite.svg#arrow-rounded-right-6x9">
                                                                        </use>
                                                                    </svg>
                                                                </a>
                                                                <div class="departments__menu">
                                                                    <ul class="menu menu--layout--classic">
                                                                        {% for subcategory in category.subcategories %}
                                                                            {% set subcategory_path = subcategory.sub_category_name.split(' ') %}
                                                                            <li><a href="/subcategory/{{ subcategory.id }}/{{ subcategory_path.join('-') }}">{{ subcategory.sub_category_name }}</a></li>
                                                                        {% endfor %}    
                                                                    </ul>
                                                                </div>        
                                                            </li>        
                                                        {% else %}
                                                            <li class="departments__item"><a href="/category/{{ category.id }}/{{ category_path.join('-') }}">{{ category.category_name }}</a></li>
                                                        {% endif %}    
                                                    {% endfor %}    
                                                </ul>
                                            </div>
                                        </div><button class="departments__button"><svg class="departments__button-icon"
                                                width="18px" height="14px">
                                                <use xlink:href="/images/sprite.svg#menu-18x14"></use>
                                            </svg> Shop By Category <svg class="departments__button-arrow" width="9px"
                                                height="6px">
                                                <use xlink:href="/images/sprite.svg#arrow-rounded-down-9x6"></use>
                                            </svg></button>
                                    </div><!-- .departments / end -->
                                </div><!-- .nav-links -->
                                <div class="nav-panel__nav-links nav-links">
                                    <ul class="nav-links__list d-none">
                                        <li class="nav-links__item"><a href="/"><span>Home</span></a></li>
                                        <li class="nav-links__item"><a href="/browse-items"><span>Shop</span></a></li>
                                        <li class="nav-links__item"><a href="/contact"><span>Contact Us</span></a></li>
                                    </ul>
                                </div><!-- .nav-links / end -->
                                <div class="nav-panel__indicators">
                                    <div class="indicator">
                                        <a href="/view-cart" class="indicator__button">
                                            <span class="indicator__area">
                                                <svg width="20px" height="20px">
                                                    <use xlink:href="/images/sprite.svg#cart-20"></use>
                                                </svg>
                                                <span class="indicator__value">0</span>
                                            </span>
                                        </a>
                                        <div class="indicator__dropdown">
                                            <!-- .dropcart -->
                                            <div class="dropcart">
                                                <div class="dropcart__products-list">
                                                    <div class="dropcart__product">
                                                        <div class="dropcart__product-image"><a href="/view-cart"><img
                                                                    src="images/products/product-1.jpg" alt=""></a>
                                                        </div>
                                                        <div class="dropcart__product-info">
                                                            <div class="dropcart__product-name"><a
                                                                    href="product.html">Electric Planer Brandix
                                                                    KL370090G 300 Watts</a></div>
                                                            <ul class="dropcart__product-options">
                                                                <li>Color: Yellow</li>
                                                                <li>Material: Aluminium</li>
                                                            </ul>
                                                            <div class="dropcart__product-meta"><span
                                                                    class="dropcart__product-quantity">2</span> x <span
                                                                    class="dropcart__product-price">$699.00</span></div>
                                                        </div><button type="button"
                                                            class="dropcart__product-remove btn btn-light btn-sm btn-svg-icon"><svg
                                                                width="10px" height="10px">
                                                                <use xlink:href="/images/sprite.svg#cross-10"></use>
                                                            </svg></button>
                                                    </div>
                                                    
                                                </div>
                                                <div class="dropcart__totals">
                                                    <table>
                                                        <tr>
                                                            <th>Subtotal</th>
                                                            <td>$5,877.00</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Shipping</th>
                                                            <td>$25.00</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Tax</th>
                                                            <td>$0.00</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Total</th>
                                                            <td>$5,902.00</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="dropcart__buttons"><a class="btn btn-secondary"
                                                        href="/view-cart">View Cart</a> <a class="btn btn-primary"
                                                        href="/checkout">Checkout</a></div>
                                            </div><!-- .dropcart / end -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header><!-- desktop site__header / end -->
        <!-- site__body -->
        <div class="site__body">
           {% block body %}

           {% endblock %}
           
           
        <!-- site__footer -->
        <footer class="site__footer">
            <div class="site-footer">
                <div class="container">
                    <div class="site-footer__widgets">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <div class="site-footer__widget footer-contacts">
                                    <h5 class="footer-contacts__title">Contact Us</h5>
                                    <div class="footer-contacts__text">Our online shop is open 24/7</div>
                                    <ul class="footer-contacts__contacts">
                                        <li>Shop #1 Hardware tools Opposite
                                        Union bank APT gate, International tradefair Complex, Badagry Expressway, Lagos</li>
                                        <li><i class="footer-contacts__icon far fa-envelope"></i> info@shoppinganswer.com
                                        </li>
                                        <li><i class="footer-contacts__icon fas fa-mobile-alt"></i> (+234) 708-6536-634,
                                            (+234) 806-3351-763</li>
                                        <li><i class="footer-contacts__icon far fa-clock"></i> Mon-Sat 9:00am - 7:00pm
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-4 col-lg-4">
                                <div class="site-footer__widget footer-links">
                                    <h5 class="footer-links__title">Information</h5>
                                    <ul class="footer-links__list">
                                        <li class="footer-links__item"><a href="/services" class="footer-links__link">Our Services
                                                </a></li>
                                        <li class="footer-links__item"><a href="/delivery-info" class="footer-links__link">Delivery
                                                Information</a></li>
                                        <li class="footer-links__item"><a href="privacy-policy" class="footer-links__link">Privacy
                                                Policy</a></li>
                                        <li class="footer-links__item"><a href="/contact" class="footer-links__link">Contact
                                                Us</a></li>
                                        <li class="footer-links__item"><a href="#"
                                                class="footer-links__link">Returns</a></li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="col-md-3 col-lg-3">
                                <div class="site-footer__widget footer-newsletter">
                                    <div class="footer-newsletter__text footer-newsletter__text--social">Follow us on
                                        social networks</div>
                                    <ul class="footer-newsletter__social-links">
                                        <li
                                            class="footer-newsletter__social-link footer-newsletter__social-link--facebook">
                                            <a href="#" target="_blank"><i
                                                    class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li
                                            class="footer-newsletter__social-link footer-newsletter__social-link--twitter">
                                            <a href="#" target="_blank"><i
                                                    class="fab fa-twitter"></i></a>
                                        </li>
                                        <li
                                            class="footer-newsletter__social-link footer-newsletter__social-link--instagram">
                                            <a href="#" target="_blank"><i
                                                    class="fab fa-instagram"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="site-footer__bottom">
                        <div class="site-footer__copyright"><a target="_blank"
                                href="https://shoppinganswer.com">ShoppingAnswer</a></div>
                        <div class="site-footer__payments"></div>
                    </div>
                </div>
            </div>
        </footer><!-- site__footer / end -->
    </div><!-- site / end -->

    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/owl-carousel-2.3.4/owl.carousel.min.js"></script>
    <script src="/js/nouislider-12.1.0/nouislider.min.js"></script>
    <script src="/js/number.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/svg4everybody-2.1.9/svg4everybody.min.js"></script>
    <script>svg4everybody();</script><!-- font - fontawesome -->
    <script src="/js/cart-localstorage.min.js"></script>
    <script src="/js/cart-fns.js"></script>
    
    {% block scriptTag %}

    {% endblock %}
</body>

</html>