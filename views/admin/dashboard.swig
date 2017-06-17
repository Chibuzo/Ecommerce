{% extends 'admin-layout.swig' %}
{% set title = 'Dashboard' %}
{% block body %}

<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-4">
		<h2>Dashboard</h2>
		<ol class="breadcrumb">
			<li>
				<a href="index.html">Admin</a>
			</li>
			<li class="active">
				<strong>Dashboard</strong>
			</li>
		</ol>
	</div>
</div>

<div class="wrapper wrapper-content">
	<div class="animated fadeInRight">
		<div class="row">
			<div class="col-md-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>Recent Orders</h5>
					</div>
					<div class="ibox-content">
						<table class="table table-striped">
              <thead>
                <tr>
                  <th>Order Date</th>
                  <th>Customer</th>
                  <th>Phone</th>
                  <th class="text-right">Items</th>
                  <th class="text-right">Total</th>
                </tr>
              </thead>
              <tbody>
                {% for order in orders %}
                  <tr>
                    <td>{{ order.createdAt | date('d/m/Y') }}</td>
                    <td>{{ order.user.fullname }}</td>
                    <td>{{ order.user.phone }}</td>
                    <td class="text-right">{{ order.item_count }}</td>
                    <td class="text-right">&#8358;{{ order.total | formatCurrency }}</td>
                  </tr>
                {% endfor %}  
              </tbody>
            </table>
					</div>
				</div>
			</div>
      
      <div class="col-md-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>Recent Payments</h5>
					</div>
					<div class="ibox-content">
						<table class="table table-striped">
              <thead>
                <tr>
                  <th>Date</th>
                  <th>Customer</th>
                  <th>Phone</th>
                  <th>Order #</th>
                  <th class="text-right">Amount</th>
                </tr>
              </thead>
              <tbody>
                {% for pay in payments %}
                  <tr>
                    <td>{{ pay.createdAt | date('d/m/Y') }}</td>
                    <td>{{ pay.user.fullname }}</td>
                    <td>{{ pay.user.phone }}</td>
                    <td>{{ pay.order }}</td>
                    <td class="text-right">&#8358;{{ pay.amount | formatCurrency }}</td>
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
