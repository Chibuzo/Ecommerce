{% extends '../admin/admin-layout.swig' %}
{% set title = 'Manage Merchants' %}
{% block body %}
  <div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-md-4">
			<h2>Inventory Management</h2>
			<ol class="breadcrumb">
				<li>
					<a href="index.html">Admin</a>
				</li>
				<li class="active">
					<strong>Merchants</strong>
				</li>
			</ol>
		</div>
    <div class="col-md-8"><br>
        <button type="button" class="btn btn-danger btn-lg pull-right" data-toggle="modal" data-target="#merchantModal"><i class="fa fa-plus"></i> Add Merchant</button>
    </div>
	</div>

	<div class="wrapper wrapper-content">
		<div class="animated fadeInRight">
			<div class="row">
				<div class="col-md-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Category</h5>
							<div class="ibox-tools">
							</div>
						</div>
						<div class="ibox-content table-responsive">
                <table class="table table-striped dataTable table-bordered">
                    <thead>
                        <tr>
                            <th>Date Added</th>
                            <th>Merchant</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th class="text-right">Items</th>
                            <th class="text-right">Current Orders</th>
                            <th class="text-right">All Orders</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for merchant in merchants %}
                            <tr id="{{ merchant.id }}">
                                <td>{{ merchant.createdAt | date('d M Y') }}</td>
                                <td>{{ merchant.name }}</td>
                                <td>{{ merchant.address }}</td>
                                <td>{{ merchant.email }}</td>
                                <td>{{ merchant.phone }}</td>
                                <td class="text-right">{{ merchant.item }}</td>
                                <td class="text-right">{{ merchant.current_orders }}</td>
                                <td class="text-right">{{ merchant.all_orders }}</td>
                                <td class="opt-icons">  
                                    <a href='' class='edit-item btn btn-default btn-xs' data-toggle='tooltip' title='Edit Merchant'><i class='fa fa-pencil fa-lg'></i></a>                                                                        
                                    <a href='' class='delete-item btn btn-danger btn-xs' data-toggle='tooltip' title='Delete Merchant'><i class='fa fa-trash fa-lg'></i></a>
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
  
  {% include 'merchant-modal.swig' %}
{% endblock %}

{% block scriptTag %}
   <script src="/js/plugins/datatables.min.js"></script>
{% endblock %}
{% block script %}

$(".edit-item").click(function(e) { 
    e.preventDefault();
    var $thisParent = $(this).parents('tr');
    var category_id = $thisParent.find('td:nth-child(3)').attr('id');
    var sub_category_id = $thisParent.find('td:nth-child(4)').attr('id');
    $.get('/sub-category/get-sub', {'category_id': category_id }, function(d) {
      if (d.status.trim() == 'success') {
          var opt = "<option value=''>-- Select Sub Category --</option>";
          $.each(d.sub_cat, function(i, val) {
              if (sub_category_id == val.id)
                  opt += "<option value='" + val.id + "' selected=selected>" + val.sub_category_name + "</option>";
              else
                  opt += "<option value='" + val.id + "'>" + val.sub_category_name + "</option>";
          });
          $("#edit-sub-category").html(opt);
      }
    });
    var product_id = $thisParent.attr("id");
    $("#product-name").val($thisParent.find('td:nth-child(2)').text());
    $("#category_id").find("option").filter(function(i) {
        return $thisParent.find('td:nth-child(3)').text() == $(this).text();
    }).attr("selected", "selected");
    $("#stock").val($thisParent.find('td:nth-child(5)').text());
    $("#color").val($thisParent.find('td:nth-child(6)').text());
    $("#cost").val($thisParent.find('td:nth-child(7)').text().split('₦').pop());
    $("#price").val($thisParent.find('td:nth-child(8)').text().split('₦').pop());
    $("#item-id").val(product_id);
    $("#description").val($thisParent.find('td:nth-child(9)').text())
    
    $("#editInventoryModal").modal();
});

$(".delete-merchant").click(function(e) {
    e.preventDefault();
    if (confirm("Are you sure you want to delete this merchant?")) {
        var id = $(this).parents('tr').attr('id');
        $.get('/product/delete/' + id);
    }
});


$('.dataTable').DataTable({
    pageLength: 25,
    responsive: true,
    responsive: true,
    "aoColumnDefs": [
         { 'bSortable': false, 'aTargets': [ 2, 3, 8 ] }
       ]
});

  
$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});  
{% endblock %}  