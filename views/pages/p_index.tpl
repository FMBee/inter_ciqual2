
	~{config_load file = 'g_menus.cfg' section = $smarty.session.__user_lang__}~
	~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
	
        <!-- Dashboard Wrapper Start -->
        <div class="dashboard-wrapper">

			<!-- Modal : ajout d'une recette -->
						                     
			<div class="modal fade" id="modal-addrecipe" tabindex="-1" role="dialog"
				aria-labelledby="modal-addrecipe-label" aria-hidden="true">>
				
				<div class="modal-dialog"  role="document">
					<div class="modal-content">
					
						<div class="modal-header">
								<h4 class="modal-title title" id="modal-addrecipe-label">
									~{#mdladdtitre#}~
								</h4>
						</div>
						
						<div class="modal-body ">
			
									<form role="form" 	
										action="~{codeUrl('users_recipes-users_recipes&parammode=add_rec')}~" 
										method="post" id="modal-faddrecipe">
									  
										<input name="addrecipe-ingcode" id="addrecipe-ingcode" hidden="true" value="">
			
										<div class="row">
										 <div class="col-md-10">
											<div class="form-group">
											    <label>~{#mdladdnom#}~</label>
											    <input name="addrecipe-nom" id="addrecipe-nom" class="form-control" 
											    		placeholder="Tapez votre libellé" value="" autofocus>
											</div>  
										 </div>
										 <div class="col-md-10">
											<div class="form-group">
											    <label>~{#mdladding#}~</label>
											    <input name="addrecipe-ing" id="addrecipe-ing" class="form-control" 
											    		placeholder="Tapez un mot-clé" value="" >
											</div>  
										 </div>
										</div>
										
										<div class="modal-footer">
											<button id="addrecipe-addrecord" type="button" class="btn pull-left">
											~{#btnAdd#}~
											</button>
											<button id="addrecipe-cancel" type="button" class="btn btn-default pull-right" data-dismiss="modal">
											~{#btnCancel#}~
											</button>
										</div>	
												
								  </form>		
								  			
						</div>
					</div>
				</div>
			</div>
        
          <!-- Row starts -->
          <div class="row">
          
            ~{if !is_null($smarty.session._recipy) }~
            
	            <div class="col-md-6 col-sm-6">
	              <a href="~{codeUrl('-users_recipes')}~">
	              <div class="mini-widget mini-widget-bronze">
	                <div class="mini-widget-body clearfix">
	                  <div class="center-align-text">
	                     <img src="~{$smarty.const.__VIEWS_IMG__}~picto_suiviJournalier.png" style="width:150px; height:150px;" />
	                  </div>
					  <div class="center-align-text number">~{#etiq_08#}~</div>
	                </div>
	              </div>
	              </a>	
	            </div>
	       ~{/if}~
            
            <div class="col-md-6 col-sm-6">
              <a href="#">
              <div id="addrecipe" class="mini-widget mini-widget-bronze">
                <div class="mini-widget-body clearfix ">
                  <div class="center-align-text">
                    <img src="~{$smarty.const.__VIEWS_IMG__}~picto_temperatureFrigo.png" style="width:150px; height:150px;" />
                  </div>
                  <div class="center-align-text number">~{#etiq_09#}~</div>
                </div>
              </div>
              </a>	
            </div>

          </div>
          <!-- Row ends -->
        </div>
        <!-- Dashboard Wrapper End -->
