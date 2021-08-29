<div class="modal inmodal fade in" id="merchantModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Merchant</h4>
			</div>

			<form action="/merchant/add-new" method="post" id="form-merchant">
				<div class="modal-body">
          <div class="form-group">
            <div class="row">
                <div class="col-md-12">
                  <label>Merchant's Name</label>
                  <input type="text" name="name" class="form-control" id="Merchant's name" />
                </div>
            </div>
          </div>
          <div class="form-group">
            <div class="row">
                <div class="col-md-12">
                  <label>Address</label>
                  <textarea name="address" class="form-control"></textarea>
                </div>
            </div>
          </div>
			<div class="form-group">
              <div class="row">
                  <div class="col-md-6">
                      <label>Email</label>
                      <input type="email" class="form-control" name="email" placeholder="Email" />
                  </div>
                  <div class="col-md-6">
                      <label>Phone</label>
                      <input type="text" class="form-control" name="phone" placeholder="Phone Number" />
                  </div>
              </div>
          </div>
         
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