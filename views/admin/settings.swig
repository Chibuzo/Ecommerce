{% extends 'admin-layout.swig' %}
{% set title = 'Admin Settings' %}
{% block body %}

<style>
	.account-details .row .col-md-6 {
		padding: 7px 15px;
	}
  
  .account-details {
    border: #ccc solid thin;
    margin: 10px;
    padding: 10px 15px;
    overflow: auto;
  }
</style>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-4">
			<h2>Dashboard</h2>
			<ol class="breadcrumb">
				<li>
					<a href="index.html">Admin</a>
				</li>
				<li class="active">
					<strong>Settings</strong>
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
							<h5>Manage Category</h5>
							<div class="ibox-tools">
							</div>
						</div>
						<div class="ibox-content">
              <div class="row">
                <div class="col-md-12">
                  <form action="/category/add-new" method="post" id="form-category">
                      <div class="row">
                        <div class="col-md-10">
                          <div class="form-group"><input type="text" name="category" class="form-control" placeholder="Category..." /></div>
                        </div>
                        <div class="col-md-2">
                          <button type="submit" class="btn btn-info btn-block"><i class="fa fa-plus"></i> Add</button>
                        </div>
                      </div>
                  </form>
                </div>
              </div>
							<div class="row">
								<div class="col-md-12" id="">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Category</th>
                                <th style="width: 80px" class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {% for cat in categories %}
                                <tr id='{{ cat.id }}'>
                                    <td>{{ cat.category_name }}</td>
                                    <td class='opt-icons'>
                                        <a href='' class='edit-category' data-toggle='tooltip' title='Edit Category'><i class='fa fa-pencil'></i></a>
                                        <a href='' class='delete-category' data-toggle='tooltip' title='Remove Category'><i class='fa fa-trash'></i></a>
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

				<div class="col-md-6">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Sub Category</h5>
						</div>
						<div class="ibox-content">
                <div class="row">
                  <div class="col-md-12">
                    <form action="/sub-category/add-new" method="post" id="form-category">
                        <div class="row">
                          <div class="col-md-5">
                            <div class="form-group"><input type="text" name="sub_category" class="form-control" placeholder="Sub Category..." /></div>
                          </div>
                          <div class="col-md-5">
                            <div class="form-group">
                              <select name="category_id" class="form-control">
                                <option value="">-- Select Category --</option>
                                {% for cat in categories %}
                                  <option value="{{ cat.id }}">{{ cat.category_name }}</option>
                                {% endfor %}  
                              </select>
                            </div>
                          </div>
                          <div class="col-md-2">
                            <button type="submit" class="btn btn-info btn-block"><i class="fa fa-plus"></i> Add</button>
                          </div>
                        </div>
                    </form>
                  </div>
                </div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Sub Category</th>
                            <th>Category</th>
                            <th style="width: 80px" class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for sub in sub_categories %}
                            <tr id='{{ sub.id }}'>
                                <td>{{ sub.sub_category_name }}</td>
                                <td>{{ sub.category.category_name }}</td>
                                <td class="opt-icons">
                                    <a href='' class='edit-sub-category' data-toggle='tooltip' title='Edit Sub Category'><i class='fa fa-pencil'></i></a>
                                    <a href='' class='delete-sub-category' data-toggle='tooltip' title='Remove Sub Category'><i class='fa fa-trash'></i></a>
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
  
  <div class="wrapper wrapper-content">
		<div class="animated fadeInRight">
			<div class="row">
				<div class="col-md-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Manage Bank Account</h5>
							<div class="ibox-tools">
							</div>
						</div>
						<div class="ibox-content">
              <form action="/account/add-account" method="post" id="account">
                <div class="row">
                  <div class="col-md-4">
                    <select id="bank" name="bank" class="form-control" required>
												<option value="">-- Select BAnk --</option>
												<option value="Access Bank Nigeria Plc">Access Bank Nigeria Plc</option>
												<option value="ACCION Microfinance bank">ACCION Microfinance bank</option>
												<option value="Aso Savings">Aso Savings</option>
												<option value="Diamond Bank Plc">Diamond Bank Plc</option>
												<option value="Ecobank Nigeria">Ecobank Nigeria</option>
												<option value="Ekondo MFB">Ekondo MFB</option>
												<option value="Enterprise Bank Plc">Enterprise Bank Plc</option>
												<option value="Fidelity Bank Plc">Fidelity Bank Plc</option>
												<option value="First Bank of Nigeria Plc">First Bank of Nigeria Plc</option>
												<option value="First City Monument Bank">First City Monument Bank</option>
												<option value="Guaranty Trust Bank Plc">Guaranty Trust Bank Plc</option>
												<option value="Heritage Bank">Heritage Bank</option>
												<option value="Jaiz Bank PLC">Jaiz Bank PLC</option>
												<option value="Keystone Bank Ltd">Keystone Bank Ltd</option>
												<option value="Mainstreet Bank Plc">Mainstreet Bank Plc</option>
												<option value="Skye Bank Plc">Skye Bank Plc</option>
												<option value="Stanbic IBTC Plc">Stanbic IBTC Plc</option>
												<option value="Sterling Bank Plc">Sterling Bank Plc</option>
												<option value="Union Bank Nigeria Plc">Union Bank Nigeria Plc</option>
												<option value="United Bank for Africa Plc">United Bank for Africa Plc</option>
												<option value="Unity Bank Plc">Unity Bank Plc</option>
												<option value="WEMA Bank Plc">WEMA Bank Plc</option>
												<option value="Zenith Bank International">Zenith Bank International</option>
											</select>
                  </div>
                  <div class="col-md-3">
                    <div class="form-group">
											<input type="text" name="account_name" id="account-name" class="form-control" placeholder="Account Name" required />
										</div>
                  </div>
                  <div class="col-md-3">
                    <div class="form-group">
											<input type="text" name="account_number" id="account-number" class="form-control" placeholder="Account Number" required />
										</div>
                  </div>
                  <div class="col-md-2">
                    <input type="submit" class="btn btn-primary" value=" Save Account" />
                  </div>
                </div>
              </form>
              
              <div class="row">
                {% for acc in accounts %}
                  <div class="col-md-4">
                    <div class="account-details">
                      <div class="row">
                        <div class="col-md-6">Bank:</div>
                        <div class="col-md-6" id="ph-bank">{{ acc.bank }}</div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">Account Name:</div>
                        <div class="col-md-6" id="ph-account-name">{{ acc.account_name }}</div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">Account Number:</div>
                        <div class="col-md-6" id="ph-account-number">{{ acc.account_number }}</div>
                      </div><br>
                      <button class="btn btn-danger btn-sm pull-right"><i class="fa fa-trash-o"></i>&nbsp; Delete</button>
                    </div>
                  </div>
                 {% endfor %} 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
{% endblock %}

{% block script %}
$("#form-account").submit(function(e) {
	e.preventDefault();

	$.post('/admin/add-account', $(this).serialize(), function(d) {
		if (d.status.trim() == 'success') {
			location.replace('/admin/settings');
		}
	}, 'JSON');
});

$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});
{% endblock %}