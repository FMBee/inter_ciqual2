
	<div class="dashboard-container">
		
	  <div class="container">
	
		<div class="row">
			<div class="col-md-4 col-md-offset-4">

				<div class="login-panel panel panel-default">

					<div class="panel-heading">
						<h2 class="panel-title">Bienvenue dans
							~{$smarty.const.__APP_TITLE__}~</h2>
					</div>

					<div class="panel-body">

						<form action="~{codeUrl('login-')}~" class="login-wrapper"
							method="post">

							~{if $smarty.server.__app_params__['__APP_MAINTAIN__']}~

							<div class="content">
								<p>
									Le site est actuellement en maintenance<br />
									<br /> Merci de votre compréhension<br />
									<br />
								</p>
							</div>
							<div class="actions">
								<a class="btn my_button" href="~{codeUrl('index')}~">Réessayer</a>
								<div class="clearfix"></div>
							</div>

							~{else}~

							<fieldset>

								<span><i>Veuillez vous identifier</i></span>
                                <br />
                                <br />
								<div class="form-group">
									<input class="form-control" placeholder="Identifiant"
										name="login" type="login" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Mot de passe"
										name="password" type="password" value="">
								</div>
								<!--                                 <div class="checkbox"> -->
								<!--                                     <label> -->
								<!--                                         <input name="remember" type="checkbox" value="Remember Me">M&eacute;moriser -->
								<!--                                     </label> -->
								<!--                                 </div> -->

								<button type="submit" class="btn my_button btn-block">OK</button>
								<br /> ~{if $smarty.server.__app_params__.__APP_USER_CREATE__}~

								<a href="~{codeUrl('-recovery&paramsection=email')}~">
								  <u>Mot de passe oublié ?</u>
								</a> 
								<br /> <br /> <br /> 
								<span><i>ou</i></span>
								<br />
								<div>
									<a class="btn my_button" href="~{codeUrl('-inscription')}~">Créez un compte</a>
								</div>
								~{/if}~

							</fieldset>

							~{/if}~

						</form>
					</div>
				</div>
			</div>
		</div>
