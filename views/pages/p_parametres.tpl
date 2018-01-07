 ~{config_load file = 'g_buttons.cfg' section =
$smarty.session.__user_lang__}~ ~{config_load file = 'g_parametres.cfg'
section = $smarty.session.__user_lang__}~

<div id="page-wrapper">

	<br />
	<div class="row">
		<div class="col-lg-12">

			<div class="panel panel-green">

				<div class="panel-heading">

					<a class="btn btn-default btn-xs" href="~{codeUrl('')}~"> <i
						class="fa fa-chevron-left fa-2x"></i>
					</a>&nbsp; <span style="font-size: 130%;"> ~{if $_param.key eq
						'0'}~ ~{#libnouveau#}~ ~{else}~ ~{#title#}~ ~{/if}~ </span>

					<div class="btn-group pull-right">
						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown">
							<i class="fa fa-bars fa-2x"></i>
						</button>
						<ul class="dropdown-menu slidedown">
							<li class="hidden"><a id="dropdown-item1"
								href="~{codeUrl('-parametres&paramkey=0')}~"> <i
									class="fa fa-plus fa-fw"></i> ~{#btnAdd#}~
							</a></li>
							<li class="hidden"><a id="dropdown-item2" href="#"> <i
									class="fa fa-times fa-fw"></i> ~{#btnDelete#}~
							</a></li>
							<li><a id="dropdown-item3" href="#"> <i
									class="fa fa-print fa-fw"></i> ~{#btnPrint#}~
							</a></li>
						</ul>
					</div>


				</div>

				<div class="panel-body">

					~{if isset($Parametres.par_flag) && $Parametres.par_flag|strip eq
					'D'}~

					<div class="form-group">
						<span class="form-control">~{#libSuppr#}~</span>
					</div>

					~{else}~

					<!-- Nav tabs -->
					<ul class="nav nav-tabs">

						<li ~{if empty($_param.tab) || $_param.tab eq '01'}~class="active"~{/if}~>
							<a href="#tab01" data-toggle="tab"><h4>~{#tab01#}~</h4></a>
						</li>

						<!-- un seul onglet en création -->
						~{if $_param.key neq '0'}~
						<li ~{if !empty($_param.tab) && $_param.tab
							eq '02'}~class="active"~{/if}~><a href='#tab02'
							data-toggle='tab'><h4>~{#tab02#}~</h4></a></li>
						<li ~{if !empty($_param.tab) && $_param.tab
							eq '03'}~class="active"~{/if}~><a href='#tab03'
							data-toggle='tab'><h4>~{#tab03#}~</h4></a></li> ~{/if}~
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">

						<div
							class="tab-pane fade ~{if empty($_param.tab) || $_param.tab eq '01'}~in active~{/if}~"
							id="tab01">~{include file = 'p_parametres_tab01.inc.tpl'}~

						</div>

						~{if $_param.key neq '0'}~
						<div
							class="tab-pane fade ~{if !empty($_param.tab) && $_param.tab eq '02'}~in active~{/if}~"
							id='tab02'>~{include file = 'p_parametres_tab02.inc.tpl'}~
						</div>
~{*						<div
							class="tab-pane fade ~{if !empty($_param.tab) && $_param.tab eq '03'}~in active~{/if}~"
							id='tab03'>~{include file = 'p_parametres_tab03.inc.tpl'}~
						</div>
*}~						~{/if}~
					</div>

					~{/if}~
				</div>

			</div>
		</div>
	</div>
</div>