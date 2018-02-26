 
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~ 
~{config_load file = 'g_users.cfg' section = $smarty.session.__user_lang__}~

<div class="dashboard-wrapper">

	<br />
	<br />
	<div class="row">
		<div class="col-lg-12">

			<div class="panel panel-warning">

				<div class="panel-heading">

					<span id="table-title" style="font-size: 130%;">
						~{#tabtitle#}~ </span>

					<div class="btn-group pull-right">

						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown">
							<i class="fa fa-bars fa-2x"></i>
						</button>
						<ul class="dropdown-menu slidedown">
							<li><a id="dropdown-item1" href="#"> <i
									class="fa fa-square-o fa-fw"></i> ~{#btnAll#}~
							</a></li>
							~{if $smarty.session.__admin_mode__ && (! $smarty.server.__app_params__.__APP_USER_CREATE__)}~
							<li><a id="dropdown-item2"
								href="~{codeUrl('-users&paramkey=0')}~"> <i
									class="fa fa-plus fa-fw"></i> ~{#btnAdd#}~
							</a></li>
							~{/if}~
							<li><a id="dropdown-item3" href="#"> <i
									class="fa fa-print fa-fw"></i> ~{#btnPrint#}~
							</a></li>
						</ul>
					</div>

				</div>

				<div class="panel-body">
					<div class="dataTable_wrapper">
						<table id="data-users" width="100%"
							class="table table-striped table-bordered table-hover">

							<thead>
								<tr>
									<th>~{#libNom#}~</th>
									<th>~{#libPrenom#}~</th>
									<th>~{#libMail#}~</th>
									<!-- 									<th>~{#libLang#}~</th> -->
									<th>~{#libEntree#}~</th>
									<th>~{#libSortie#}~</th>
									<th>Tag</th>
								</tr>
							</thead>

							<tbody>
								~{foreach from=$allUsers item=ligne}~
								<tr id="~{$ligne.usr_id}~">
									<td>~{$ligne.usr_last_name|strip}~</td>
									<td>~{$ligne.usr_first_name|strip}~</td>
									<td>~{$ligne.usr_mail|strip}~</td>
									<!-- 										<td>~{$ligne.usr_lang|strip}~</td> -->
									<td>~{$ligne.usr_in_date|Date_format:"%d/%m/%Y"}~</td>
									<td>~{$ligne.usr_out_date|Date_format:"%d/%m/%Y"}~</td>
									<td>~{$ligne.tag}~</td>
								</tr>
								~{/foreach}~
							</tbody>

						</table>
						<div class="clearfix"></div>

					</div>


				</div>
			</div>
		</div>
	</div>
	<!-- Row End -->
</div>
<!-- page-wrapper End -->
