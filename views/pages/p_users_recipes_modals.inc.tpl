

<!-- Modal : ajout d'un ingredient -->

<div class="modal fade" id="modal-addingredient" tabindex="-1" role="dialog"
	aria-labelledby="modal-addingredient-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-addingredient-label">
						~{#mdladdtitre#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
					<div class="row">
					 <div class="col-lg-6">

						<form role="form" 	action="~{codeUrl('users_recipes-users_recipes&parammode=add&paramkey='|cat:$curr_id)}~" 
											method="post" id="modal-faddingredient">
						  
							<input name="modal-addingredient-paramingredient" id="modal-addingredient-paramingredient" hidden="true" value="">
<!-- 							<input name="modal-addingredient-paramsejour" id="modal-addingredient-paramsejour" hidden="true" value=""> -->

							<div class="form-group">
							    <label>~{#mdladdnom#}~</label>
							    <input name="modal-addingredient-introvalue" id="modal-addingredient-introvalue" class="form-control" 
							    		placeholder="Tapez votre recherche" value="" autofocus>
							</div>  
							<div class="form-group">
							    <label>~{#mdladdquantite#}~</label>
							    <input name="modal-addingredient-qte" id="modal-addingredient-qte" class="form-control" value="100.00" required >
							</div>  
								
							<button id="modal-addingredient-addrecord" type="button" class="btn">
							~{#btnAdd#}~
							</button>
							<button id="modal-addingredient-cancel" type="button" class="btn btn-default pull-right" data-dismiss="modal">
							~{#btnCancel#}~
							</button>
									
					  </form>		
					  			
					</div>
				 </div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<!-- Modal : maj d'un ingredient -->

<div class="modal fade" id="modal-majingredient" tabindex="-1" role="dialog"
	aria-labelledby="modal-majingredient-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-majingredient-label">
						~{#mdlmajtitre#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
					<div class="row">
					 <div class="col-lg-6">

						<form role="form" 	action="~{codeUrl('users_recipes-users_recipes&parammode=maj&paramkey='|cat:$curr_id)}~" 
											method="post" id="modal-fmajingredient">
						  
							<input name="modal-majingredient-paramingredient" id="modal-majingredient-paramingredient" hidden="true" value="">
<!-- 							<input name="modal-majingredient-paramsejour" id="modal-majingredient-paramsejour" hidden="true" value=""> -->

							<div class="form-group">
							    <label>~{#mdladdnom#}~</label>
							    <input name="modal-majingredient-name" id="modal-majingredient-name" class="form-control" value="" disabled>
							</div>  
							<div class="form-group">
							    <label>~{#mdladdquantite#}~</label>
							    <input name="modal-majingredient-qte" id="modal-majingredient-qte" class="form-control" value="" required >
							</div>  
								
							<button id="modal-majingredient-majrecord" type="button" class="btn">
							~{#btnSubmit#}~
							</button>
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">
							~{#btnCancel#}~
							</button>
									
					  </form>		
					  			
					</div>
				 </div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<!-- Modal : maj d'une prestation -->
~{*
<div class="modal fade" id="modal-majprestation" tabindex="-1" role="dialog"
	aria-labelledby="modal-majprestation-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-majprestation-label">
						~{#mdlmajprestation#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
				
					<div class="row">
					 <div class="col-lg-6">

						<form role="form" 	action="index.php?action=sejour_ingredients&page=sejour_ingredients" 
											method="post" id="modal-fmajprestation">
						  
							<input name="modal-majprestation-paramingredient" id="modal-majprestation-paramingredient" hidden="true" value="">
							<input name="modal-majprestation-paramindex" id="modal-majprestation-paramindex" hidden="true" value="">
							<input name="modal-majprestation-paramfacture" id="modal-majprestation-paramfacture" hidden="true" value="">
							<input name="modal-majprestation-paramnumlig" id="modal-majprestation-paramnumlig" hidden="true" value="">
							<input name="modal-majprestation-paramsejour" id="modal-majprestation-paramsejour" hidden="true" value="">
							<input name="modal-majprestation-paramsejourname" id="modal-majprestation-paramsejourname" hidden="true" value="">

							<div class="form-group">
							    <label>~{#fli_descriptif#}~</label>
							    <input name="modal-majprestation-fli_descriptif" id="modal-majprestation-fli_descriptif" class="form-control" required >
							</div>  

							<div class="form-group">
							    <label>~{#fli_puttc#}~</label>
							    <input name="modal-majprestation-fli_puttc" id="modal-majprestation-fli_puttc" class="form-control" required >
							</div>  
							
							<div class="form-group">
							    <label>~{#fli_quantite#}~</label>
							    <input name="modal-majprestation-fli_quantite" id="modal-majprestation-fli_quantite" class="form-control" value="1" required >
							</div>  
							
							<button id="modal-majprestation-submit" type="button" class="btn">
							~{#btnSubmit#}~
							</button>&nbsp;
							<button id="modal-majprestation-suppr" type="button" class="btn">
							~{#btnSuppr#}~
							</button>&nbsp;
							<button type="button" class="btn btn-default" data-dismiss="modal">
							~{#btnCancel#}~
							</button>
							
					  </form>		
					  			
					</div>
				 </div>
				</div>
			</div>
		</div>
	</div>
</div>
*}~
