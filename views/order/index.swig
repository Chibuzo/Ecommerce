{% extends '../admin/admin-layout.swig' %}
{% set title = 'Manage Orders' %}
{% block body %}
  <div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-md-4">
			<h2>Manage Customer Orders</h2>
			<ol class="breadcrumb">
				<li>
					<a href="index.html">Admin</a>
				</li>
				<li class="active">
					<strong>Orders</strong>
				</li>
			</ol>
		</div>
	</div>

	<div class="wrapper wrapper-content">
		<div class="animated fadeInRight">
			<div class="row">
				<div class="col-md-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Orders</h5>
							<div class="ibox-tools">
							</div>
						</div>
						<div class="ibox-content">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Order Date</th>
                            <th>Customer</th>
                            <th>Phone</th>
                            <th class="text-right">Items</th>
                            <th>Delivery</th>
                            <th>Payment Method</th>
                            <th>Payment</th>
                            <th class="text-right hidden">Sub Total</th>
                            <th class="text-right hidden">Delivery Fees</th>
                            <th class="text-right">Total</th>
                            <th class="text-center">Order</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for order in orders %}
                          {% if order.payment.status %}
                            {% set payment_status = order.payment.status %}
                          {% else %}
                            {% set payment_status = 'Pending' %}
                          {% endif %}  
                          <tr id="{{ order.id }}">
                              <td>{{ order.createdAt | date('d M y, H:i') }}</td>
                              <td>{{ order.user.fullname }}</td>
                              <td>{{ order.user.phone }}</td>
                              <td class="text-right">{{ order.item_count }}</td>
                              <td>{{ order.delivery }}</td>
                              <td>{{ order.payment_method }}</td>
                              <td>{{ payment_status }}</td>
                              <td class="text-right hidden">&#8358;{{ order.total | formatCurrency }}</td>
                              <td class="text-right hidden">&#8358;{{ order.delivery_fee | formatCurrency }}</td>
                              <td class="text-right">&#8358;{{ (order.total) | formatCurrency }}</td>
                              <td class="text-center">{{ order.status }}</td>
                              <td class="opt-icons">
                                  <a href='' class=""><i class="fa fa-cog"></i></a>
                              </td>
                          </tr>
                        {% endfor %}
                    </tbody>
                </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
{% endblock %}

{% block script %}
  

  
$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});  
{% endblock %}  