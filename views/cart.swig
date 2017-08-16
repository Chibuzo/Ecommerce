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
  width: 30px;
  text-align: center;
}

.item-total {
  text-align: center;
}

.item-decrement, .item-increment {
  width: 5px;
}

.item-thumb img {
  width: 40px;
}

@media screen and (min-width: 200px) and (max-width: 600px) {
  .item-thumb {
    width: 30%;
  }
  
  .item-name, .item-total {
    width: auto;
    float: none;
  }
  
  .item-name {
    font-weight: bold;
  }
  
  .item-total, .item-remove {
    position: relative;
    width: 150px;
    clear: left;
    top: -34px;
    left: 65px;
  }
  
  .item-remove {
    top: -21px;
    left: 98px;
  }
  
  .headerRow, .item-price {
    display: none;
  }
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
        <div class="col-md-3 col-xs-12 col-sm-12 pull-right">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                    <strong>
                      Sub Total:
                      <br>Delivery Cost:
                      <br>Total:&nbsp;
                    </strong>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="simpleCart_total"></div>
                    <div class="simpleCart_shipping"></div>
                    <div class="simpleCart_grandTotal"></div>
                </div>
            </div>
            <br>
        </div>
    </div>
    <div class="row">
      <div class="col-md-12" style="padding-right: 10px">
        <a href="/checkout" class="btn btn-danger btn-lg pull-right">Proceed to Payment</a>
      </div>
    </div>  
		</div>
	</div>
{% endblock %}
  