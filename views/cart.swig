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
            <h1>Shopping Cart</h1>
        </div>
    </div>
</div>
<div class="cart block">
    <div class="container">
        <table class="cart__table cart-table table">
            <thead class="cart-table__head">
                <tr class="cart-table__row">
                    <th class="cart-table__column cart-table__column--image">Image</th>
                    <th class="cart-table__column cart-table__column--product">Product</th>
                    <th class="cart-table__column cart-table__column--price">Price</th>
                    <th class="cart-table__column cart-table__column--quantity">Quantity</th>
                    <th class="cart-table__column cart-table__column--total">Sub Total</th>
                    <th class="cart-table__column cart-table__column--remove"></th>
                </tr>
            </thead>
            <tbody class="cart-table__body cart-tb">
                {% for item in items %}
                    <tr class="cart-table__row">
                        <td class="cart-table__column cart-table__column--image"><a href="#"><img
                                    src="images/products/product-1.jpg" alt=""></a></td>
                        <td class="cart-table__column cart-table__column--product"><a href="#"
                                class="cart-table__product-name">Electric Planer Brandix KL370090G 300 Watts</a>
                            <ul class="cart-table__options">
                                <li>Color: Yellow</li>
                                <li>Material: Aluminium</li>
                            </ul>
                        </td>
                        <td class="cart-table__column cart-table__column--price" data-title="Price">&#8358;699.00</td>
                        <td class="cart-table__column cart-table__column--quantity" data-title="Quantity">
                            <div class="input-number"><input class="form-control input-number__input"
                                    type="number" min="1" value="2">
                                <div class="input-number__add"></div>
                                <div class="input-number__sub"></div>
                            </div>
                        </td>
                        <td class="cart-table__column cart-table__column--total" data-title="Total">&#8358;1,398.00
                        </td>
                        <td class="cart-table__column cart-table__column--remove"><button type="button"
                                class="btn btn-light btn-sm btn-svg-icon"><svg width="12px" height="12px">
                                    <use xlink:href="images/sprite.svg#cross-12"></use>
                                </svg></button></td>
                    </tr>

                {% endfor %}
            </tbody>
            <tfoot>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td class="text-right">Total: <strong class="total"></strong></td>
                <td></td>
            </tfoot>
        </table>
        <div class="cart__actions">
            <form class="cart__coupon-form">
                <label for="input-coupon-code" class="sr-only">Coupon Code</label>
                <input type="text" class="form-control" id="input-coupon-code" placeholder="Coupon Code">
                <button type="submit" class="btn btn-primary">Apply Coupon</button>
            </form>
            <div class="cart__buttons">
                <a href="index.html" class="btn btn-light">Continue Shopping</a> 
                <a href="#" class="btn btn-primary cart__update-button" onClick="updateCart()">Update Cart</a>
            </div>
        </div>
        <div class="row justify-content-end pt-5">
            <div class="col-12 col-md-7 col-lg-6 col-xl-5">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">Cart Totals</h3>
                        <table class="cart__totals">
                            <thead class="cart__totals-header">
                                <tr>
                                    <th>Subtotal</th>
                                    <td id="sub-total">&#8358;0.00</td>
                                </tr>
                            </thead>
                            <tbody class="cart__totals-body">
                                <tr>
                                    <th>Shipping</th>
                                    <td>&#8358;25.00<div class="cart__calc-shipping"><a href="#">Calculate
                                                Shipping</a></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Tax</th>
                                    <td>&#8358;0.00</td>
                                </tr>
                            </tbody>
                            <tfoot class="cart__totals-footer">
                                <tr>
                                    <th>Total</th>
                                    <td id="total">&#8358;0.00</td>
                                </tr>
                            </tfoot>
                        </table><a class="btn btn-primary btn-xl btn-block cart__checkout-button"
                            href="/checkout">Proceed to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>        

{% endblock %}

{% block scriptTag %}
<script>
    renderCart(cartLS.list());
</script>
{% endblock %}