{% extends '../theme.swig' %}
{% block body %}
 
<style>
.itemphoto {
    width: 120px !important;
}

.grid {
  text-align: center;
  padding-bottom: 40px;
}

.grid p{
	font-family: 'Open Sans', 'sans-serif';
}
.grid h2 {
	font-family: 'Open Sans', 'sans-serif';
	margin-top: -4px;
	margin-bottom: 22px;
}
div.col-md-2 {
	width: 20%;
}
.grid p a {
	font-family: 'Open Sans', 'sans-serif';
	font-size: 1em;
	color: #333;
	padding: 6px 18px;
	border: 2px solid #A4A4A4;
	border-radius: 6px;
	-webkit-border-radius:6px; 
	-moz-border-radius:6px; 
	-o-border-radius:6px; 
	-ms-border-radius:6px; 
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}
.grid p a:hover {
	color: #fff;
	background: #A4A4A4;
	text-decoration: none;
}
.content{
	padding:8% 0;
	border-bottom: 1px solid #E0E0E0;
	margin-bottom: 8%;
}

/*-----------*/
.b-link-stripe{
	position:relative;
	display:inline-block;
	vertical-align:top;
	font-family: 'Open Sans', 'sans-serif';
	font-weight: 300;
	overflow:hidden;
}
.b-link-stripe .b-wrapper{
	position:absolute;
	width:100%;
	top:0;
	left:0;
	text-align:center;
	color:#ffffff;
	overflow:hidden;
}
.b-link-stripe .b-line{
	position:absolute;
	top:0;
	bottom:0;
	width:20%;
	background:rgba(243, 103, 89, 0.8);
	transition:all 0.5s linear;
	-moz-transition:all 0.5s linear;
	-ms-transition:all 0.5s linear;
	-o-transition:all 0.5s linear;
	-webkit-transition:all 0.5s linear;
	opacity:0;
	visibility:hidden; /* lt-ie9 */
}
/* lt-ie9 */
.b-link-stripe:hover .b-line{
	visibility:visible;
}
.b-link-stripe .b-line1{
	left:0;
}
.b-link-stripe .b-line2{
	left:20%;
	transition-delay:0.1s !important;
	-moz-transition-delay:0.1s !important;
	-ms-transition-delay:0.1s !important;
	-o-transition-delay:0.1s !important;
	-webkit-transition-delay:0.1s !important;
}
.b-link-stripe .b-line3{
	left:40%;
	transition-delay:0.2s !important;
	-moz-transition-delay:0.2s !important;
	-ms-transition-delay:0.2s !important;
	-o-transition-delay:0.2s !important;
	-webkit-transition-delay:0.2s !important;
}
.b-link-stripe .b-line4{
	left:60%;
	transition-delay:0.3s !important;
	-moz-transition-delay:0.3s !important;
	-ms-transition-delay:0.3s !important;
	-o-transition-delay:0.3s !important;
	-webkit-transition-delay:0.3s !important;
}
.b-link-stripe .b-line5{
	left:80%;
	transition-delay:0.4s !important;
	-moz-transition-delay:0.4s !important;
	-ms-transition-delay:0.4s !important;
	-o-transition-delay:0.4s !important;
	-webkit-transition-delay:0.4s !important;
}
.b-link-stripe:hover .b-line{
	opacity:1;
}
/*-----------------------------------------------------------------------------------*/
/*	Animation effects
/*-----------------------------------------------------------------------------------*/
.b-animate-go{
	text-decoration:none;
}
.b-animate{
	font-family: 'Open Sans', 'sans-serif';
	transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	-webkit-transition: all 0.5s;
	visibility: hidden;
	font-size:1.1em;
	font-weight:700;
}
.b-animate img {
	margin: 46% 0% 0 0;
	display: -webkit-inline-box;
	background: #333;
	padding: 15px;
	border-radius: 2em;
	-webkit-animation: 2em;
	-moz-border-radius: 2em;
	-o-border-radius: 2em;
	-ms-border-radius: 2em;
}
/* lt-ie9 */
.b-animate-go:hover .b-animate{
	visibility:visible;
}
.b-from-left{
	position:relative;
	left:-100%;
}
.b-animate-go:hover .b-from-left{
	left:0;
}
span.m_4{
	font-size:14px;
	font-weight:400;
}
p.m_5 {
	margin: 2% auto 5%;
	width: 70%;
	color: #283A47;
	font-size: 1.1em;
	font-weight: 600;
	line-height: 1.5em;
	text-align: center;
}
/*----start-light-box---*/
.light-box-info {
	padding: 1.8em;
	box-shadow: none;
	border-radius: 0;
}
.light-box-info h3 {
	font-family: 'Open Sans', 'sans-serif';
	color: #666;
	font-size: 2em;
	font-weight: 300;
}
.light-box-info p{
	font-family: 'Open Sans', 'sans-serif';
	color: #888888;
	font-size: 0.96em;
	line-height: 1.5em;
}

.featured-img {
  height: 180px;
}


</style>  
  
<div class="bnr" id="home">
		<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider4">
			    <li>
					<div class="banner-1"></div>
				</li>
				<li>
					<div class="banner-2"></div>
				</li>
				<li>
					<div class="banner-3"></div>
				</li>
			</ul>
		</div>
		<div class="clearfix"> </div>
	</div>
	<!--banner-ends--> 
	<!--Slider-Starts-Here-->
  <script src="/js/responsiveslides.min.js"></script>
  <script>
    // You can also use "$(window).load(function() {"
    $(function () {
      // Slideshow 4
      $("#slider4").responsiveSlides({
        auto: true,
        pager: true,
        nav: false,
        speed: 500,
        namespace: "callbacks",
        before: function () {
          $('.events').append("<li>before event fired.</li>");
        },
        after: function () {
          $('.events').append("<li>after event fired.</li>");
        }
      });

    });
  </script>  
<div class="shoes"> 
		<div class="container">
      <div class="row">
        
          <div class="col-md-2">
              <div class="grid">
                <div class="portfolio app mix_all" data-cat="app" style="display: inline-block; opacity: 1;">
                  <div class="portfolio-wrapper">		
                    <a data-toggle="modal" data-target=".bs-example-modal-md" href="#" class="b-link-stripe b-animate-go  thickbox">
                       <img src="/product_photos/product.png" class="featured-img" />
                       <div class="b-wrapper"><h2 class="b-animate b-from-left b-delay03"><img src="images/link-ico.png" alt=""/></h2>
                      </div></a>
                  </div>
                </div>		
                <p class="text-center">Big block Lether Bag</p>
                <h2 class="text-center">$350.00</h2>
                <p class="text-center"><a href="details.html">Buy</a></p>
              </div>
          </div>
      </div>
			<div class="row">
        {% for item in products %}
          <div class="col-md-3 product-left"> 
            <div class="p-one simpleCart_shelfItem">							
                <a href="/item/view/{{ item.id }}">
                  <img src="/product_photos/browse/{{ item.productphotos[0].photo_name }}" alt="" class="item-photo item_thumb" />
                  <div class="mask">
                    <span>Quick View</span>
                  </div>
                </a>
                <div class="item_name hidden">{{ item.product_name }}</div>
                <div class="item_cid hidden">{{ item.id }}</div>
              <h4>{{ item.product_name }}</h4>
              <p><a class="item_add" href="#"><i></i> <span class=" item_price">&#8358;{{ item.selling_price }}</span></a></p>
            </div>
          </div>
        {% endfor %}  
			</div>
		</div>
	</div>

<!-- Popular phones -->

{% endblock %}