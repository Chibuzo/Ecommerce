{% extends '../theme.swig' %}
{% block category %}
    <div class="departments departments--opened departments--fixed" data-departments-fixed-by=".block-slideshow">
{% endblock %}

{% block body %}

{% include '../includes/slideshow.swig' %}
{% include '../includes/block-features.swig' %}

<!-- featured products -->
<div class="block block-products-carousel" data-layout="grid-4">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Featured Products</h3>
            <div class="block-header__divider"></div>
            <ul class="block-header__groups-list">
                <li><button type="button" class="block-header__group block-header__group--active">All</button></li>
                <li><button type="button" class="block-header__group">Power Tools</button></li>
                <li><button type="button" class="block-header__group">Hand Tools</button></li>
                <li><button type="button" class="block-header__group">Plumbing</button></li>
            </ul>
            <div class="block-header__arrows-list">
                <button class="block-header__arrow block-header__arrow--left" type="button">
                    <svg width="7px" height="11px">
                        <use xlink:href="/images/sprite.svg#arrow-rounded-left-7x11"></use>
                    </svg>
                </button>
                <button class="block-header__arrow block-header__arrow--right" type="button">
                    <svg width="7px" height="11px">
                        <use xlink:href="/images/sprite.svg#arrow-rounded-right-7x11"></use>
                    </svg>
                </button>
            </div>
        </div>
        <div class="block-products-carousel__slider">
            <div class="block-products-carousel__preloader"></div>
            <div class="owl-carousel">
                {% for item in products %}
                    <div class="block-products-carousel__column">
                        <div class="block-products-carousel__cell">
                            {% include '../includes/product.swig' %}
                        </div>
                    </div>    
                {% endfor %}
            </div>
        </div>
    </div>
</div>     

<!-- Best seller block -->
<div class="block block-products block-products--layout--large-first">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Bestsellers</h3>
            <div class="block-header__divider"></div>
        </div>
        <div class="block-products__body">
            <div class="block-products__featured">
                <div class="block-products__featured-item">
                    {% include '../includes/product.swig' %}
                </div>
            </div>

            <div class="block-products__list">
                {% for item in products %}
                    <div class="block-products__list-item">
                        {% include '../includes/product.swig' %}
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
</div>            

 <!-- popular categories 
<div class="block block--highlighted block-categories block-categories--layout--classic">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Popular Categories</h3>
            <div class="block-header__divider"></div>
        </div>
        <div class="block-categories__list">
            <div class="block-categories__item category-card category-card--layout--classic">
                <div class="category-card__body">
                    <div class="category-card__image"><a href="#"><img
                                src="/images/categories/category-1.jpg" alt=""></a></div>
                    <div class="category-card__content">
                        <div class="category-card__name"><a href="#">Power Tools</a></div>
                        <ul class="category-card__links">
                            <li><a href="#">Screwdrivers</a></li>
                            <li><a href="#">Milling Cutters</a></li>
                            <li><a href="#">Sanding Machines</a></li>
                            <li><a href="#">Wrenches</a></li>
                            <li><a href="#">Drills</a></li>
                        </ul>
                        <div class="category-card__all"><a href="#">Show All</a></div>
                        <div class="category-card__products">572 Products</div>
                    </div>
                </div>
            </div>
            <div class="block-categories__item category-card category-card--layout--classic">
                <div class="category-card__body">
                    <div class="category-card__image"><a href="#"><img
                                src="/images/categories/category-2.jpg" alt=""></a></div>
                    <div class="category-card__content">
                        <div class="category-card__name"><a href="#">Hand Tools</a></div>
                        <ul class="category-card__links">
                            <li><a href="#">Screwdrivers</a></li>
                            <li><a href="#">Hammers</a></li>
                            <li><a href="#">Spanners</a></li>
                            <li><a href="#">Handsaws</a></li>
                            <li><a href="#">Paint Tools</a></li>
                        </ul>
                        <div class="category-card__all"><a href="#">Show All</a></div>
                        <div class="category-card__products">134 Products</div>
                    </div>
                </div>
            </div>
            <div class="block-categories__item category-card category-card--layout--classic">
                <div class="category-card__body">
                    <div class="category-card__image"><a href="#"><img
                                src="images/categories/category-4.jpg" alt=""></a></div>
                    <div class="category-card__content">
                        <div class="category-card__name"><a href="#">Machine Tools</a></div>
                        <ul class="category-card__links">
                            <li><a href="#">Lathes</a></li>
                            <li><a href="#">Milling Machines</a></li>
                            <li><a href="#">Grinding Machines</a></li>
                            <li><a href="#">CNC Machines</a></li>
                            <li><a href="#">Sharpening Machines</a></li>
                        </ul>
                        <div class="category-card__all"><a href="#">Show All</a></div>
                        <div class="category-card__products">301 Products</div>
                    </div>
                </div>
            </div>
            <div class="block-categories__item category-card category-card--layout--classic">
                <div class="category-card__body">
                    <div class="category-card__image"><a href="#"><img
                                src="images/categories/category-3.jpg" alt=""></a></div>
                    <div class="category-card__content">
                        <div class="category-card__name"><a href="#">Power Machinery</a></div>
                        <ul class="category-card__links">
                            <li><a href="#">Generators</a></li>
                            <li><a href="#">Compressors</a></li>
                            <li><a href="#">Winches</a></li>
                            <li><a href="#">Plasma Cutting</a></li>
                            <li><a href="#">Electric Motors</a></li>
                        </ul>
                        <div class="category-card__all"><a href="#">Show All</a></div>
                        <div class="category-card__products">79 Products</div>
                    </div>
                </div>
            </div>
            <div class="block-categories__item category-card category-card--layout--classic">
                <div class="category-card__body">
                    <div class="category-card__image"><a href="#"><img
                                src="images/categories/category-5.jpg" alt=""></a></div>
                    <div class="category-card__content">
                        <div class="category-card__name"><a href="#">Measurement</a></div>
                        <ul class="category-card__links">
                            <li><a href="#">Tape Measure</a></li>
                            <li><a href="#">Theodolites</a></li>
                            <li><a href="#">Thermal Imagers</a></li>
                            <li><a href="#">Calipers</a></li>
                            <li><a href="#">Levels</a></li>
                        </ul>
                        <div class="category-card__all"><a href="#">Show All</a></div>
                        <div class="category-card__products">366 Products</div>
                    </div>
                </div>
            </div>
            <div class="block-categories__item category-card category-card--layout--classic">
                <div class="category-card__body">
                    <div class="category-card__image"><a href="#"><img
                                src="images/categories/category-6.jpg" alt=""></a></div>
                    <div class="category-card__content">
                        <div class="category-card__name"><a href="#">Clothes and PPE</a></div>
                        <ul class="category-card__links">
                            <li><a href="#">Winter Workwear</a></li>
                            <li><a href="#">Summer Workwear</a></li>
                            <li><a href="#">Helmets</a></li>
                            <li><a href="#">Belts and Bags</a></li>
                            <li><a href="#">Work Shoes</a></li>
                        </ul>
                        <div class="category-card__all"><a href="#">Show All</a></div>
                        <div class="category-card__products">81 Products</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- .block-categories / end -->


<!-- .block-products-carousel -->
<div class="block block-products-carousel" data-layout="horizontal">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">New Arrivals</h3>
            <div class="block-header__divider"></div>
            <ul class="block-header__groups-list">
                <li><button type="button"
                        class="block-header__group block-header__group--active">All</button></li>
                <li><button type="button" class="block-header__group">Power Tools</button></li>
                <li><button type="button" class="block-header__group">Hand Tools</button></li>
                <li><button type="button" class="block-header__group">Plumbing</button></li>
            </ul>
            <div class="block-header__arrows-list"><button
                    class="block-header__arrow block-header__arrow--left" type="button"><svg width="7px"
                        height="11px">
                        <use xlink:href="/images/sprite.svg#arrow-rounded-left-7x11"></use>
                    </svg></button> <button class="block-header__arrow block-header__arrow--right"
                    type="button"><svg width="7px" height="11px">
                        <use xlink:href="/images/sprite.svg#arrow-rounded-right-7x11"></use>
                    </svg></button></div>
        </div>
        <div class="block-products-carousel__slider">
            <div class="block-products-carousel__preloader"></div>
            <div class="owl-carousel">
                <div class="block-products-carousel__column">
                {% set n = 0 %}
                {% for arrival in newArrivals %}
                    {% if n == 2 %}
                        {% set n = 0 %}
                        <div class="block-products-carousel__column">
                    {% endif %}    
                    <div class="block-products-carousel__cell">
                        <div class="product-card"><button class="product-card__quickview" type="button"><svg
                                    width="16px" height="16px">
                                    <use xlink:href="/images/sprite.svg#quickview-16"></use>
                                </svg> <span class="fake-svg-icon"></span></button>
                            <div class="product-card__badges-list">
                                <div class="product-card__badge product-card__badge--new">New</div>
                            </div>
                            <div class="product-card__image">
                                <a href="">
                                    {% if arrival.productphotos[0] %}
                                        <img src="/product_photos/thumbnail/{{ arrival.productphotos[0].photo_name }}" alt="" class="item_thumb" />
                                    {% else %}    
                                        <img src="/product_photos/thumbnail/product.png" alt="" class="item_thumb" />
                                    {% endif %}  
                                </a>
                            </div>
                            <div class="product-card__info">
                                <div class="product-card__name">
                                    <a href="/item/view/{{ arrival.id }}">{{ arrival.product_name }}</a></div>
                                <!--<div class="product-card__rating">
                                    <div class="rating">
                                        <div class="rating__body"><svg
                                                class="rating__star rating__star--active" width="13px"
                                                height="12px">
                                                <g class="rating__fill">
                                                    <use xlink:href="/images/sprite.svg#star-normal"></use>
                                                </g>
                                                <g class="rating__stroke">
                                                    <use xlink:href="/images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                </g>
                                            </svg>
                                            <div
                                                class="rating__star rating__star--only-edge rating__star--active">
                                                <div class="rating__fill">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                                <div class="rating__stroke">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                            </div><svg class="rating__star rating__star--active"
                                                width="13px" height="12px">
                                                <g class="rating__fill">
                                                    <use xlink:href="/images/sprite.svg#star-normal"></use>
                                                </g>
                                                <g class="rating__stroke">
                                                    <use xlink:href="/images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                </g>
                                            </svg>
                                            <div
                                                class="rating__star rating__star--only-edge rating__star--active">
                                                <div class="rating__fill">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                                <div class="rating__stroke">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                            </div><svg class="rating__star rating__star--active"
                                                width="13px" height="12px">
                                                <g class="rating__fill">
                                                    <use xlink:href="/images/sprite.svg#star-normal"></use>
                                                </g>
                                                <g class="rating__stroke">
                                                    <use xlink:href="/images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                </g>
                                            </svg>
                                            <div
                                                class="rating__star rating__star--only-edge rating__star--active">
                                                <div class="rating__fill">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                                <div class="rating__stroke">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                            </div><svg class="rating__star rating__star--active"
                                                width="13px" height="12px">
                                                <g class="rating__fill">
                                                    <use xlink:href="/images/sprite.svg#star-normal"></use>
                                                </g>
                                                <g class="rating__stroke">
                                                    <use xlink:href="/images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                </g>
                                            </svg>
                                            <div
                                                class="rating__star rating__star--only-edge rating__star--active">
                                                <div class="rating__fill">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                                <div class="rating__stroke">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                            </div><svg class="rating__star" width="13px" height="12px">
                                                <g class="rating__fill">
                                                    <use xlink:href="/images/sprite.svg#star-normal"></use>
                                                </g>
                                                <g class="rating__stroke">
                                                    <use xlink:href="/images/sprite.svg#star-normal-stroke">
                                                    </use>
                                                </g>
                                            </svg>
                                            <div class="rating__star rating__star--only-edge">
                                                <div class="rating__fill">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                                <div class="rating__stroke">
                                                    <div class="fake-svg-icon"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-card__rating-legend">9 Reviews</div>
                                </div>-->
                            </div>
                            <div class="product-card__actions">
                                <div class="product-card__availability">Availability: <span
                                        class="text-success">In Stock</span></div>
                                <div class="product-card__prices">&#8358;{{ arrival.price }}</div>
                            </div>
                        </div>
                    </div>
                    {% set n = n + 1 %}
                    {% if n == 2 %}
                        </div>
                    {% endif %}    
                {% endfor %}    
            </div>
        </div>
    </div>
</div><!-- .block-products-carousel / end -->
{% endblock %}