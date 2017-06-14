{% extends '../admin/admin-layout.swig' %}
{% set title = 'Manage Inventory' %}
{% block body %}
  <div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-md-4">
			<h2>Inventory Management</h2>
			<ol class="breadcrumb">
				<li>
					<a href="index.html">Admin</a>
				</li>
				<li class="active">
					<strong>Inventory</strong>
				</li>
			</ol>
		</div>
    <div class="col-md-8"><br>
        <button type="button" class="btn btn-danger btn-lg pull-right" data-toggle="modal" data-target="#inventoryModal"><i class="fa fa-plus"></i> Add Inventory</button>
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
						<div class="ibox-content">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Date Added</th>
                            <th>Item Name</th>
                            <th>Category</th>
                            <th>Sub Category</th>
                            <th class="text-right">Stock</th>
                            <th>Color</th>
                            <th class="text-right">Cost Price</th>
                            <th class="text-right">Selling Price</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for item in items %}
                            <tr id="{{ item.id }}">
                                <td>{{ item.createdAt | date('d M Y') }}</td>
                                <td>{{ item.product_name }}</td>
                                <td id="{{ item.category.id }}">{{ item.category.category_name }}</td>
                                <td id="{{ item.sub_category.id }}">{{ item.sub_category.sub_category_name }}</td>
                                <td class="text-right">{{ item.stock }}</td>
                                <td>{{ item.color }}</td>
                                <td class="text-right">&#8358;{{ item.cost_price }}</td>
                                <td class="text-right">&#8358;{{ item.selling_price }}</td>
                                <td class="hidden">{{ item.description }}</td>
                                <td class="opt-icons">  
                                    <a href='' class='edit-item btn btn-default btn-xs' data-toggle='tooltip' title='Edit Item'><i class='fa fa-pencil fa-lg'></i></a>                                                                        
                                    <a href='/item/{{ item.id }}' class='btn btn-info btn-xs' data-toggle='tooltip' title='View Item'><i class='fa fa-eye fa-lg'></i></a>
                                    <a href='' class='delete-item btn btn-danger btn-xs' data-toggle='tooltip' title='Remove Item'><i class='fa fa-trash fa-lg'></i></a>
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
  
  {% include 'inventory-modal.swig' %}
  {% include 'edit-inventory-modal.swig' %}
  
{% endblock %}

{% block script %}
$(".category").change(function() {
  var category_id = $(this).find("option:selected").val();
  var $parent = $(this).parents('.modal-body');
  $.get('/sub-category/get-sub', {'category_id': category_id }, function(d) {
      if (d.status.trim() == 'success') {
          var opt = "<option value=''>-- Select Sub Category --</option>";
          $.each(d.sub_cat, function(i, val) {
              opt += "<option value='" + val.id + "'>" + val.sub_category_name + "</option>";
          });
          $parent.find(".sub-category").html(opt);
      }
  });
});


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

$(".delete-item").click(function() {
    if (confirm("Are you sure you want to delete this item?")) {
        var id = $(this).parents('tr').attr('id');
        $.get('/product/delete/' + id);
    }
});
  
  
$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});  
{% endblock %}  