{% extends '../admin/admin-layout.swig' %}
{% set title = item.description %}
{% block body %}
<style>
.item-photo {
    padding: 10px;
}

.photo {
    margin-bottom: 20px;
}

.photo img {
    height: 200px;
}

.item-details {
    padding: 10px;
}

.menu {
    visibility: hidden;
    position: relative;
    top: -100px;
    text-align: center;
}

.col-md-6:hover .menu {
    visibility: visible;
}

.feature {
    padding: 5px;
}

.opt a:link {
    font-size: 11px !important;
}
</style>  
  <div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-md-4">
			<h2>Item Details</h2>
			<ol class="breadcrumb">
				<li>
					<a href="index.html">Admin</a>
				</li>
				<li class="active">
					<strong>Item Details</strong>
				</li>
			</ol>
		</div>
	</div>

	<div class="wrapper wrapper-content">
		<div class="animated fadeInRight">
			<div class="row">
				<div class="col-md-12">
					<div class="ibox float-e-margins">
						<div class="ibox-content">
                <div class="row">
                    <div class="col-md-5">
                        <div class="item-photo row">
                            {% for photo in photos %}
                                <div class="col-md-6">
                                    <div class="photo"><img src="/product_photos/browse/{{ photo }}" /></div>
                                    <div class="menu" data-photo-name="{{ photo }}">
                                        <button type="button" class="change-photo btn btn-warning btn-xs"><i class="fa fa-edit"></i> Change</button>
                                        <button type="button" class="remove-photo btn btn-danger btn-xs"><i class="fa fa-trash"></i> Remove</button>
                                    </div>
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="item-details">
                            <h2 class="item-title"><strong>{{ item.product_name }}</strong></h2>
                            <div class="make"></div>
                            <hr>
                            <h4>Product Description</h4>
                            <div>{{ item.description }}</div>
                            <hr>
                            <h4>Key Features</h4>
                            <div class="features">
                                <form action="/product/add-feature" method="post" id="form-feature">
                                    <div class="form-group">
                                        <div class="row">
                                            <input type="hidden" name="product_id" value="{{ item.id }}" />
                                            <div class="col-md-4"><input type="text" name="feature" class="form-control" placeholder="E.g camera specs" /></div>
                                            <div class="col-md-7"><input type="text" name="feature_value" class="form-control" placeholder="E.g 16 Mega Pixels" /></div>
                                            <div class="col-md-1"><button type="submit" class="btn btn-info">Add</dic>
                                        </div>
                                    </div>
                                </form>
                                <hr>
                                {% for feat in item.keyfeatures %}
                                    {% if feat.removed == false %}
                                      <div class="feature">
                                          <strong>{{ feat.feature_name }}: </strong>{{ feat.feature_value }}
                                          <div class="opt pull-right">
<!--                                              <a href='' class='edit-feature' data-toggle="tooltip" title='Edit Feature'>Edit</a> .-->
                                              <a href='/remove-feature/{{ feat.id }}' data-toggle="tooltip" title="Remove Feature">Del</a>
                                          </div>
                                      </div>
                                    {% endif %}  
                                {% endfor %}    
                            </div>
                            <button class="hidden btn btn-warning btn-sm" id="add-feature"><i class="fa fa-plus"></i> Add Feature</button>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <form action="/product-photo/add-photo" method="post" id="form-photo-upload" enctype="multipart/form-data">
      <input type="hidden" name="product_id" value="{{ item.id }}" />
      <input type="hidden" name="photo_name" id="photo-name" />
      <input type="file" name="photo" style="display: none" id="photo-control" />
  </form> 
{% endblock %}

{% block script %}
$(".change-photo").click(function() {
  $("#photo-name").val($(this).parents('.menu').data('photo-name'));
  $("#photo-control").click();
});

$("#photo-control").change(function() {
  $("#form-photo-upload").submit();
});

$(".remove-photo").click(function() {
  if (confirm("Are you sure you want to delete this photo?")) {
      var picname = $(this).parents('.menu').data('photo-name');
      $.get('/productphoto/delete/' + picname, function(d) {
          if (d.status.trim() == 'success') {
              location.reload();
          }
      }, 'JSON');
  }
});

<!--// submit add key feature form-->
<!--$("#form-feature").submit(function(e) {-->
<!--    e.preventDefault();-->
<!--    $(this).find("button").html("<i class='fa fa-cog fa-spin'></i> Adding").prop("disabled", true);-->
<!--    $.post('/product/add)-->
<!--});-->
{% endblock %} 