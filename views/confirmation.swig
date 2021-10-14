{% extends 'theme.swig' %}
{% set title = 'Order Comfirmation' %}

{% block category %}
    <div class="departments" data-departments-fixed-by="">
{% endblock %}

{% block body %}
<div class="page-header">
    <div class="page-header__container container">
        <div class="page-header__breadcrumb">
            
        </div>
        <div class="page-header__title">
            
        </div>
    </div>
</div>
<div class="checkout block">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Order Confirmation</h3>
                <div class="alert alert-info">
                    Thank you for choosing us!<br>
                    We'll take it from here and keep you posted while processing your order.
                </div>
            </div>
        </div>
    </div>
</div>    
{% endblock %}