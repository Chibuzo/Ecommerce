<div class="modal inmodal fade in" id="inventoryModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Inventory</h4>
			</div>

			<form action="/product/add-new" method="post" id="form-inventory">
				<div class="modal-body">
          <div class="form-group">
            <div class="row">
                <div class="col-md-12">
                  <label>Item Name/Title</label>
                  <input type="text" name="product_name" class="form-control" id="title" />
                </div>
            </div>
          </div>
          <div class="form-group">
            <div class="row">
                <div class="col-md-12">
                  <label>Item Description</label>
                  <textarea name="description" class="form-control"></textarea>
                </div>
            </div>
          </div>
           <div class="form-group">
            <div class="row">
                <div class="col-md-12">
                    <select name="merchant" class="form-control merchant" id="merchant" required>
                        <option value="">-- Select Merchant --</option>
                        {% for merchant in merchants %}
                            <option value="{{ merchant.id }}">{{ merchant.name }}</option>
                        {% endfor %}  
                    </select>
                </div>
            </div>
          </div>  
          <div class="form-group">
            <div class="row">
                <div class="col-md-6">
                    <label>Category</label>
                    <select name="category_id" class="form-control category" id="category">
                      <option value="">-- Select Category --</option>
                      {% for cat in categories %}
                        <option value="{{ cat.id }}">{{ cat.category_name }}</option>
                      {% endfor %}  
                    </select>
                </div>
                <div class="col-md-6">
                    <label>Sub Category</label>
                    <select name="sub_category_id" class="form-control sub-category" id="sub-category">
                      <option value=""> -- </option> 
                    </select>
                </div>
            </div>
          </div>
					<div class="form-group">
              <div class="row">
                  <div class="col-md-6">
                      <label>Stock</label>
                      <input type="text" class="form-control" name="stock" placeholder="Available quantity" />
                  </div>
                  <div class="col-md-6">
                      <label>Price</label>
                      <input type="text" class="form-control" name="price" placeholder="Selling Price" />
                  </div>
              </div>
          </div>
          <!--<div class="form-group">
              <div class="row">
                  <div class="col-md-6">
                      <label>Cost</label>
                      <input type="text" class="form-control" name="cost" placeholder="Cost of Purchase" />
                  </div>
                  <div class="col-md-6">
                      <label>Color</label>
                      <input type="text" class="form-control" name="color" placeholder="Item color" />
                  </div>
              </div>
          </div>-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default close-modal" data-dismiss="modal">
            <i class="fa fa-times"></i>
						Cancel
					</button>
					<button type="submit" class="btn btn-primary">
            <i class="fa fa-save"></i> &nbsp;
						Save
					</button>
				</div>
			</form>
		</div>
	</div>
</div>