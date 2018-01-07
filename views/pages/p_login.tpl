
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">

				<div class="login-panel panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">Bienvenue dans
							~{$smarty.const.__APP_TITLE__}~</h3>
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
								<a class="btn btn-success" href="~{codeUrl('index')}~">Réessayer</a>
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

								<button type="submit" class="btn btn-success btn-block">OK</button>
								<br /> ~{if $smarty.server.__app_params__.__APP_USER_CREATE__}~

								<a
									href="~{codeUrl('-recovery&paramsection=email')}~"><u>Mot
										de passe oublié ?</u></a> <br /> <br /> <br /> <span><i>ou</i></span>
								<br />
								<div>
									<a class="btn btn-info" href="~{codeUrl('-inscription')}~">Créez
										un compte</a>
								</div>
								~{/if}~

							</fieldset>

							~{/if}~

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="~{$smarty.const.__WEB_LIB_THEME__}~dist/js/sb-admin-2.js"></script>
 -->
	<!-- </body>

</html> -->