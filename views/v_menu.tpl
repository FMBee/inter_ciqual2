 ~{config_load file = 'g_menus.cfg' section = $smarty.session.__user_lang__}~

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<div class="navbar-brand">
		<span><img class="user-avatar" src="~{$smarty.const.__VIEWS_IMG__|cat:'inter.jpeg'}~"></span>
		<a href="~{codeUrl('index')}~">~{#titre#}~&nbsp;-&nbsp;
			~{$smarty.const.__APP_TITLE__}~</a>
		</div>
	</div>
	<ul class="nav navbar-top-links navbar-right">


		~{if $smarty.session.__root_mode__ === true}~

		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-cogs fa-fw"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="~{codeUrl('-app_parameters')}~"><i
						class="fa fa-gear fa-fw"></i> ~{#etiq_01#}~</a></li>
				<li><a href="~{codeUrl('-app_logs_list')}~"><i
						class="fa fa-book fa-fw"></i> ~{#etiq_13#}~</a></li>
				<li class="divider"></li>
				<li><a href="~{codeUrl('app_execute-index')}~"><i
						class="fa fa-sign-out fa-fw"></i> ~{#etiq_02#}~</a></li>
			</ul></li> 
		~{/if}~

		<li><span>~{$smarty.session.__user_name__}~</span></li> 

		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">
			~{if $smarty.server.__app_params__.__APP_USER_LOGO__}~
				<img class="user-avatar" src="~{$smarty.session.__user_image__}~">
			~{else}~
				<i class="fa fa-user fa-fw"></i>
			~{/if}~
			</a>
			<ul class="dropdown-menu dropdown-user">

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
				<li class="divider"></li>
				<li><a href="~{codeUrl('deconnect-')}~"><i
						class="fa fa-sign-out fa-fw"></i> ~{#etiq_04#}~</a></li>
			</ul>
		</li>
	</ul>

	<div class="navbar-default sidebar" role="navigation">
	
		<br />
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
					
				<li><a href="~{codeUrl('-users_recipes&parammode=show')}~"><i
						class="fa fa-book fa-fw"></i> ~{#etiq_07#}~</a></li>
				<li><a href="~{codeUrl('-ingredients_seek')}~"><i
						class="fa fa-book fa-fw"></i> ~{#etiq_06#}~</a></li>
				<li><a href="~{codeUrl('-parametres&paramkey=1')}~"><i
								class="fa fa-cogs fa-fw"></i> ~{#etiq_12#}~</a></li>
			</ul>
		</div>
	</div>
</nav>
