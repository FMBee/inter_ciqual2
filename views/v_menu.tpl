 ~{config_load file = 'g_menus.cfg' section = $smarty.session.__user_lang__}~

    <!-- Header Start -->
    <header>

		  <div class="pull-left">
	    	  <span style="background-color:white">
	    	  	<img width="130" class="" src="~{$smarty.const.__VIEWS_IMG__|cat:'intermarche-logo.png'}~">
	    	  </span>
		  </div>
	      <div class="pull-right">
	        <ul id="mini-nav" class="clearfix">
	          <li class="list-box">
	          	<a href="#">
	              <span class="text-white"><h5>~{$smarty.session.__user_name__}~</h5></span>
	          	</a>
	          </li>        
	          <li class="list-box user-profile">
	            <a id="drop7" href="#" role="button" class="dropdown-toggle user-avtar" data-toggle="dropdown">
	              <img src='~{$smarty.session.__user_image__}~' alt='~{$smarty.session.__user_name__}~'>
	            </a> 
	            <ul class="dropdown-menu server-activity">
~{*					~{if $smarty.session.__admin_mode__ }~
						<p>
						<li><a href="~{codeUrl('-users_list')}~">
						<i class="fa fa-group fa-fw"></i>
						&nbsp;~{#etiq_031#}~
						</p>
					~{else}~
						<p>
						<li><a href="~{codeUrl('-users&paramkey='|cat:$smarty.session.__user_id__)}~">
						~{if $smarty.server.__app_params__.__APP_USER_LOGO__}~
						<img class="user-avatar2" src="~{$smarty.session.__user_image__}~">
						~{else}~
						<i class="fa fa-user fa-fw"></i>
						~{/if}~
						&nbsp;~{#etiq_03#}~
						</p>
					~{/if}~
					</a></li>
*}~					<li>
						  <p>
						<a href="~{codeUrl('deconnect-')}~">
							<i class="fa fa-sign-out fa-fw text-warning"></i>
							 <span class="text-info">~{#etiq_04#}~</span>
						</a>
						  </p>
					</li>
           		</ul>
	          </li>        
	        </ul>
	      </div>		 
	    
    </header>
    <!-- Header End -->


	<div class="dashboard-container">
		
		<div class="container">
        	<!-- Top Nav Start -->
        	<div id='cssmenu'>

	          <ul>
	            <li class="~{if $smarty.get.page=='index' || $smarty.get.page=='users_recipes'}~active~{/if}~">
	              <a href="~{codeUrl('-index')}~">
	                <i class="fa fa-home"></i>
	                ~{#etiq_05#}~
	              </a>
	            </li>
	            <li class="~{if $smarty.get.page=='ingredients_seek'}~active~{/if}~">
	              <a href="~{codeUrl('-ingredients_seek')}~">
	              	<i class="fa fa-table"></i>
	              	~{#etiq_06#}~
	              </a>
	            </li>
	            <li class="~{if $smarty.get.page=='documents'}~active~{/if}~">
	              <a href="~{codeUrl('-documents')}~">
	              <i class="fa fa-file-text"></i>
	              ~{#etiq_07#}~
	              </a>
	            </li>
	          </ul>
	        </div>
	        <!-- Top Nav End -->


