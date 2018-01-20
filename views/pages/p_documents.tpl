
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~

  <div class="dashboard-wrapper">

       <div class="row">
           <div class="col-lg-8 col-md-8">

               <div class="panel panel-default">

                   <div class="panel-heading">
		               <h4 class="text-info">Liste des documents</h4>
                   </div>

                   <div class="panel-body">
						<div class="dataTable_wrapper">
                      
                           <table id="data-documents" width="100%" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th align="center">Titre</th>		
										<th style="text-align:center">Type</th>		
									</tr>
								</thead>
								
								<tbody>
									
									~{foreach $Documents as $document}~
									
										<tr>
											<td align="left" style="font-size:130%">
												<a href="~{$document.path|strip}~" target="blank">~{$document.nom|strip}~</a>
											</td>
											<td align="center">~{$document.type|strip}~</td>
										</tr>
										
									~{/foreach}~
									
								</tbody>
							</table>
							
					    </div>
	                    
~{*	                    </br>
						<button id="adddocument" type="button" class="btn btn-warning">
						~{#btnNew#}~
						</button>
*}~					</div>
				</div>
			</div>
		</div>

~{*		<div class="row">
			<div class="col-lg-6">
				<button id="delrecipy" type="button" class="btn pull-right">
				~{#btnDel#}~
				</button>
			</div>
		</div>
*}~
  </div>
  <!-- page-wrapper End -->

  