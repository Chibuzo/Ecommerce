{% extends 'theme.swig' %}

{% block category %}
    <div class="departments" data-departments-fixed-by="">
{% endblock %}

{% block body %}
<div class="page-header">
    <div class="page-header__container container">
        <div class="page-header__breadcrumb">
            
        </div>
        <div class="page-header__title">
            <h1>Checkout</h1>
        </div>
    </div>
</div>
<div class="checkout block">
    <div class="container">
        {% if !user %}
            <div class="row">
                <div class="col-12 mb-3">
                    <div class="alert alert-lg alert-primary">Returning customer? <a href="#loginModal" data-toggle="modal">Click here to
                            login</a></div>
                    </div>
                </div>    
            <div>
        {% else %}  
            <input type="hidden" id="user-email" value="{{ user.email }}" />
        {% endif %}

        <form id="order-form" method="post">
            <div class="row">    
                <div class="col-12 col-lg-6 col-xl-7">
                    <div class="card mb-lg-0">
                        {% if !user %}
                        <div class="card-body">
                            <h3 class="card-title">Your details</h3>
                            <div class="form-row">
                                <div class="form-group col-md-6"><label for="checkout-first-name">First
                                        Name</label> <input type="text" class="form-control" name="fname"
                                        id="checkout-first-name" placeholder="First Name"></div>
                                <div class="form-group col-md-6"><label for="checkout-last-name">Last
                                        Name</label> <input type="text" class="form-control" name="lname"
                                        id="checkout-last-name" placeholder="Last Name"></div>
                            </div>
                            
                            <div class="form-group"><label for="checkout-street-address">Street Address</label>
                                <input type="text" class="form-control" id="checkout-street-address" name="address"
                                    placeholder="Street Address">
                            </div>

                             <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="checkout-city">City</label> 
                                    <input type="text" class="form-control" id="checkout-city" name="city">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="checkout-state">State</label> 
                                    <input type="text" class="form-control" id="checkout-state" name="state">
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group col-md-6"><label for="checkout-email">Email
                                        address</label> <input type="email" class="form-control" name="email"
                                        id="checkout-email" placeholder="Email address"></div>
                                <div class="form-group col-md-6"><label for="checkout-phone">Phone</label>
                                    <input type="text" class="form-control" id="checkout-phone" name="phone"
                                        placeholder="Phone">
                                </div>
                            </div>
                             <div class="form-row">
                                <div class="form-group col-md-6"><label for="checkout-email">Password
                                        </label> <input type="password" class="form-control" name="password"
                                        id="password" placeholder="Enter Password"></div>
                                <div class="form-group col-md-6"><label for="checkout-phone">Confirm Password</label>
                                    <input type="password" class="form-control" id="verify-password" name="verify_password"
                                        placeholder="Confirm Password">
                                </div>
                            </div>
                            
                        </div>
                        {% endif %}
                        <div class="card-divider"></div>
                        <div class="card-body">
                            <h4>Delivery Info</h4>
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="payment-methods__item-header">
                                        <span class="payment-methods__item-radio input-radio">
                                            <span class="input-radio__body">
                                                <input class="input-radio__input" name="delivery_opt" type="radio" value="delivery"> 
                                                <span class="input-radio__circle"></span> 
                                            </span>
                                        </span>
                                        <span class="payment-methods__item-title">Home Delivery</span>
                                    </label>
                                </div>    

                                <div class="col-md-6">
                                    <label class="payment-methods__item-header">
                                        <span class="payment-methods__item-radio input-radio">
                                            <span class="input-radio__body">
                                                <input class="input-radio__input" name="delivery_opt" type="radio" value="pick-up"> 
                                                <span class="input-radio__circle"></span> 
                                            </span>
                                        </span>
                                        <span class="payment-methods__item-title">Pick up from store</span>
                                    </label>
                                </div>    
                            </div>    
                            <br>
                            <div class="form-group">
                                <label for="checkout-comment">Order notes <span
                                        class="text-muted">(Optional)</span></label> <textarea
                                    id="checkout-comment" class="form-control" rows="4" name="note"></textarea></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6 col-xl-5 mt-4 mt-lg-0">
                    <div class="card mb-0">
                        <div class="card-body">
                            <h3 class="card-title">Your Order</h3>
                            <table class="checkout__totals">
                                <thead class="checkout__totals-header">
                                    <tr>
                                        <th>Product</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody class="checkout__totals-products">
                                    
                                </tbody>
                                <tbody class="checkout__totals-subtotals">
                                    <tr>
                                        <th>Subtotal</th>
                                        <td id="sub-total">₦0.00</td>
                                    </tr>
                                    <tr>
                                        <th>Shipping</th>
                                        <td>₦25.00</td>
                                    </tr>
                                </tbody>
                                <tfoot class="checkout__totals-footer">
                                    <tr>
                                        <th>Total</th>
                                        <td id="total">₦0.00</td>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="payment-methods">
                                <ul class="payment-methods__list">
                                    <li class="payment-methods__item"><label
                                            class="payment-methods__item-header"><span
                                                class="payment-methods__item-radio input-radio"><span
                                                    class="input-radio__body"><input class="input-radio__input"
                                                        name="checkout_payment_method" type="radio" value="cash"> <span
                                                        class="input-radio__circle"></span> </span></span><span
                                                class="payment-methods__item-title">Cash on
                                                delivery</span></label>
                                        <div class="payment-methods__item-container">
                                            <div class="payment-methods__item-description text-muted">Pay with
                                                cash upon delivery.</div>
                                        </div>
                                    </li>
                                    <li class="payment-methods__item"><label
                                            class="payment-methods__item-header"><span
                                                class="payment-methods__item-radio input-radio"><span
                                                    class="input-radio__body"><input class="input-radio__input"
                                                        name="checkout_payment_method" type="radio" value="online"> <span
                                                        class="input-radio__circle"></span> </span></span><span
                                                class="payment-methods__item-title">Online Payment (Paystack)</span></label>
                                        <div class="payment-methods__item-container">
                                            <div class="payment-methods__item-description text-muted">
                                                Pay with your debit card or USSD
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="checkout__agree form-group">
                                <div class="form-check">
                                    <span class="form-check-input input-check">
                                    <span class="input-check__body">
                                        <input class="input-check__input" type="checkbox" id="checkout-terms">
                                        <span class="input-check__box"></span>
                                            <svg class="input-check__icon" width="9px" height="7px">
                                                <use xlink:href="images/sprite.svg#check-9x7"></use>
                                            </svg>
                                        </span>
                                    </span>
                                    <label class="form-check-label" for="checkout-terms">I have read and agree to the website
                                        <a target="_blank" href="terms-and-conditions.html">terms and conditions</a>*
                                    </label>
                                </div>
                            </div>
                            <div class="alert alert-danger d-none"></div>
                            <button type="submit" class="btn btn-primary btn-xl btn-block">Place Order</button>
                        </div>
                    </div>
                </div>  
            </div>
        </form>    
    </div>
</div>

{% include "user/login-modal.swig"  %}
{% endblock %}   


{% block scriptTag %}
<script src="https://js.paystack.co/v1/inline.js"></script>
<script>
    const items = cartLS.list();
    const total = cartLS.total();

    $("#order-form").submit(function(e) {
        e.preventDefault();

        if ($("input[name='checkout_payment_method']").is(':checked') === false) {
            $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; Please select payment option to continue").removeClass("d-none");
            return false;
        }

        if ($("#checkout-terms").is(':checked') === false) {
            $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; You have to read and agree with the Terms & Conditions to continue").removeClass("d-none");
            return false;
        }

        // if ($("#password").val() !== $("#verify-password").val()) {
        //     $(".alert-danger").html("<i class='fa fa-info-circle fa-lg'></i> &nbsp; Password doesn't match").removeClass("d-none");
        //     return false;
        // }

        const formData = $(this).serialize() + '&items=' + JSON.stringify(items);
        if ($("input[name='checkout_payment_method']:checked").val() == 'cash') {
            postOrder(formData);
        } else if ($("input[name='checkout_payment_method']:checked").val() == 'online') {
            if (cartLS.list().length) postOrder(formData);
            const email = $("input[name='email']").val() || $("#user-email").val();
            console.log(email)
            payWithPaystack(email, parseInt(total, 10) * 100);
        }
    });

    $("#login-form").submit(function(e) {
        e.preventDefault();
        $.post('/user/signin', $(this).serialize(), function(d) {
            if (d.status.trim() == 'success') {
                location.reload();
            }
        });
    });

    listOrderItems(items);

function postOrder(formData) {
    $.post('/order/save', formData, function(d) {
        if (d.status.trim() == 'success') {
            cartLS.destroy();
            if (d.data.payment_method.trim() == 'cash') {
                location.replace('/confirmation?q=c');
            }
            // } else if (d.data.payment_method.trim() == 'online') {
            //     const { email, total_amount } = d.data;
            //     payWithPaystack(email, total_amount);
            // }
        }
    });
}


function payWithPaystack(email, amount) {
    var handler = PaystackPop.setup({
        // key: 'pk_live_b3743bc7dcaf617dbc44185234fd260f237d3846',
        key: 'pk_test_1af52eb927ab26800c2a1fd2a705f9823375333b',
        email,
        amount,
        currency: "NGN",
        callback: function(response){
            const { reference, status } = response;

            // ajax call to send email
            $.post('/confirmpayment', { reference, status, amount }, function(d) {
                if (d.status.trim() === 'success') {
                    location.replace('/confirmation?q=o');
                }
            }, 'JSON');
        },
        onClose: function(){
            alert('Payment cancelled');
        }
    });
    handler.openIframe();
}
</script>
{% endblock %}