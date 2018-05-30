<?php

$tags_arr['mod_view'] = <<<HTML
<div class="container">
	<section class="section section--login">
		<div class="form">
			<h2>Login</h2>
			<form id="loginform" action="https://rtbslive.com/rtbs5/index.php" method="post">
				<p class="mand">Fields marked with a <span class="star">*</span> are required.</p>
				<p class="field">
                    <label for="user_id">User ID</label> <span class="star">*</span>
                    <br>
                    <input type="text" class="input " name="user_id" id="user_id" value="">
				</p>
				<p class="field">
                    <label for="user_password">Password</label> <span class="star">*</span>
                    <br>
                    <input type="password" class="input " name="user_password" id="user_password" value="">
				</p>
				<p class="submit"><input class="btn btn__green text-white" type="submit" name="action" value="logon"></p>
            </form>
		</div>
	</section>
</div>
HTML;
