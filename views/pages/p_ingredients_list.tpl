~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_ingredients.cfg' section = $smarty.session.__user_lang__}~

  	<div id="page-wrapper">

	   <br/>
       <div class="row">
           <div class="col-lg-12">
           
               <div class="panel panel-yellow">
               
                   <div class="panel-heading">

					  <a class="btn btn-default btn-xs" href="~{codeUrl('-ingredients_seek')}~">
					  <i class="fa fa-search fa-2x"></i>
					  </a>&nbsp;
                  
					  <span id="table-title" style="font-size:130%;">
					    ~{#tabtitle#}~
					  </span>
		               
	                   <div class="btn-group pull-right">
	                      <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
	                          <i class="fa fa-bars fa-2x"></i>
	                      </button>
	                      <ul class="dropdown-menu slidedown">
~{*	                          <li>
	                              <a 	id="dropdown-item1" 
	                              		href="~{codeUrl('-ingredients&paramkey=0')}~">
	                                  <i class="fa fa-plus fa-fw"></i> ~{#btnAdd#}~
	                              </a>
	                          </li>
*}~	                          <li>
	                              <a id="dropdown-item2" href="#">
	                                  <i class="fa fa-print fa-fw"></i> ~{#btnPrint#}~
	                              </a>
	                          </li>
	                      </ul>
	                  </div>
                   </div>
                   
                   <div class="panel-body">
                   
                       <div class="dataTable_wrapper">
                           <table id="data-ingredients" width="100%" class="table table-striped table-bordered table-hover" >

							<thead>
								<tr>
<th>~{#ing_code#}~</th>
<!-- <th>~{#ing_cat_code#}~</th> -->
<th>~{#ing_name#}~</th>
<th>~{#cat_name#}~</th>
<th>~{#cat_code#}~</th>
								</tr>
							<tbody>
								~{foreach from=$Ingredients item=ligne}~
									<tr id="~{$ligne.ing_code}~">
<td>~{$ligne.ing_code|strip}~</td>
<!-- <td>~{$ligne.ing_cat_code|strip}~</td> -->
<td>~{$ligne.ing_name|strip}~</td>
<td>~{$ligne.cat_name|strip}~</td>
<td>~{$ligne.cat_code|strip}~</td>
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