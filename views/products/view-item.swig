{% extends '../theme.swig' %}

{% block category %}
    <div class="departments" data-departments-fixed-by="">
{% endblock %}

{% block body %}

<div class="page-header">
    <div class="page-header__container container">
        <div class="page-header__breadcrumb">
            <nav aria-label="breadcrumb">
                
            </nav>
        </div>
    </div>
</div>

<div class="block">
    <div class="container">
        <div class="product product--layout--standard" data-layout="standard">
            <div class="product__content">
                <!-- .product__gallery -->
                <div class="product__gallery">
                    <div class="product-gallery">
                        <div class="product-gallery__featured">
                            <div class="owl-carousel" id="product-image">
                                {% for thumb in item.productphotos %}
                                    <img src="/product_photos/zoom/{{ thumb.photo_name }}" alt="">
                                {% endfor %}    
                            </div>
                        </div>
                        <div class="product-gallery__carousel">
                            <div class="owl-carousel" id="product-carousel">
                                {% for thumb in item.productphotos %}
                                    <a href="#" class="product-gallery__carousel-item">
                                        <img class="product-gallery__carousel-image" src="/product_photos/thumbnail/{{ thumb.photo_name }}" alt="">
                                    </a>
                                {% endfor %}    
                            </div>
                        </div>
                    </div>
                </div><!-- .product__gallery / end -->
                <!-- .product__info -->
                <div class="product__info">
                    <div class="product__wishlist-compare"><button type="button"
                            class="btn btn-sm btn-light btn-svg-icon" data-toggle="tooltip"
                            data-placement="right" title="Wishlist"><svg width="16px" height="16px">
                                <use xlink:href="images/sprite.svg#wishlist-16"></use>
                            </svg></button> <button type="button" class="btn btn-sm btn-light btn-svg-icon"
                            data-toggle="tooltip" data-placement="right" title="Compare"><svg width="16px"
                                height="16px">
                                <use xlink:href="images/sprite.svg#compare-16"></use>
                            </svg></button></div>
                    <h1 class="product__name">{{ item.product_name }}</h1>
                    <div class="product__rating">
                        <div class="product__rating-stars">
                            <div class="rating">
                                
                            </div>
                        </div>
                        <div class="product__rating-legend"><a href="#">7 Reviews</a><span>/</span><a
                                href="#">Write A Review</a></div>
                    </div>
                    <div class="product__description">{{ item.description }}</div>
                    
                    <ul class="product__meta">
                        <li class="product__meta-availability">Availability: <span class="text-success">In
                                Stock</span></li>
                        <li>Brand: <a href="#">Wakita</a></li>
                        <li>SKU: 83690/32</li>
                    </ul>
                </div><!-- .product__info / end -->
                <!-- .product__sidebar -->
                <div class="product__sidebar">
                    <div class="product__availability">Availability: <span class="text-success">In
                            Stock</span></div>
                    <div class="product__prices">&#8358; {{ item.price }}</div><!-- .product__options -->
                    <form class="product__options">
                        
                        <div class="form-group product__option"><label class="product__option-label"
                                for="product-quantity">Quantity</label>
                            <div class="product__actions">
                                <div class="product__actions-item">
                                    <div class="input-number product__quantity"><input id="product-quantity"
                                            class="input-number__input form-control form-control-lg"
                                            type="number" min="1" value="1">
                                        <div class="input-number__add"></div>
                                        <div class="input-number__sub"></div>
                                    </div>
                                </div>
                                <div class="product__actions-item product__actions-item--addtocart">
                                    <button type="button"
                                        class="btn btn-primary btn-lg"
                                        onClick="addItemToCart({{ item.id }}, '{{ item.product_name }}', {{ item.unformatted_price }}, '{{ item.photo }}')">Add to cart</button>
                                </div>
                            </div>
                        </div>
                    </form><!-- .product__options / end -->
                </div><!-- .product__end -->
                <div class="product__footer">
                    <div class="product__tags tags">
                        <div class="tags__list"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-tabs">
            <div class="product-tabs__list"><a href="#tab-description"
                    class="product-tabs__item product-tabs__item--active">Description</a> <a
                    href="#tab-specification" class="product-tabs__item">Specification</a> <a
                    href="#tab-reviews" class="product-tabs__item">Reviews</a></div>
            <div class="product-tabs__content">
                <div class="product-tabs__pane product-tabs__pane--active" id="tab-description">
                    <div class="typography">
                        <h3>Product Full Description</h3>
                        <p>{{ item.description }}</p>
                    </div>
                </div>
                <div class="product-tabs__pane" id="tab-specification">
                    <div class="spec">
                        <h3 class="spec__header">Specification</h3>
                        <div class="spec__section">
                            <h4 class="spec__section-title">General</h4>
                            {% for spec in item.keyfeatures %}
                                <div class="spec__row">
                                    <div class="spec__name">{{ spec.feature_name }}</div>
                                    <div class="spec__value">{{ spec.feature_value }}</div>
                                </div>
                            {% endfor %}
                        </div>
                        
                        <div class="spec__disclaimer">Information on technical characteristics, the delivery
                            set, the country of manufacture and the appearance of the goods is for reference
                            only and is based on the latest information available at the time of
                            publication.</div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div><!-- .block-products-carousel -->

<div class="block block-products-carousel" data-layout="grid-5">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Related Products</h3>
            <div class="block-header__divider"></div>
            <div class="block-header__arrows-list">
                <button class="block-header__arrow block-header__arrow--left" type="button">
                    <svg width="7px" height="11px">
                        <use xlink:href="images/sprite.svg#arrow-rounded-left-7x11"></use>
                    </svg>
                </button> 
                <button class="block-header__arrow block-header__arrow--right" type="button">
                    <svg width="7px" height="11px">
                        <use xlink:href="images/sprite.svg#arrow-rounded-right-7x11"></use>
                    </svg>
                </button>
        </div>
        </div>
        <div class="block-products-carousel__slider">
            <div class="block-products-carousel__preloader"></div>
            <div class="owl-carousel">
                {% for item in related_products %}
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
{% endblock %}  