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
						<div class="ibox-content table-responsive">
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
                          <tr id="{{ order.id }}" data-user_id="{{ order.user.id }}">
                              <td>{{ order.createdAt | date('d M y, H:i') }}</td>
                              <td>{{ order.user.fullname }}</td>
                              <td>{{ order.user.phone }}</td>
                              <td class="text-right">{{ order.item_count }}</td>
                              <td>{{ order.delivery }}</td>
                              <td>{{ order.payment_method }}</td>
                              <td>{{ payment_status }}</td>
                              <td class="text-right hidden">&#8358;{{ order.total }}</td>
                              <td class="text-right hidden">&#8358;{{ order.delivery_fee }}</td>
                              <td class="text-right">&#8358;{{ (order.total) }}</td>
                              <td class="text-center">{{ order.status }}</td>
                              <td class="opt-icons dropdown">
                                  <a href="#orderDetailsModal" class="btn btn-info btn-xs view-order-items" data-toggle="modal"><i data-toggle="tooltip" title="View order details" class="fa-eye fa"></i></a>
                                  <button class="btn btn-default btn-xs" title="Change order status" data-toggle='dropdown' aria-haspopup='true' aria-expanded='true'><i class="fa fa-cog"></i></button>
                                  <ul class='dropdown-menu pull-left'>
                                      <li class='dropdown-header'>Change Order Status</li>
                                      <li><a href='#' class='change-status' id="Delivered"><i class="fa fa-check"></i> Delivered</a></li>
                                      <li><a href='#' class='change-status' id="Processing"><i class="fa fa-refresh"></i> Processing</a></li>
                                      <li><a href='#' class='change-status' id="Cancelled"><i class="fa fa-times"></i> Cancelled</a></li>
                                  </ul>
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

<div class="modal inmodal fade in" id="orderDetailsModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">Order Details</h4>
			</div>

			<div class="modal-body">
          <div>
              <h3>Customer's Address</h3>
              <div id="address"></div><br>
          </div>
          <div>
              <table class="table table-hover">
                  <thead>
                      <tr>
                          <th>Item</th>
                          <th class="text-right">Qty</th>
                          <th class="text-right">Unit Price</th>
                          <th class="text-right">Sub Total</th>
                      </tr>
                  </thead>
                  <tbody id="tb-items"></tbody>
              </table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default close-modal" data-dismiss="modal">
          <i class="fa fa-times"></i>
          Cancel
        </button>
      </div>
		</div>
	</div>
</div>
{% endblock %}
{% block scriptTag %}
<script src="/js/plugins/numeral.min.js"></script>
{% endblock %}
{% block script %}

$(".view-order-items").click(function() {
  var id = $(this).parents('tr').attr("id");
  var user_id = $(this).parents('tr').data('user_id');
  $.get('/order/get-order-details', { 'order_id': id, 'user_id': user_id }, function(d) {
      if (d.status.trim() == 'success') {
          $("#address").text(d.address);
          var tb = '';
          $.each(d.items, function(i, item) {
              tb += "<tr><td>" + item.product.product_name + "</td><td class='text-right'>" + item.qty + "</td><td class='text-right'>&#8358;" + numeral(item.unit_price).format('0,0') + "</td><td class='text-right'>&#8358;" + numeral(item.qty * item.unit_price).format('0,0') + "</td></tr>";
          });
          $("#tb-items").html(tb);
      }
  });
});


$(".change-status").click(function() {
    var id = $(this).parents('tr').attr("id");
    var $thisTr = $(this).parents('tr');
    var $this = $(this);
    $.post('/order/change-status', { 'id': id, 'status': $this.attr("id") }, function(d) {
        if (d.status.trim() == 'success') {
            $thisTr.find('td:nth-child(11)').text($this.attr("id"));
        }
    }, 'JSON');
});

  
$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});  
{% endblock %}  