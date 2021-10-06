<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>Stroyka</title>
    <link rel="icon" type="image/png" href="/images/favicon.png"><!-- fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i"><!-- css -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/style.css"><!-- js -->
    <link rel="stylesheet" href="/css/all.min.css"><!-- font - stroyka -->
    <link rel="stylesheet" href="/fonts/stroyka/stroyka.css">
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-97489509-6"></script>
    <script>window.dataLayer = window.dataLayer || []; function gtag() { dataLayer.push(arguments); } gtag('js', new Date()); gtag('config', 'UA-97489509-6');</script>
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
                    <li class="mobile-links__item" data-collapse-item>
                        <div class="mobile-links__item-title">
                            <a href="/" class="mobile-links__item-link">Home</a>
                        </div>
                    </li>
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
                    <li class="mobile-links__item" data-collapse-item>
                        <div class="mobile-links__item-title">
                            <a href="/browse" class="mobile-links__item-link">Shop</a>
                        </div>
                    </li>
                    <li class="mobile-links__item" data-collapse-item>
                        <div class="mobile-links__item-title">
                            <a href="/contact" class="mobile-links__item-link">Contact Us</a>
                        </div>
                    </li>
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
                        <div class="mobile-header__body"><button class="mobile-header__menu-button"><svg width="18px"
                                    height="14px">
                                    <use xlink:href="/images/sprite.svg#menu-18x14"></use>
                                </svg></button> <a class="mobile-header__logo" href="index.html"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="120px" height="20px">
                                    <path d="M118.5,20h-1.1c-0.6,0-1.2-0.4-1.4-1l-1.5-4h-6.1l-1.5,4c-0.2,0.6-0.8,1-1.4,1h-1.1c-1,0-1.8-1-1.4-2l1.1-3
                                 l1.5-4l3.6-10c0.2-0.6,0.8-1,1.4-1h1.6c0.6,0,1.2,0.4,1.4,1l3.6,10l1.5,4l1.1,3C120.3,19,119.5,20,118.5,20z M111.5,6.6l-1.6,4.4
                                 h3.2L111.5,6.6z M99.5,20h-1.4c-0.4,0-0.7-0.2-0.9-0.5L94,14l-2,3.5v1c0,0.8-0.7,1.5-1.5,1.5h-1c-0.8,0-1.5-0.7-1.5-1.5v-17
                                 C88,0.7,88.7,0,89.5,0h1C91.3,0,92,0.7,92,1.5v8L94,6l3.2-5.5C97.4,0.2,97.7,0,98.1,0h1.4c1.2,0,1.9,1.3,1.3,2.3L96.3,10l4.5,7.8
                                 C101.4,18.8,100.7,20,99.5,20z M80.3,11.8L80,12.3v6.2c0,0.8-0.7,1.5-1.5,1.5h-1c-0.8,0-1.5-0.7-1.5-1.5v-6.2l-0.3-0.5l-5.5-9.5
                                 c-0.6-1,0.2-2.3,1.3-2.3h1.4c0.4,0,0.7,0.2,0.9,0.5L76,4.3l2,3.5l2-3.5l2.2-3.8C82.4,0.2,82.7,0,83.1,0h1.4c1.2,0,1.9,1.3,1.3,2.3
                                 L80.3,11.8z M60,20c-5.5,0-10-4.5-10-10S54.5,0,60,0s10,4.5,10,10S65.5,20,60,20z M60,4c-3.3,0-6,2.7-6,6s2.7,6,6,6s6-2.7,6-6
                                 S63.3,4,60,4z M47.8,17.8c0.6,1-0.2,2.3-1.3,2.3h-2L41,14h-4v4.5c0,0.8-0.7,1.5-1.5,1.5h-1c-0.8,0-1.5-0.7-1.5-1.5v-17
                                 C33,0.7,33.7,0,34.5,0H41c0.3,0,0.7,0,1,0.1c3.4,0.5,6,3.4,6,6.9c0,2.4-1.2,4.5-3.1,5.8L47.8,17.8z M42,4.2C41.7,4.1,41.3,4,41,4h-3
                                 c-0.6,0-1,0.4-1,1v4c0,0.6,0.4,1,1,1h3c0.3,0,0.7-0.1,1-0.2c0.3-0.1,0.6-0.3,0.9-0.5C43.6,8.8,44,7.9,44,7C44,5.7,43.2,4.6,42,4.2z
                                  M29.5,4H25v14.5c0,0.8-0.7,1.5-1.5,1.5h-1c-0.8,0-1.5-0.7-1.5-1.5V4h-4.5C15.7,4,15,3.3,15,2.5v-1C15,0.7,15.7,0,16.5,0h13
                                 C30.3,0,31,0.7,31,1.5v1C31,3.3,30.3,4,29.5,4z M6.5,20c-2.8,0-5.5-1.7-6.4-4c-0.4-1,0.3-2,1.3-2h1c0.5,0,0.9,0.3,1.2,0.7
                                 c0.2,0.3,0.4,0.6,0.8,0.8C4.9,15.8,5.8,16,6.5,16c1.5,0,2.8-0.9,2.8-2c0-0.7-0.5-1.3-1.2-1.6C7.4,12,7,11,7.4,10.3l0.4-0.9
                                 c0.4-0.7,1.2-1,1.8-0.6c0.6,0.3,1.2,0.7,1.6,1.2c1,1.1,1.7,2.5,1.7,4C13,17.3,10.1,20,6.5,20z M11.6,6h-1c-0.5,0-0.9-0.3-1.2-0.7
                                 C9.2,4.9,8.9,4.7,8.6,4.5C8.1,4.2,7.2,4,6.5,4C5,4,3.7,4.9,3.7,6c0,0.7,0.5,1.3,1.2,1.6C5.6,8,6,9,5.6,9.7l-0.4,0.9
                                 c-0.4,0.7-1.2,1-1.8,0.6c-0.6-0.3-1.2-0.7-1.6-1.2C0.6,8.9,0,7.5,0,6c0-3.3,2.9-6,6.5-6c2.8,0,5.5,1.7,6.4,4C13.3,4.9,12.6,6,11.6,6
                                 z"></path>
                                </svg></a>
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
                                <div class="topbar-dropdown"><button class="topbar-dropdown__btn" type="button">My
                                        Account <svg width="7px" height="5px">
                                            <use xlink:href="/images/sprite.svg#arrow-rounded-down-7x5"></use>
                                        </svg></button>
                                    <div class="topbar-dropdown__body">
                                        <!-- .menu -->
                                        <ul class="menu menu--layout--topbar">
                                            <li><a href="account.html">Login</a></li>
                                            <li><a href="account.html">Register</a></li>
                                            <li><a href="#">Orders</a></li>
                                            <li><a href="#">Addresses</a></li>
                                        </ul><!-- .menu / end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- .topbar / end -->
                <div class="site-header__middle container">
                    <div class="site-header__logo">
                        <a href="/"><img src="/images/logo.png" alt="Shopping answer logo" /></a>
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
                        <div class="site-header__phone-number">(800) 060-0730</div>
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
                                                        {% if category.subcategories.length %}
                                                            <li class="departments__item departments__item--menu">
                                                                <a href="#">{{ category.category_name }}
                                                                    <svg class="departments__link-arrow" width="6px" height="9px">
                                                                        <use
                                                                            xlink:href="/images/sprite.svg#arrow-rounded-right-6x9">
                                                                        </use>
                                                                    </svg>
                                                                </a>
                                                                <div class="departments__menu">
                                                                    <ul class="menu menu--layout--classic">
                                                                        {% for subcategory in category.subcategories %}
                                                                            <li><a href="#">{{ subcategory.sub_category_name }}</a></li>
                                                                        {% endfor %}    
                                                                    </ul>
                                                                </div>        
                                                            </li>        
                                                        {% else %}
                                                            <li class="departments__item"><a href="#">{{ category.category_name }}</a></li>
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
                                    <ul class="nav-links__list">
                                        <li class="nav-links__item"><a href="/"><span>Home</span></a></li>
                                        <li class="nav-links__item"><a href="/browse-items"><span>Shop</span></a></li>
                                        <li class="nav-links__item"><a href="/contact"><span>Contact Us</span></a></li>
                                    </ul>
                                </div><!-- .nav-links / end -->
                                <div class="nav-panel__indicators">
                                    <div class="indicator indicator--trigger--click">
                                        <a href="cart.html" class="indicator__button">
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
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="site-footer__widget footer-contacts">
                                    <h5 class="footer-contacts__title">Contact Us</h5>
                                    <div class="footer-contacts__text">Lorem ipsum dolor sit amet, consectetur
                                        adipiscing elit. Integer in feugiat lorem. Pellentque ac placerat tellus.</div>
                                    <ul class="footer-contacts__contacts">
                                        <li><i class="footer-contacts__icon fas fa-globe-americas"></i> 715 Fake Street,
                                            New York 10021 USA</li>
                                        <li><i class="footer-contacts__icon far fa-envelope"></i> stroyka@example.com
                                        </li>
                                        <li><i class="footer-contacts__icon fas fa-mobile-alt"></i> (800) 060-0730,
                                            (800) 060-0730</li>
                                        <li><i class="footer-contacts__icon far fa-clock"></i> Mon-Sat 10:00pm - 7:00pm
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-6 col-md-3 col-lg-2">
                                <div class="site-footer__widget footer-links">
                                    <h5 class="footer-links__title">Information</h5>
                                    <ul class="footer-links__list">
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">About
                                                Us</a></li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Delivery
                                                Information</a></li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Privacy
                                                Policy</a></li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Brands</a>
                                        </li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Contact
                                                Us</a></li>
                                        <li class="footer-links__item"><a href="#"
                                                class="footer-links__link">Returns</a></li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Site
                                                Map</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-6 col-md-3 col-lg-2">
                                <div class="site-footer__widget footer-links">
                                    <h5 class="footer-links__title">My Account</h5>
                                    <ul class="footer-links__list">
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Store
                                                Location</a></li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Order
                                                History</a></li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Wish
                                                List</a></li>
                                        <li class="footer-links__item"><a href="#"
                                                class="footer-links__link">Newsletter</a></li>
                                        <li class="footer-links__item"><a href="#"
                                                class="footer-links__link">Specials</a></li>
                                        <li class="footer-links__item"><a href="#" class="footer-links__link">Gift
                                                Certificates</a></li>
                                        <li class="footer-links__item"><a href="#"
                                                class="footer-links__link">Affiliate</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-4">
                                <div class="site-footer__widget footer-newsletter">
                                    <h5 class="footer-newsletter__title">Newsletter</h5>
                                    <div class="footer-newsletter__text">Praesent pellentesque volutpat ex, vitae auctor
                                        lorem pulvinar mollis felis at lacinia.</div>
                                    <form action="#" class="footer-newsletter__form"><label class="sr-only"
                                            for="footer-newsletter-address">Email Address</label> <input type="text"
                                            class="footer-newsletter__form-input form-control"
                                            id="footer-newsletter-address" placeholder="Email Address..."> <button
                                            class="footer-newsletter__form-button btn btn-primary">Subscribe</button>
                                    </form>
                                    <div class="footer-newsletter__text footer-newsletter__text--social">Follow us on
                                        social networks</div>
                                    <ul class="footer-newsletter__social-links">
                                        <li
                                            class="footer-newsletter__social-link footer-newsletter__social-link--facebook">
                                            <a href="https://themeforest.net/user/kos9" target="_blank"><i
                                                    class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li
                                            class="footer-newsletter__social-link footer-newsletter__social-link--twitter">
                                            <a href="https://themeforest.net/user/kos9" target="_blank"><i
                                                    class="fab fa-twitter"></i></a>
                                        </li>
                                        <li
                                            class="footer-newsletter__social-link footer-newsletter__social-link--youtube">
                                            <a href="https://themeforest.net/user/kos9" target="_blank"><i
                                                    class="fab fa-youtube"></i></a>
                                        </li>
                                        <li
                                            class="footer-newsletter__social-link footer-newsletter__social-link--instagram">
                                            <a href="https://themeforest.net/user/kos9" target="_blank"><i
                                                    class="fab fa-instagram"></i></a>
                                        </li>
                                        <li class="footer-newsletter__social-link footer-newsletter__social-link--rss">
                                            <a href="https://themeforest.net/user/kos9" target="_blank"><i
                                                    class="fas fa-rss"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="site-footer__bottom">
                        <div class="site-footer__copyright"><a target="_blank"
                                href="https://www.templateshub.net">ShoppingAnswer</a></div>
                        <div class="site-footer__payments"><img src="images/payments.png" alt=""></div>
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