{% extends '../theme.swig' %}
{% set title = 'Dashboard' %}
{% block body %}
<style>
.inner-div {
	border: #ccc solid thin;
	margin-right: 15px;
	border-radius: 3px;
	margin-left: 20px;
	padding: 0;
}

.inner-div h4 {
	background-color: #f0f0f0;
	padding: 7px 7px;
	color: #666 !important;
	margin:4px;
	font-size: 16px;
	font-weight: bold;
}

#edit-form {
	padding: 4px 10px;
}

#add-form {
	margin-top: 30px;
}

.not-show, #edit-form {
	display: none;
}

#name {
    font-weight: bold;
}

.user-div #user-details, .user-div p, #menu {
	padding: 8px;
}

address {
	padding: 0 1px;
}
</style>

<div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="inner-div">
          <h4>User Information</h4>
          <div id="user-details">
						<span id='fullname'>{{ user.fullname }}</span><br />
						<address>{{ user.contacts[0].address }}</address>
						<p id='phone'>{{ user.contacts[0].phone }}</p>
					</div>

					<div id='edit-form'>
						<form action="" method="post" id='form-edit'>
							<div class="form-group">
								<div class="row">
									<div class="col-md-12">
										<label for="fullname">Fullname</label>
										<input type='text' class="form-control" name='fullname' placeholder='Enter your fullname' />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="username">Delivery address</label>
								<textarea class="form-control" name='address' placeholder='Enter delivery address'></textarea>
							</div>

							<div class="form-group">
								<label for="username">Phone number</label>
								<input type='text' class="form-control" name='phone' placeholder='Enter your phone number' />
							</div>
							<input type="hidden" name="user_id" value="{{ user.id }}" />
              <input type="hidden" name="contact_id" value="{{ user.contacts[0].id }}" />
							<input type="submit" class="btn btn-warning" value="Save details" />
							<button class="btn btn-default" id="cancel">Cancel</button>
						</form>
					</div>

					<div id='menu'>
						<a href='' id='edit'>Edit</a> &nbsp;|&nbsp;
						<a href='' class='delete'>Delete</a>
					</div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="inner-div">
          <h4>Content</h4>
        </div>
      </div>
    </div>
</div>

{% endblock %}

{% block script %}
$('#edit').click(function(e) {
    e.preventDefault();

    $('#user-details').slideUp(function() {
        $('#edit-form').slideDown(function() {
            $("[name='fullname']").val($('#fullname').text());
            $("[name='address']").val($('address').text());
            $("[name='phone']").val($('#phone').text());
        });
    });
    $('#menu').fadeOut();
});


// submit and save delivery details
$('#form-edit').submit(function(e) {
    e.preventDefault();

    $.post('/user/update-details', $(this).serialize(), function(d) {
        if (d.status.trim() == 'success') {
            $('#edit-form').fadeOut("fast");
            $('#fullname').text($("[name='fullname']").val());
            $('address').text($("[name='address']").val());
            $('#phone').text($("[name='phone']").val());
            $('#user-details').slideDown();
            $('#menu').fadeIn();
        }
    }, 'JSON');
});


    // Cancel editing
    $("#cancel").click(function(e) {
        e.preventDefault();

        $('#edit-form').slideUp(function() {
            $('#user-details').slideDown();
            $('#menu').fadeIn();
        });
    });

{%  endblock %}
