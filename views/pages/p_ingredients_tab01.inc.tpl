
						 <br/>
                         <div class="row">
                            <div class="col-lg-12">
<form id="fingredients-01" method="post" role="form" action="~{codeUrl('ingredients'|cat:precPage()|cat:'&paramkey='|cat:$_param.key|strip)}~">

<div class="col-md-12">

~{*
<div class="form-group">
<label>~{#ing_code#}~</label>
<input name="ing_code" id="ing_code" class="form-control" 
~{if $_param.key eq "0"}~ placeholder="~{#ing_code#}~"
~{else}~ value="~{$Ingredients.0.alim_code}~" ~{/if}~ disabled>
</div>
*}~

<div class="form-group">
<label>~{#ing_name#}~</label>
<input name="ing_name" id="ing_name" class="form-control"
~{if $_param.key eq "0"}~ placeholder="~{#ing_name#}~"
~{else}~ value="~{$Ingredients.0.alim_nom_fr}~" ~{/if}~ disabled>
</div>

<div class="form-group">
<label>~{#cat_name#}~</label>
<input name="cat_name" id="cat_name" class="form-control"
~{if $_param.key eq "0"}~ placeholder="~{#cat_name#}~"
~{else}~ value="~{substr($Ingredients.0.alim_name, strpos($Ingredients.0.alim_name, '|')+2)}~" ~{/if}~ disabled>
</div>

~{*
<div class="form-group">
<label>~{#cat_code#}~</label>
<input name="cat_code" id="cat_code" class="form-control"
~{if $_param.key eq "0"}~ placeholder="~{#cat_code#}~"
~{else}~ value="~{$Ingredients.0.alim_grp_code}~" ~{/if}~ disabled>
</div>
*}~
	
	                    <table id="values-ingredients" width="100%" class="table table-striped table-bordered table-hover" >

							<thead>
								<tr>
<!-- <th>~{#const_id#}~</th> -->
<th>~{#const_name#}~</th>
<th>~{#const_value#}~</th>
								</tr>
							<tbody>
							
~{foreach $Synthese as $value}~
									<tr id="~{$value.const_code}~">
<!-- <td>~{$value.const_code|strip}~</td> -->
<td>~{$value.const_nom_fr|strip}~</td>
<td>~{$value.teneur|strip}~</td>
									</tr>
~{/foreach}~
							</tbody>
						</table>

							        <a class="btn btn-default" href="~{codeUrl(precPage())}~" >
							        ~{#btnReturn#}~
							        </a>
							        
								</div>
							</form>

						</div>
					</div>


                            