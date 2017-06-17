{% extends 'theme.swig' %}
{% set title = 'Payment Options' %}

{% block body %}
<style>
#body {
  margin-top: 50px;
}

.inner-text {
  font-size: 16px;
}

#fullname {
  font-weight: bold;
}

.row-opts {
  border-bottom:
  #e0e0e0 solid thin;
  padding-bottom: 20px;
  margin-bottom: 20px;
}

.inner-div {
  font-size: 16px;
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
      <div class="col-md-5 inner-text">
        <div id="fullname">{{ req.session.fname }}</div>
        <div id="phone">{{ contact.phone }}</div>
        <div id="address">{{ contact.address }}</div><br>
      </div>
      <div class="col-md-2">
        <button data-target="#contactModal" class="btn btn-default btnsm edit-contact pull-right" data-toggle="modal"><i class="fa fa-pencil"></i> &nbsp;Edit Contact</button>
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
            <input type="radio" name="delivery_opt" value="Home Delivery" class="checkbox" />
            Home Delivery
          </label>
          Delivered in 1 - 7 working days to your address.<br>
          A standard delivery fee of N1,500 would be charged.
        </div>
      </div>
      <div class="col-md-4">
        <div class="inner-div">
          <label class="radio">
            <input type="radio" name="delivery_opt" value="Pickup" class="checkbox" />
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
            <input type="radio" name="payment_opt" value="Delivery" class="checkbox" />
            Pay Cash on Delivery
          </label>
        </div>
      </div>
      <div class="col-md-4">
        <div class="inner-div">
          <label class="radio">
            <input type="radio" name="payment_opt" value="Bank" />
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
    <div class="simpleCart_items hidden"></div>
    <div class="alert alert-danger inner-text hidden"></div>
    <div class="col-md-12"><a href="javascript:;" class="btn btn-danger btn-lg pull-right kv-checkout">Save and Continue</a></div>
    <a href="javascript:;" class="hidden simpleCart_checkout">Checkout</a>
  </div>
</div>
{% endblock %}

{% block modal %}
<div class="modal fade in" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">Edit Contact Details</h4>
			</div>  
      <form action="" method="post" id='form-edit'>
          <div class="modal-body">
							<div class="form-group">
								<div class="row">
									<div class="col-md-12">
										<label for="fullname">Fullname</label>
										<input type='text' class="form-control" name='fullname' value="{{ req.session.fname }}" placeholder='Enter your fullname' />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="username">Delivery address</label>
								<textarea class="form-control" name='address' placeholder='Enter delivery address'>{{ contact.address }}</textarea>
							</div>

							<div class="form-group">
								<label for="username">Phone number</label>
								<input type='text' class="form-control" name='phone' value="{{ contact.phone }}" placeholder='Enter your phone number' />
							</div>
							<input type="hidden" name="user_id" value="{{ req.session.userId }}" />
              <input type="hidden" name="contact_id" value="{{ contact.id }}" />
          </div>
          <div class="modal-footer">
							<button type="button" class="btn btn-default"" data-dismiss="modal" id="cancel">Cancel</button>
              <input type="submit" class="btn btn-danger" value="Save details" />
          </div>
			</form>
      </div>
	</div>
</div>
{% endblock %}

{% block script %}
  // submit and save delivery details
$('#form-edit').submit(function(e) {
    e.preventDefault();

    $.post('/user/update-details', $(this).serialize(), function(d) {
        if (d.status.trim() == 'success') {
            $('#fullname').text($("[name='fullname']").val());
            $('#address').text($("[name='address']").val());
            $('#phone').text($("[name='phone']").val());
            $("#cancel").click();
        }
    }, 'JSON');
});
  
  $(".kv-checkout").click(function() {
      if ($("input[name='delivery_opt']").is(':checked') === false) {
        $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; Please select delivery option to continue").removeClass("hidden");
        return false;
      }
      
      if ($("input[name='payment_opt']").is(':checked') === false) {
        $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; Please select payment option to continue").removeClass("hidden");
        return false;
      }
      
      if ($('#address').text().length < 0 || $('#phone').text().length < 0) {
          $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; Please make sure that your contact details is complete.").removeClass("hidden");
          return false;
      }
    
      $(".simpleCart_checkout").click();
      $(".simpleCart_empty").click();
  });
  
  simpleCart.bind( 'load' , function() {
    var total = $(".simpleCart_total").text().split('₦').pop();
    
    simpleCart({
        checkout: { 
            type: "SendForm" , 
            url: "/checkout/cart-items",
            extra_data: {
              total: total,
              shipping: simpleCart.shipping()
            }
        } 
    });
  });
  
  simpleCart.bind( 'beforeCheckout' , function( data ){
    data.payment_method = $("input[name='payment_opt']:checked").val();
    data.delivery_opt = $("input[name='delivery_opt']:checked").val();
  });
{% endblock %}