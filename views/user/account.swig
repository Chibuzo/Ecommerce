{% extends '../theme.swig' %}
{% set title = 'Customer Sign In' %}
{% block category %}
    <div class="departments" data-departments-fixed-by="">
{% endblock %}
{% block body %}
<div class="page-header">
    <div class="page-header__container container">
        <div class="page-header__breadcrumb">   
            
        </div>
        <div class="page-header__title">
            <h1>Customer Login</h1>
        </div>
    </div>
</div>
<div class="block">
    <div class="container">
        <div class="row">
            <div class="col-md-6 d-flex">
                <div class="card flex-grow-1 mb-md-0">
                    <div class="card-body">
                        <h3 class="card-title">Login</h3>
                        <form method="post" action="/user/login" id="login-form">
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
            <div class="col-md-6 d-flex mt-4 mt-md-0">
                <div class="card flex-grow-1 mb-0">
                    <div class="card-body">
                        <h3 class="card-title">Register</h3>
                        <form method="post" action="user/register" id="signup-form">
                            <div class="form-row">
                                <div class="form-group col-md-6"><label for="checkout-first-name">First
                                        Name</label> <input type="text" class="form-control" name="fname"
                                        id="checkout-first-name" placeholder="First Name"></div>
                                <div class="form-group col-md-6"><label for="checkout-last-name">Last
                                        Name</label> <input type="text" class="form-control" name="lname"
                                        id="checkout-last-name" placeholder="Last Name"></div>
                            </div>
                            <div class="form-group"><label>Email address</label> <input type="email"
                                    class="form-control" placeholder="Enter email" name="email"></div>
                            <div class="form-row">
                                <div class="form-group col-md-6"><label for="checkout-email">Password
                                        </label> <input type="password" class="form-control" name="password"
                                        id="password" placeholder="Enter Password"></div>
                                <div class="form-group col-md-6"><label for="checkout-phone">Confirm Password</label>
                                    <input type="password" class="form-control" id="verify-password" name="verify_password"
                                        placeholder="Confirm Password">
                                </div>
                            </div>
                            
                            <button type="submit" class="btn btn-primary mt-4">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  
{% endblock %}

{% block scriptTag %}
<script>
	$("#login-form").submit(function(e) {
		e.preventDefault();
		const $this = $(this);

		$(this).find('button').html("<i class='fa fa-cog fa-spin'></i> Processing").prop('disabled', true);
    
        login($this, $this.serialize());
	});

    $("#signup-form").submit(function(e) {
		e.preventDefault();
		const $this = $(this);

		$(this).find('button').html("<i class='fa fa-cog fa-spin'></i> Processing").prop('disabled', true);
    
        $.post('/user/register', $(this).serialize(), function(d) {
            if (d.status.trim() == 'success') {
                login($this, $this.serialize());
            } else {
                $this.find(".alert-danger").html("<strong>Error:</strong> " + d.message).removeClass('d-none');
            }
            $this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; Login").prop('disabled', false);
        }, 'JSON');
	});

function login($this, formData) {
    $.post('/user/login', formData, function(d) {
        if (d.status.trim() == 'success') {
            location.replace('/user/dashboard');
        } else {
            $this.find(".alert-danger").html("<strong>Error:</strong> " + d.msg).removeClass('d-none');
        }
        $this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; Login").prop('disabled', false);
    }, 'JSON');
}    
</script>
{% endblock %}
