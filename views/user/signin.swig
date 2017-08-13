{% extends '../theme.swig' %}
{% set title = 'Member Sign In' %}
{% block body %}
	<section class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 auth-panel">
				<h3 class="text-center">Sign in to Continue</h3><br>
				<form action="" method="post" class="form-vertical" id="signin">
					<div class="form-group">
						<label>Email Address</label>
						<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Enter your email..." required />
					</div>
          <input type="hidden" id="opt" value="find-email" />
					<div class="form-group hidden" id="password-div">
						<label>PASSWORD</label>
						<input type="password" name="l_password" class="form-control input-lg" />
					</div>
          <div id="signup-div" class="hidden">
            <div class="form-group">
                <label for="fullname">Fullname</label>
                <input type="text" name="fullname" id="fullname" class="form-control input-lg" />
            </div>
            <div class="form-group">
                <label for="email">Phone</label>
                <input type="phone" name="phone" id="email" class="form-control input-lg" />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control input-lg" />
            </div>

            <div class="form-group">
                <label for="verify_password">Verify Password</label>
                <input type="password" name="verify_password" id="verify_password" class="form-control input-lg" />
            </div>
          </div>
          <input type="hidden" id="page" value="{{ page }}" />
					<div class="alert alert-danger hidden"></div>
          <div class="alert alert-success hidden" id="confirm">Account successfully created</div>
					<button type="submit" class="btn btn-default input-lg btn-block"><i class="fa fa-sign-in fa-lg"></i>&nbsp; SIGN IN </button>
				</form>
			</div>
		</div>
	</section>
{% endblock %}

{% block script %}
	{#<script>#}
	$("#signin").submit(function(e) {
		e.preventDefault();
		var $this = $(this);

		$(this).find('button').html("<i class='fa fa-cog fa-spin'></i> Processing").prop('disabled', true);
    
    if ($("#opt").val() == 'find-email') {
        $.post('/user/findaccount', { 'email': $("#email").val() }, function(d) {
            $("#email").prop("readonly", true);
            if (d.status.trim() == 'Found') {
                $("#opt").val("signin");
                $("#password-div").removeClass("hidden");
            } else {
                $("#opt").val("signup");            
                $("#signup-div").removeClass("hidden");
            }
            $this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; Proceed").prop('disabled', false);            
        }, 'JSON');
    }
    else if ($("#opt").val() == 'signin')
    {
        $.post('/user/signin', $(this).serialize(), function(d) {
          if (d.status.trim() == 'Ok') {
            var page = $('#page').val();
            if (page.length > 0) {
              location.replace(page);
            } else if (d.user_type == 'user') {
              location.replace('/user/dashboard');
            } else if (d.user_type == 'admin') {
              location.replace('/admin/dashboard');
            }
          } else {
            $(".alert-danger").html("<strong>Error:</strong> " + d.msg).removeClass('hidden');
          }
          $this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; SIGN IN").prop('disabled', false);
        }, 'JSON');
    }
    else if ($("#opt").val() == 'signup')
    {
        if ($("#password").val() !== $("#verify_password").val()) {
            $(".alert-danger").html("<strong>Error:</strong> Password doesn't match.").removeClass('hidden');
            $this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; Proceed").prop('disabled', false);
            return false;
        }
        $.post('/user/signup', $(this).serialize(), function(d) {
          if(d.status.trim() == '01') {
            $(".alert-danger").addClass('hidden');
            $('#confirm').removeClass('hidden');
            $("#signup-div").slideUp(function() {
                $(this).addClass("hidden");
                $("#password-div").removeClass("hidden");
                $this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; Proceed").prop('disabled', false);
            });
            $("#opt").val('signin');
          } else {
            $(".alert-danger").html("<strong>Error:</strong> " + d.msg).removeClass('hidden');
          }
            $this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; Proceed").prop('disabled', false);
        }, 'JSON');
    }
	});
	{#</script>#}
{% endblock %}
