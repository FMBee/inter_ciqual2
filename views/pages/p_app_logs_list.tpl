 ~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~ 
 ~{config_load file = 'g_app_logs.cfg' section = $smarty.session.__user_lang__}~

<div id="page-wrapper">

	<br />
	<div class="row">
		<div class="col-lg-12">

			<div class="panel panel-yellow">

				<div class="panel-heading">
					~{* <a class="btn btn-default btn-xs"
						href="~{codeUrl('-app_logs_seek')}~"> <i
						class="fa fa-search fa-2x"></i>
					</a>&nbsp; *}~ <span id="table-title" style="font-size: 130%;">
						~{#tabtitle#}~ </span>

					<div class="btn-group pull-right">
						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown">
							<i class="fa fa-bars fa-2x"></i>
						</button>
						<ul class="dropdown-menu slidedown">
							~{*
							<li><a id="dropdown-item1"
								href="~{codeUrl('-app_logs&paramkey=0')}~"> <i
									class="fa fa-plus fa-fw"></i> ~{#btnAdd#}~
							</a></li> *}~
							<li><a id="dropdown-item2" href="#"> <i
									class="fa fa-print fa-fw"></i> ~{#btnPrint#}~
							</a></li>
						</ul>
					</div>
				</div>

				<div class="panel-body">

					<div class="dataTable_wrapper">
						<table id="data-app_logs" width="100%"
							class="table table-striped table-bordered table-hover">

							<thead>
								<tr>
									<th>~{#log_date#}~</th>
									<th>~{#log_id#}~</th>
									<th>~{#lty_name#}~</th>
									<th>~{#log_description#}~</th>
									<th>~{#usr_login#}~</th>
									<th>~{#usr_id#}~</th>
								</tr>
							<tbody>
								~{foreach from=$App_logs item=ligne}~
								<tr id="~{$ligne.log_id}~">
									<td>~{$ligne.log_date|strip}~</td>
									<td>~{$ligne.log_id|strip}~</td>
									<td>~{$ligne.lty_name|strip}~</td>
									<td>~{$ligne.log_description|strip}~</td>
									<td>~{$ligne.usr_login|strip}~</td>
									<td>~{$ligne.usr_id|strip}~</td>
								</tr>
								~{/foreach}~
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- Row End -->
</div>
<!-- page-wrapper End -->
