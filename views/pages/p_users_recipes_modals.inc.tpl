

<!-- Modal : ajout d'un ingredient -->
			                     
<div class="modal fade" id="modal-addingredient" tabindex="-1" role="dialog"
	aria-labelledby="modal-addingredient-label" >
	
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
							method="post" id="modal-faddingredient">
						  
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
</div>

<!-- Modal : modif d'un ingredient -->
			                     
<div class="modal fade" id="modal-majingredient" tabindex="-1" role="dialog"
	aria-labelledby="modal-majingredient-label" >
	
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
							method="post" id="modal-fmajingredient">
						  
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
								<button id="majingredient-supprecord" type="button" class="btn">
								~{#btnDelete#}~
								</button>
								<button id="majingredient-cancel" type="button" class="btn btn-default pull-right" data-dismiss="modal">
								~{#btnCancel#}~
								</button>
							</div>	
									
					  </form>		
					  			
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
