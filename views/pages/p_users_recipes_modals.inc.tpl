

<!-- Modal : ajout d'un ingredient -->
			                     
<div class="modal fade" id="modal-addingredient" tabindex="-1" role="dialog"
	aria-labelledby="modal-addingredient-label" aria-hidden="true">>
	
	<div class="modal-dialog"  role="document">
		<div class="modal-content">
		
			<div class="modal-header">
					<h4 class="modal-title title" id="modal-addingredient-label">
						~{#mdladdtitre#}~
					</h4>
			</div>
			
			<div class="modal-body ">

						<form role="form" 	
							action="~{codeUrl('users_recipes-users_recipes&parammode=add_ing')}~" 
							method="post" id="addingredient-fadd">
						  
							<input name="addingredient-code" id="addingredient-code" hidden="true" value="">

							<div class="row">
							 <div class="col-md-12">
								<div class="form-group">
								    <label>~{#mdladdnom#}~</label>
								    <input name="addingredient-introvalue" id="addingredient-introvalue" class="form-control" 
								    		placeholder="Tapez votre recherche" value="" autofocus>
								</div>  
							 </div>
							</div>
							<div class="row">
							 <div class="col-md-4">
								<div class="form-group">
								    <label>~{#mdladdquantite#}~</label>
								    <input name="addingredient-qte" id="addingredient-qte" class="form-control" align="right" placeholder="0.00" value="" required >
								</div>  
							 </div>
							</div>
							
							<div class="modal-footer">
								<button id="addingredient-addrecord" type="button" class="btn pull-left">
								~{#btnAdd#}~
								</button>
								<button id="addingredient-cancel" type="button" class="btn btn-default pull-right" data-dismiss="modal">
								~{#btnCancel#}~
								</button>
							</div>	
									
					  </form>		
					  			
			</div>
		</div>
	</div>
</div>

<!-- Modal : modif d'un ingredient -->
			                     
<div class="modal fade" id="modal-majingredient" tabindex="-1" role="dialog"
	aria-labelledby="modal-majingredient-label" aria-hidden="true">>
	
	<div class="modal-dialog"  role="document">
		<div class="modal-content">
		
			<div class="modal-header">
					<h4 class="modal-title title" id="modal-majingredient-label">
						~{#mdlmajtitre#}~
					</h4>
			</div>
			
			<div class="modal-body ">

						<form role="form" 	
							action="~{codeUrl('users_recipes-users_recipes&parammode=maj_ing')}~" 
							method="post" id="majingredient-fmaj">
						  
							<input name="majingredient-id" id="majingredient-id" hidden="true" value="">

							<div class="row">
							 <div class="col-md-12">
								<div class="form-group">
								    <label>~{#mdlmajnom#}~</label>
								    <input name="majingredient-name" id="majingredient-name" class="form-control" value="" disabled>
								</div>  
							 </div>
							</div>
							<div class="row">
							 <div class="col-md-4">
								<div class="form-group">
								    <label>~{#mdlmajquantite#}~</label>
								    <input name="majingredient-qte" id="majingredient-qte" class="form-control" align="right" value="" required autofocus>
								</div>  
							 </div>
							</div>
							
							<div class="modal-footer">
								
								<button id="majingredient-majrecord" type="button" class="btn pull-left">
								~{#btnSubmit#}~
								</button>
								
								~{if count($Ingredients) > 1}~
								
									<button id="majingredient-delrecord" type="button" class="btn">
									~{#btnDelete#}~
									</button>
								~{/if}~	
								
								<button id="majingredient-cancel" type="button" class="btn btn-default pull-right" data-dismiss="modal">
								~{#btnCancel#}~
								</button>
							</div>	
									
					  </form>		
					  			
<!-- supp d'une prestation -->
			
						<form role="form" 	
							action="~{codeUrl('users_recipes-users_recipes&parammode=del_ing')}~" 
							method="post" id="majingredient-fdel">
						  
							<input name="delingredient-id" id="delingredient-id" hidden="true" value="">
						</form>	
			</div>
		</div>
	</div>
</div>

<!-- Modal : modif nom de recette -->
			                     
<div class="modal fade" id="modal-chgrecipyname" tabindex="-1" role="dialog"
	aria-labelledby="modal-chgrecipyname-label" aria-hidden="true">>
	
	<div class="modal-dialog"  role="document">
		<div class="modal-content">
		
			<div class="modal-header">
					<h4 class="modal-title title" id="modal-chgrecipyname-label">
						~{#mdlchgtitre#}~
					</h4>
			</div>
			
			<div class="modal-body ">

						<form role="form" 	
							action="~{codeUrl('users_recipes-users_recipes&parammode=chg_nam')}~" 
							method="post" id="chgrecipyname-fchg">
						  
							<div class="row">
							 <div class="col-md-12">
								<div class="form-group">
								    <label>~{#mdlchgnom#}~</label>
								    <input name="chgrecipyname-nom" id="chgrecipyname-nom" class="form-control" 
								    		placeholder="Tapez la description" value="" autofocus>
								</div>  
							 </div>
							</div>
							
							<div class="modal-footer">
								<button id="chgrecipyname-chgrecord" type="button" class="btn pull-left">
								~{#btnSubmit#}~
								</button>
								<button id="chgrecipyname-cancel" type="button" class="btn btn-default pull-right" data-dismiss="modal">
								~{#btnCancel#}~
								</button>
							</div>	
									
					  </form>		
					  			
			</div>
		</div>
	</div>
</div>


