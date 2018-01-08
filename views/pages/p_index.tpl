
	~{config_load file = 'g_menus.cfg' section = $smarty.session.__user_lang__}~
	
        <!-- Dashboard Wrapper Start -->
        <div class="dashboard-wrapper-lg">
          <!-- Row starts -->
          <div class="row">
            <div class="col-md-3 col-sm-6">
              <a href="~{codeUrl('-users_recipes&parammode=show')}~">
              <div class="mini-widget mini-widget-bronze">
                <div class="mini-widget-body clearfix">
                  <div class="center-align-text">
                     <img src="~{$smarty.const.__VIEWS_IMG__}~picto_suiviJournalier.png" style="width:150px; height:150px;" />
                  </div>
				  <div class="center-align-text number">Recettes</div>
                </div>
              </div>
              </a>	
            </div>
            <div class="col-md-3 col-sm-6">
              <a href="~{codeUrl('-ingredients_seek')}~">
              <div class="mini-widget mini-widget-bronze">
                <div class="mini-widget-body clearfix ">
                  <div class="center-align-text">
                    <img src="~{$smarty.const.__VIEWS_IMG__}~picto_temperatureFrigo.png" style="width:150px; height:150px;" />
                  </div>
                  <div class="center-align-text number">Creation</div>
                </div>
              </div>
              </a>	
            </div>

          </div>
          <!-- Row ends -->
        </div>
        <!-- Dashboard Wrapper End -->
