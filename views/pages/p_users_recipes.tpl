
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users_recipes.cfg' section = $smarty.session.__user_lang__}~

  
  ~{include file = 'p_users_recipes_modals.inc.tpl'}~
  
  <div id="page-wrapper">
  
       <div class="row">
           <div class="col-lg-12">
              <div class="page-header">
                <span style="font-size:150%;">~{#title#}~</span>
	    		  <div class="form-group">
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
              </div>
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
										<th>~{#ing_col1#}~</th>		
										<th>~{#ing_col2#}~</th>		
										<th>~{#ing_col3#}~</th>		
										<th>~{#ing_col4#}~</th>		
										<th>~{#ing_col5#}~</th>		
										<th>~{#ing_col6#}~</th>		
										<th>~{#ing_col7#}~</th>		
										<th>~{#ing_col8#}~</th>		
										<th>~{#ing_col9#}~</th>		
										<th>~{#ing_col10#}~</th>		
									</tr>
								</thead>
								
								<tbody>
									
									~{assign var=totqte value=0}~
									~{assign var=totcol1 value=0}~
									~{assign var=totcol2 value=0}~
									~{assign var=totcol3 value=0}~
									~{assign var=totcol4 value=0}~
									~{assign var=totcol5 value=0}~
									~{assign var=totcol6 value=0}~
									~{assign var=totcol7 value=0}~
									~{assign var=totcol8 value=0}~
									~{assign var=totcol9 value=0}~
									~{assign var=numero value=1}~
									
									~{foreach from=$Ingredients item=ligne}~
									
										<tr id="~{$ligne.ing_id}~">
											<td align="center">~{$numero|strip}~</td>
											<td align="left">~{$ligne.ing_name|strip}~</td>
											<td align="right">~{$ligne.ing_qte|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col1|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col2|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col3|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col4|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col5|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col6|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col7|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col8|strip|string_format:'%.2f'}~</td>
											<td align="right">~{$ligne.ing_col9|strip|string_format:'%.2f'}~</td>
											<td align="right">~{($ligne.ing_col9 * 2.5)|strip|string_format:'%.2f'}~</td>
										</tr>
										
										~{$numero = $numero+1}~
										~{$totqte = $totqte + $ligne.ing_qte}~
										~{$totcol1 = $totcol1 + $ligne.ing_col1}~
										~{$totcol2 = $totcol2 + $ligne.ing_col2}~
										~{$totcol3 = $totcol3 + $ligne.ing_col3}~
										~{$totcol4 = $totcol4 + $ligne.ing_col4}~
										~{$totcol5 = $totcol5 + $ligne.ing_col5}~
										~{$totcol6 = $totcol6 + $ligne.ing_col6}~
										~{$totcol7 = $totcol7 + $ligne.ing_col7}~
										~{$totcol8 = $totcol8 + $ligne.ing_col8}~
										~{$totcol9 = $totcol9 + $ligne.ing_col9}~
										
									~{/foreach}~
									
									<tr id="-1" class="info">
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
