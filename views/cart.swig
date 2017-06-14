{% extends 'theme.swig' %}
{% set title = 'Checkout' %}

{% block body %}
<style> 
.headerRow {
  width: 100%;
  display: block;
  font-weight: bold;
  padding: 8px 1px;
  font-size: 19px;
  overflow: auto;
  border-bottom: #6495ED solid;
  margin-bottom: 10px;
}

.itemRow {
  clear: both;
  width: 100%;
  display: block;
  padding: 13px 10px;
  border-bottom: #e0e0e0 solid thin;
  overflow: auto;
}

[class^="item-"] {
  float: left;
}

.item-cid {
  display: none;
}

.item-thumb, .item-name, .item-price, .item-total {
  width: 20%;
}

.item-quantity {
  width: 50px;
  text-align: center;
}

.item-total {
  text-align: center;
}

.item-decrement, .item-increment {
  width: 10px;
}

.item-thumb img {
  width: 60px;
}
</style>  
<div class="ckeckout">
		<div class="container">
			<div class="ckeckout-top">
			<div class="cart-items heading">
			 <h3>My Shopping Cart(<span class="simpleCart_quantity"></span>)</h3>
				
			<div class="in-check" >        
        <div class="simpleCart_items"></div>
				
			</div>
			</div>  
		 </div>
      
      <div class="row" style="margin-top: 30px">
        <div class="col-md-4 col-xs-12 pull-right">
            <div class="calc">
                <div class="dl-horizontal">
                    <dt>Sub Total:</dt><dd class="dd simpleCart_total"></dd>
                    <dt>Delivery Cost:</dt><dd>&#8358; 1500</dd>
                    <dt>Total:</dt><dd>&#8358; 3400</dd>
                </div>
                <br>
            </div>
        </div>
    </div>
    <div class="row">
      <div class="col-md-12" style="padding-right: 40px">
        <a href="/checkout" class="btn btn-danger btn-lg pull-right">Proceed to Payment</a>
      </div>
    </div>  
		</div>
	</div>
  {% endblock %}