 ~{config_load file = 'g_menus.cfg' section = $smarty.session.__user_lang__}~

    <!-- Header Start -->
    <header>

    	  <span><img class="user-avatar2" src="~{$smarty.const.__VIEWS_IMG__|cat:'inter.jpeg'}~"></span>
		  <a href="~{codeUrl('index')}~">~{#titre#}~&nbsp;-&nbsp;
			~{$smarty.const.__APP_TITLE__}~
		  </a>
	      <div class="pull-right">
	        <ul id="mini-nav" class="clearfix">
	          <li class="list-box">
	          	<a href="#">
	              <span class="text-white">~{$smarty.session.__user_name__}~</span>
	          	</a>
	          </li>        
	          <li class="list-box user-profile">
	            <a id="drop7" href="#" role="button" class="dropdown-toggle user-avtar" data-toggle="dropdown">
	              <img src='~{$smarty.session.__user_image__}~' alt='~{$smarty.session.__user_name__}~'>
	            </a> 
	            <ul class="dropdown-menu server-activity">
					~{if $smarty.session.__admin_mode__ }~
						<li><a href="~{codeUrl('-users_list')}~">
						<i class="fa fa-group fa-fw"></i>
						&nbsp;~{#etiq_031#}~
					~{else}~
						<li><a href="~{codeUrl('-users&paramkey='|cat:$smarty.session.__user_id__)}~">
						~{if $smarty.server.__app_params__.__APP_USER_LOGO__}~
						<img class="user-avatar2" src="~{$smarty.session.__user_image__}~">
						~{else}~
						<i class="fa fa-user fa-fw"></i>
						~{/if}~
						&nbsp;~{#etiq_03#}~
					~{/if}~
					</a></li>
					<li><a href="~{codeUrl('deconnect-')}~"><i
							class="fa fa-sign-out fa-fw"></i> ~{#etiq_04#}~</a>
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
	            <li class='active'>
	              <a href='#'>
	                <i class="fa fa-dashboard"></i>
	                Dashboard
	              </a>
	            </li>
	            <li class=''>
	              <a href='#'>
	              	<i class="fa fa-bar-chart-o"></i>
	              	Graphs</a>
	            </li>
	            <li class=''>
	              <a href='#'><i class="fa fa-flask">
	              </i>Elements</a>
	            </li>
	          </ul>
	        </div>
	        <!-- Top Nav End -->


