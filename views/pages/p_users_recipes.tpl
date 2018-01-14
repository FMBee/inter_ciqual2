
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users_recipes.cfg' section = $smarty.session.__user_lang__}~

  
  ~{include file = 'p_users_recipes_modals.inc.tpl'}~
  
  <div class="dashboard-wrapper">
  
       <div class="row">
       
           <div class="col-lg-12">
           
	             <div class="form-inline">
	                <span style="font-size:150%;">~{#title#}~</span>
				    <input name="seek-recipy" id="seek-recipy"
					class="form-control" placeholder="Tapez votre recherche"
					value="" >
	             </div>
	             <br />
           </div>
       </div>
       
       <div class="row">
           <div class="col-lg-12">

               <div class="panel panel-default">
                   <div class="panel-heading">
		               <h4>~{#tabtitle#}~</h4>
                   </div>
                   <div class="panel-body">
								
						<div class="dataTable_wrapper">
                      
                           <table id="data-ingredients" width="100%" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th align="center">~{#ing_num#}~</th>		
										<th align="center">~{#ing_name#}~</th>		
										<th align="center">~{#ing_qte#}~</th>		
									
										~{foreach $smarty.session._elements as $element}~
										
											<th align="center">~{$element.label|cat:' ('|cat:$element.unit|cat:')'}~</th>
										~{/foreach}~		
									</tr>
								</thead>
								
								<tbody>
									~{assign var=numero value=1}~
									~{assign var=totqte value=0}~
									~{assign var=totcol value=[]}~
									
									~{foreach from=$smarty.session._elements key=code item=element}~
									
										~{$totcol[$code]=0}~
									~{/foreach}~		
									
									~{foreach $Ingredients as $ingredient}~
									
										<tr id="~{$ingredient.rel_id}~">

											<td align="center">~{$numero|strip}~</td>
											<td align="left">~{$ingredient.0.0.alim_nom_fr|strip}~</td>
											<td align="right">~{$ingredient.rel_qte|strip|string_format:'%.2f'}~</td>

											~{assign var=recqte value=floatval($ingredient.rel_qte)}~
											~{$totqte = $totqte + $recqte}~
												
											~{foreach $ingredient.0 as $nutriment}~

												~{assign var=totnut value=($recqte * (myFloatval($nutriment.teneur) / 100))}~

												<td align="right">
												~{$totnut|strip|string_format:$smarty.session._arrondis[$smarty.session._elements[trim($nutriment.const_code)]['rnd']]}~
												</td>

												~{$totcol[trim($nutriment.const_code)] = $totcol[trim($nutriment.const_code)] + $totnut}~

											~{/foreach}~		
										</tr>
										~{$numero = $numero+1}~
										
									~{/foreach}~
									
									<tr id="-1" class="info">
										<td align="right"> </td>
										<td align="right">~{#total_compo#}~</td>
										<td align="right">~{$totqte|strip|string_format:'%.2f'}~</td>
										
										~{foreach from=$smarty.session._elements key=code item=element}~
										
											<td align="right">
											~{$totcol[$code]|strip|string_format:$smarty.session._arrondis[$element['rnd']]}~
											</td>
										~{/foreach}~
									</tr>
									<tr id="-2" class="success">
										~{assign var=coeff value=(100 / $totqte)}~
										
										<td align="right"> </td>
										<td align="right">~{#moyenne_compo#}~</td>
										<td align="right">~{#moyenne_100#|strip|string_format:'%.2f'}~</td>

										~{foreach from=$smarty.session._elements key=code item=element}~
										
											<td align="right">
											~{($totcol[$code] * $coeff)|strip|string_format:$smarty.session._arrondis[$element['rnd']]}~
											</td>
										~{/foreach}~
									</tr>
								
								</tbody>
							</table>
							
					    </div>
	                    
	                    </br>
						<button id="addingredient" type="button" class="btn">
						~{#btnNew#}~
						</button>
					</div>
				</div>
				<button id="delrecipe" type="button" class="btn pull-right">
				~{#btnDel#}~
				</button>
					            
			</div>
		</div>
  </div>
  <!-- page-wrapper End -->

  