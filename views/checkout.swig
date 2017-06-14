{% extends 'theme.swig' %}
{% set title = 'Payment Options' %}

{% block body %}
<style>
#body {
  margin-top: 50px;
}

.inner-text {
  font-size: 17px;
}

#c_name {
  font-weight: bold;
}

.row-opts {
  border-bottom:
  #e0e0e0 solid thin;
  padding-bottom: 20px;
  margin-bottom: 20px;
}

.inner-div {
  font-size: 17px;
}

.acc-details {
  margin-top: 15px;
}
</style>

<div class="container" id="body">
  <div class="row row-opts">
    <div class="col-md-12">
      <div class="col-md-3">
        <h3>Delivery address</h3>
      </div>
      <div class="col-md-7 inner-text">
        <div id="c_name">{{ req.session.fname }}</div>
        <div>{{ contact.phone }}</div>
        <div>{{ contact.address }}</div>
      </div>
    </div>
  </div>
  
  <div class="row row-opts">
    <div class="col-md-12">
      <div class="col-md-3">
        <h3>Delivery Method</h3>
      </div>
      <div class="col-md-4">
        <div class="inner-div">
          <label class="radio">
            <input type="radio" name="delivery_opt" value="home" class="checkbox" />
            Home Delivery
          </label>
          Delivered in 1 - 7 working days to your address.<br>
          A standard delivery fee of N1,500 would be charged.
        </div>
      </div>
      <div class="col-md-4">
        <div class="inner-div">
          <label class="radio">
            <input type="radio" name="delivery_opt" value="pickup" class="checkbox" />
            Pick up from our Store
          </label>
          You can pick your item(s) from any of our stores close to you within 1 - 5 days of confirming your order
        </div>
      </div>
    </div>
  </div>
  
  <div class="row row-opts">
    <div class="col-md-12">
      <div class="col-md-3">
        <h3>Payment Option</h3>
      </div>
      <div class="col-md-4">
        <div class="inner-div">
          <label class="radio">
            <input type="radio" name="payment_opt" value="delivery" class="checkbox" />
            Pay Cash on Delivery
          </label>
        </div>
      </div>
      <div class="col-md-4">
        <div class="inner-div">
          <label class="radio">
            <input type="radio" name="payment_opt" value="bank" />
            Bank Deposit or Transfer
          </label>
          Make a cash deposit or online transfer into any of our corporate bank account listed.
          {% for acc in accounts %}
            <div class="acc-details">
              <div><strong>{{ acc.account_name }}</strong></div>
              <div>{{ acc.account_number }}</div>
              <div>{{ acc.bank }}</div>
            </div>
           {% endfor %}
        </div> 
      </div>
    </div>
  </div>
  <div class="row">
    <div class="alert alert-danger inner-text hidden"></div>
    <div class="col-md-12"><a href="javascript:;" class="btn btn-danger btn-lg pull-right kv-checkout">Save and Continue</a></div>
    <a href="javascript:;" class="hidden simpleCart_checkout">Checkout</a>
  </div>
</div>
{% endblock %}

{% block script %}
  
  $(".kv-checkout").click(function() {
      if ($("input[name='delivery_opt']").is(':checked') === false) {
        $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; Please select delivery option to continue").removeClass("hidden");
        return false;
      }
      
      if ($("input[name='payment_opt']").is(':checked') === false) {
        $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; Please select payment option to continue").removeClass("hidden");
        return false;
      }
    
      $(".simpleCart_empty").click();
      $(".simpleCart_checkout").click();
  });
  
  simpleCart.bind( 'load' , function() {
    var total = $(".simpleCart_total").text().split('$').pop();
    
    simpleCart({
        checkout: { 
            type: "SendForm" , 
            url: "/checkout/cart-items",
            extra_data: {
              total: total
            }
        } 
    });
  });
  
  simpleCart.bind( 'beforeCheckout' , function( data ){
    data.payment_method = $("input[name='payment_opt']:checked").val();
    data.delivery_opt = $("input[name='delivery_opt']:checked").val();
    //data.total = total;
  });
{% endblock %}