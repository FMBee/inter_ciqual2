 ~{config_load file = 'g_global.cfg' section =
$smarty.session.__user_lang__}~ ~{config_load file = 'g_buttons.cfg'
section = $smarty.session.__user_lang__}~

<div id="page-wrapper">
	<br />
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">~{#libParam1#}~</div>
				<div class="panel-body">
					<div class="row">
						<form role="form" action="~{codeUrl('app_parameters-')}~"
							method="post" enctype="multipart/form-data" id="fparameters">
							<div class="col-lg-12">
								~{foreach from=$parameters item=parameter}~
								<div class="form-group">
									<label>~{$parameter.prt_name}~</label> <input
										name="param_~{$parameter.prt_id}~"
										id="param_~{$parameter.prt_id}~" class="form-control"
										value="~{$parameter.prt_value}~" required>
								</div>
								~{/foreach}~

								<button type="submit" class="btn my_button">~{#btnSubmit#}~</button>

								<a class="btn btn-default" href="~{codeUrl('index')}~">~{#btnCancel#}~</a>

							</div>
						</form>
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>

