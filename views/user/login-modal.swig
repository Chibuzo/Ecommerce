<div class="modal fade in" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">Login</h4>
			</div>

			<form action="/user/signin" method="post" id="login-form">
				<div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                            <label>Email Address</label>
                                <input type="email" name="email" class="form-control input-lg" required />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control input-lg" required />
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
                        <i class="fa fa-login"></i> &nbsp;
						Login
					</button>
				</div>
			</form>
		</div>
	</div>
</div>