{% extends '../theme.swig' %}
{% set title = 'Admin Login' %}
{% block category %}
    <div class="departments" data-departments-fixed-by="">
{% endblock %}
{% block body %}
<div class="page-header">
    <div class="page-header__container container">
        <div class="page-header__breadcrumb">   
            
        </div>
        <div class="page-header__title">
            <h1>Admin Login</h1>
        </div>
    </div>
</div>
<div class="block">
	<section class="container" style="margin-top: 20px">
		<div class="row content-justify-center">
			<div class="col-md-6 d-flex">
                <div class="card flex-grow-1 mb-md-0">
                    <div class="card-body">
                        <form method="post" action="/user/login" id="signin">
                            <div class="form-group"><label>Email address</label> <input type="email"
                                    class="form-control" placeholder="Enter email" name="email"></div>
                            <div class="form-group"><label>Password</label> <input type="password"
                                    class="form-control" placeholder="Password" name="password"> <small
                                    class="form-text text-muted"><a href="#">Forgotten Password</a></small>
                            </div>
                            <div class="form-group">
                                <div class="form-check"><span class="form-check-input input-check"><span
                                            class="input-check__body"><input class="input-check__input"
                                                type="checkbox" id="login-remember"> <span
                                                class="input-check__box"></span> <svg
                                                class="input-check__icon" width="9px" height="7px">
                                                <use xlink:href="images/sprite.svg#check-9x7"></use>
                                            </svg> </span></span><label class="form-check-label"
                                        for="login-remember">Remember Me</label></div>
                            </div>
                            <div class="alert alert-danger d-none"></div>
                            <button type="submit" class="btn btn-primary mt-4">Login</button>
                        </form>
                    </div>
                </div>
            </div>
       
		</div>
	</section>
</div>    
{% endblock %}

{% block scriptTag %}
<script>
$(document).ready(function() {
	$("#signin").submit(function(e) {
		e.preventDefault();
		var $this = $(this);

		$(this).find('button').html("<i class='fa fa-cog fa-spin'></i> Processing").prop('disabled', true);

		$.post('/admin/login', $(this).serialize(), function(d) {
			if (d.status.trim() == 'Ok') {
					location.replace('/admin/dashboard');
			} else {
				$(".alert-danger").html("<strong>Error:</strong> " + d.msg).removeClass('hidden');
			}
			$this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; SIGN IN").prop('disabled', false);
		}, 'JSON');
	});
});
</script>
{% endblock %}
