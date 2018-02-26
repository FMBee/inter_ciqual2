	
	<div class="dashboard-container">

	  <div class="container">
	  
		<div class="row">
			<div class="col-md-4 col-md-offset-4">

				<div class="login-panel panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">Inscription</h3>
					</div>

					<div class="panel-body">

						<form action="~{codeUrl('validation-login')}~"
							class="login-wrapper" method="post" id="finscription">

							<fieldset>
								<span><i>Veuillez saisir vos identifiants</i></span> 
								<br />
								<br />
								<div class="form-group">
									<input class="form-control" placeholder="Votre email"
										id="email" name="email" type="email" autofocus required>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Votre mot de passe"
										id="password" name="password" type="password" value=""
										required>
								</div>
								<div class="form-group">
									<input class="form-control"
										placeholder="Confirmez votre mot de passe" id="password2"
										name="password2" type="password" value="" required>
								</div>
								<button type="submit" class="btn my_button btn-block">OK</button>
								<br />
							</fieldset>

						</form>
					</div>
				</div>
			</div>
		</div>
	  </div>
	</div>
	

	<script
		src="~{$smarty.const.__WEB_LIB_BOWER__}~bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="~{$smarty.const.__WEB_LIB_THEME__}~dist/js/sb-admin-2.js"></script>

