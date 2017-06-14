{% extends '../theme.swig' %}
{% block body %}
<style>
body {
  font-size: 16px;
}

.details-left-info {
  marginleft: 50px;
  margin-top: 13px;
}

.feature {
    padding: 1px 5px;
    font-size: 14px !important;
}

.quick_desc {
  font-size: 14px !important;
}

.flexslider {
  top: -20px;
  /*left: -70px;*/
  border: none;
}

</style>
<script defer src="/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="/styles/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>

	<!--start-single-->
	<div class="single contact">
		<div class="container">
			<div class="single-main row">
				<div class="col-md-9">
          <div class="sngl-top">
            <div class="col-md-5 single-top-left">	
              <div class="flexslider">
                <ul class="slides">
                  {% for photo in item.productphotos %}
                    <li data-thumb="/product_photos/browse/{{ photo.photo_name }}">
                      <img src="/product_photos/{{ photo.photo_name }}" stle="width: 480px !important" />
                    </li>
                  {% endfor %}  
                </ul>
              </div>
            </div>
          
            <div class="col-md-7 single-top-right">
              <div class="details-left-info simpleCart_shelfItem">
                <h3 class="item_name">{{ item.product_name }} - {{ item.color }}</h3>
                <p class="availability"> Availability: <span class="color">In stock</span></p>
                <div class="price_single">
                  <span class="reducedfrom hidden">$800.00</span>
                  <span class="actual item_price"> &#8358;{{ item.selling_price }}</span>
                </div>
                <h2 class="quick">Quick Overview:</h2>
                <p class="quick_desc">{{ item.description }}</p>
                
                <div class="item_cid hidden">{{ item.id }}</div>
                <img src="/product_photos/browse/{{ item.productphotos[0].photo_name }}" alt="" class="hidden item_thumb" />
                <h2 class="quick">Key Features</h2>
                
                {% for feat in item.keyfeatures %}
                  <div class="feature"><strong>{{ feat.feature_name }}: </strong>{{ feat.feature_value }}</div>
                {% endfor %}
                <br>
                <button class="btn btn-danger item_add"><i class="fa fa-shopping-cart"></i> Add To Cart</button>
                <a href="/view-cart" class="btn btn-danger item_add">Buy Now</a>
              </div>
            </div>
          </div>
        </div>
        
				<div class="col-md-3">
          <br>
          <div>Genuine Product</div>
          <div>Seven days return policy</div>
          <div>Convenient payment option</div>
        </div>	
			</div>
		</div>
	</div>
	<!--end-single-->
	</div>
{% endblock %}  