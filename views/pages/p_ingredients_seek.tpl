~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~ 
~{config_load file = 'g_ingredients.cfg' section = $smarty.session.__user_lang__}~

<div id="page-wrapper">

	<br />
	<div class="row">
		<div class="col-lg-12">

			<div class="panel panel-primary">

				<div class="panel-heading">

					<span> <a class="btn btn-default btn-xs"
						href="~{codeUrl(precPage())}~"> <i
							class="fa fa-chevron-left fa-2x"></i>
					</a>&nbsp;
					</span> <span style="font-size: 130%;"> ~{#seektitle#}~ </span>

				</div>

				<div class="panel-body">

					<form role="form" method="post" id="fciqual-seek">

						<div class="form-inline">
							<div class="col-sm-10">

								<div class="form-group">
									<span>~{#ing_label#}~&nbsp;&nbsp;</span>
									<input type="radio" id="ingredient" name="seek_mode" data-switch-no-init value="ing" checked>
								</div>
								&nbsp;&nbsp;
								<div class="form-group">
									<input type="radio" id="categorie" name="seek_mode" data-switch-no-init value="cat" >
									<span>&nbsp;&nbsp;~{#cat_label#}~</span>
								</div>
							</div>
							<div class="col-sm-2">
								<button class="pull-right btn" id="seek-list" type="button">
									~{#btnList#}~</button>
							</div>
						</div>

						<div class="form-group">
							<br />
							<br />
							<br /> <input name="seek-introvalue" id="seek-introvalue"
								class="form-control" placeholder="Tapez votre recherche"
								value="" autofocus>
						</div>

						<button id="seek-submit" type="button" class="btn">
							~{#btnSheet#}~</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Row End -->
</div>
<!-- page-wrapper End -->
