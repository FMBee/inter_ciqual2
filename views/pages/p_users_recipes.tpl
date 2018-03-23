
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users_recipes.cfg' section = $smarty.session.__user_lang__}~

  <div class="dashboard-wrapper">

	  ~{include file = 'p_users_recipes_modals.inc.tpl'}~
  
       <div class="row">

		<form role="form" 	
			action="~{codeUrl('users_recipes-users_recipes')}~" 
			method="post" id="selectrecipy-form">
			
		   <input name="parammode" value="chg_rec" hidden />
		   <input name="paramkey" id="chg_recparamkey" value="" hidden />
		   
           <div class="col-lg-8 col-md-6 col-sm-6">
       
	             <div class="form-inline">
<!-- 	                <span style="font-size:130%;">~{#title#}~ <i class="fa fa-caret-right"></i></span> -->
<!-- 				    <input name="seek-recipy" id="seek-recipy" -->
<!-- 					class="form-control" placeholder="Tapez votre recherche" -->
<!-- 					value="" > -->
  				    <select name="select-recipy" id="select-recipy" class="selectpicker form-control" 
  				    		data-width="80%" data-style="my_button" data-live-search="true" required>
  				    
				    	~{foreach $Recettes as $item}~
					  		<option value="~{$item.rec_id}~"
						  		~{if $smarty.session._recipy['rec_id'] eq $item.rec_id}~ selected~{/if}~>
						  		~{$item.rec_title}~
					  		</option>
					 	~{/foreach}~
				    </select> 
				    
				    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span><i id="btn-details" class="fa fa-table fa-2x fa-border"></i>     
	             </div>
           </div>
        </form>
        
           <div class="col-lg-4 col-md-6 col-sm-6">
	             <button id="changename" type="button" class="btn pull-right">
				~{#btnName#}~
				</button>
           </div>
       </div>
       <br />
       
       <div class="row">
           <div class="col-lg-12">

               <div class="panel panel-default">

~{*                   <div class="panel-heading">
		               <h4>~{#tabtitle#}~</h4>
                   </div>
*}~
                   <div class="panel-body">
                   
                   		<input name="nb-ingredients" id="nb-ingredients" value="~{count($Ingredients)}~" hidden="true">
								
						<div class="dataTable_wrapper">
                      
                           <table id="data-ingredients" width="100%" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th style="text-align:center">~{#ing_name#}~</th>		
										<th style="text-align:center">~{#ing_qte#}~</th>		
									
										~{foreach $smarty.session._elements as $element}~
										
											<th align="center">~{$element.label|cat:' ('|cat:$element.unit|cat:')'}~</th>
										~{/foreach}~		
									</tr>
								</thead>
								
								<tbody>
									
									~{foreach $Ingredients as $ingredient}~
									
										<tr id="~{$ingredient.rel_id}~">

											<td align="left">~{$ingredient.0.0.alim_nom_fr|strip}~</td>
											<td align="right">~{$ingredient.rel_qte|strip|string_format:'%.2f'}~</td>

											~{foreach $ingredient.0 as $nutriment}~

												~{assign var=totnut value=(floatval($ingredient.rel_qte) * (myFloatval($nutriment.teneur) / 100))}~

												<td align="right">
												~{$totnut|strip|string_format:$smarty.session._arrondis[$smarty.session._elements[trim($nutriment.const_code)]['rnd']]}~
												</td>

											~{/foreach}~		
										</tr>
										
									~{/foreach}~
									
									<tr id="-1" class="warning">
										<td align="right">~{#total_qte#}~</td>
										<td align="right">~{$Totalqte|strip|string_format:'%.2f'}~</td>
										
										~{foreach from=$smarty.session._elements key=code item=element}~
										
											<td></td>
										~{/foreach}~
									</tr>
									<tr id="-2" class="warning hidden">
										<td align="right">~{#total_compo#}~</td>
										<td align="right"></td>
										
										~{foreach from=$smarty.session._elements key=code item=element}~
										
											<td align="right">
											~{$Totaux[$code]|strip|string_format:$smarty.session._arrondis[$element['rnd']]}~
											</td>
										~{/foreach}~
									</tr>
									<tr id="-3" class="warning hidden">
										~{assign var=coeff value=(100 / $Totalqte)}~
										
										<td align="right">~{#moyenne_compo#}~</td>
										<td align="right">~{#moyenne_100#|strip|string_format:'%.2f'}~</td>

										~{foreach from=$smarty.session._elements key=code item=element}~
										
											<td align="right">
											~{($Totaux[$code] * $coeff)|strip|string_format:$smarty.session._arrondis[$element['rnd']]}~
											</td>
										~{/foreach}~
									</tr>
								
								</tbody>
							</table>
							
					    </div>
	                    
	                    <br />
						<button id="addingredient" type="button" class="btn my_button">
						~{#btnNew#}~
						</button>
						
					</div>
				</div>
			</div>
		</div>

	<form role="form" 	
		action="~{codeUrl('users_recipes-users_recipes')}~" 
		method="post" id="delrecipy-form">
		
	   <input name="parammode" value="del_rec" hidden />

		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<span style="font-size:120%">~{$Etiquette}~</span>
				</div>
			</div>
			<div class="col-lg-6">
				<button id="delrecipy" type="button" class="btn pull-right">
				~{#btnDel#}~
				</button>
			</div>
		</div>
	</form>

  </div>
  <!-- page-wrapper End -->

  