
<!DOCTYPE html>
<html>
<head>
<title>Kentzville Mobile Phone Store</title>
<link href="/styles/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="/styles/front_style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/styles/font-awesome.min.css" rel="stylesheet">
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mobile phone, Andriod, Smartphone Nokia, Samsung, LG, SonyErricsson, Motorola" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Alegreya+Sans+SC:100,300,400,500,700,800,900,100italic,300italic,400italic,500italic,700italic,800italic,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
<!--//fonts-->
<script type="text/javascript" src="/js/move-top.js"></script>
<script type="text/javascript" src="/js/easing.js"></script>
<script type="text/javascript">
  jQuery(document).ready(function($) {
    $(".scroll").click(function(event){		
      event.preventDefault();
      $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
    });
  });
</script>	
<!-- start menu -->
<script src="/js/simpleCart.min.js"> </script>
<script>
  simpleCart.currency({ 
      code: "NGN" ,
      name: "Naira" ,
      symbol: "₦" 
  });


  simpleCart({
    shippingFlatRate: 1500,
    cartColumns: [
        { attr: "cid" },
        { view: "image" , attr:'thumb', label: 'Item' },
        { attr: "name" , label: "Product" } ,
        { attr: "price" , label: "Price", view: 'currency' } ,
        { view: "decrement" , label: false , text: "-" } ,
        { attr: "quantity" , label: "Quantity" } ,
        { view: "increment" , label: false , text: "+" } ,
        { attr: "total" , label: "SubTotal", view: 'currency' } ,
        { view: "remove" , text: "Remove" , label: false }
    ]
  });
</script>
<link href="/styles/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<style>
  .auth-panel {
    boder: #ccc solid thin;
    padding: 20px 20px 50px 20px;
    margin-top: 60px;
    background-color: #fff;
  }
  
  .auth-panel h3 {
    font-family: 'Alegreya Sans SC', sans-serif;
  }
</style>
</head>
<body> 
	<!--top-header-->
	<div class="top-header">
	<div class="container">
		<div class="top-header-main">
			<div class="col-md-4 top-header-left hidden">
				<div class="search-bar">
					<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					<input type="submit" value="">
				</div>
			</div>
      <div class="col-md-4 top-header-left">
        <a href="/"><img src="/images/emblem.jpg" id="logo" /></a>
      </div>
			<div class="col-md-4 top-header-middle">
				<a href="/"><img src="/images/logo_.jpg" class="hidden-xs" alt="" id="coy-logo" /></a>
			</div>
			<div class="col-md-4 top-header-right">
				<div class="cart box_1">
						<a href="/view-cart">
						<h3> <div class="total">
							<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div>
							<img src="/images/cart-1.png" alt="" />
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
						<div class="clearfix"> </div>
            {% if req.session.userId %}
              <div class="btn-group">
                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Account <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="/user/dashboard"><i class="fa fa-home"></i> &nbsp;Dashboard</a></li>
                  <li><a href="/user/signout"><i class="fa fa-sign-out"></i> &nbsp;Logout</a></li>
                </ul>
              </div>
            {% else %}
              <a href='/user/signin' class="btn btn-danger"><i class="fa fa-user"></i> &nbsp;Account</a>
            {% endif %}  
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--top-header-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="top-nav">
				<ul class="memenu skyblue">
          <li class="grid"><a href="/">Home</a></li>
          {% for cat in sails.product_categories %}
            <li class="grid"><a href="/section/{{ cat.id }}/{{ cat.category_name | replace(' ', '-') | lower }}">{{ cat.category_name }}</a></li>
          {% endfor %}  
        </ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--bottom-header-->
	{% block body %} {% endblock %}		
	
	<!--start-footer-->
	<div class="footer">
		<div class="container">
			
		</div>
	</div>
	<!--end-footer-->
	<!--end-footer-text-->
	<div class="footer-text">
		<div class="container">
			<div class="footer-main">
				<p class="footer-class">© {{ Date() | date('Y') }} Kentz Ville Ltd.</p>
			</div>
		</div>
    <script src="/js/bootstrap.min.js"></script>
		<script type="text/javascript">
      $(document).ready(function() {
        {% block script %}
      {% endblock %}
        $().UItoTop({ easingType: 'easeOutQuart' });
        
      });
    </script>
    {% block scriptTag %} {% endblock %}
	</div>
	<!--end-footer-text-->
  {% block modal %} {% endblock %}
</body>
</html>