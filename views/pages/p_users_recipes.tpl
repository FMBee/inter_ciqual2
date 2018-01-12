
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users_recipes.cfg' section = $smarty.session.__user_lang__}~

  
  ~{include file = 'p_users_recipes_modals.inc.tpl'}~
  
  <div class="dashboard-wrapper">
  
       <div class="row">
       
           <div class="col-lg-12">
           
              <div class="page-header">
                <span style="font-size:150%;">~{#title#}~</span>
~{*	    		  <div class="form-group">
	    		    <br/>
				    <select name="select_recipes" id="select_recipes" class="selectpicker form-control" required>
				    	~{foreach $Recipes as $item}~
					  		<option value="~{$item.rci_id}~"
						  		~{if $curr_id eq $item.rci_id}~ selected~{/if}~>
						  		~{$item.rci_name}~
					  		</option>
					 	~{/foreach}~
				    </select>        
				  </div>  
*}~              </div>
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
										<th>~{#ing_num#}~</th>		
										<th>~{#ing_name#}~</th>		
										<th>~{#ing_qte#}~</th>		
									
										~{foreach $smarty.session._elements as $element}~
										
											<th>~{$element.label|cat:' ('|cat:$element.unit|cat:')'}~</th>
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
									
										<tr id="~{$ligne.alim_code}~">

											<td align="center">~{$numero|strip}~</td>
											<td align="left">~{$ingredient.0.0.alim_nom_fr|strip}~</td>
											<td align="right">~{$ingredient.rec_qte|strip|string_format:'%.2f'}~</td>

											~{foreach $ingredient.0 as $nutriment name=foo}~
											
												~{if $smarty.foreach.foo.iteration < 9}~
													
													<td align="right">~{$nutriment.teneur|strip|string_format:'%.2f'}~</td>
												~{/if}~	
											~{/foreach}~		
										</tr>
										
										~{$numero = $numero+1}~
										
										~{foreach from=$smarty.session._elements key=code item=element}~
										
											~{$totcol[$code] = $totcol[$code] + $nutriment.teneur}~
										~{/foreach}~
										
									~{/foreach}~
									
~{*									<tr id="-1" class="info">
										<td align="right"> </td>
										<td align="right">~{#total_compo#}~</td>
										<td align="right">~{$totqte|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol1|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol2|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol3|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol4|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol5|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol6|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol7|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol8|strip|string_format:'%.2f'}~</td>
										<td align="right">~{$totcol9|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol9 * 2.5)|strip|string_format:'%.2f'}~</td>
									</tr>
									<tr id="-2" class="success">
										~{assign var=coeff value=(100 / $totqte)}~
										
										<td align="right"> </td>
										<td align="right">~{#moyenne_compo#}~</td>
										<td align="right">~{#moyenne_100#|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol1 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol2 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol3 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol4 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol5 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol6 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol7 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol8 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol9 * $coeff)|strip|string_format:'%.2f'}~</td>
										<td align="right">~{($totcol9 * 2.5)|strip|string_format:'%.2f'}~</td>
									</tr>
*}~									
								</tbody>
							</table>
							
					    </div>

						<div class="col-sm-6">
		                    
		                    </br>
							<button id="addingredient" type="button" class="btn">
							~{#btnAdd#}~ un ingrédient
							</button>
							
						</div>

					</div>
				</div>
				<button id="delrecipe" type="button" class="btn pull-right">
				Supprimer la formulation
				</button>
					            
			</div>
		
		</div>
		
  </div>
  <!-- page-wrapper End -->

  