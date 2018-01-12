 ~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~ 
 ~{config_load file = 'g_users.cfg' section = $smarty.session.__user_lang__}~


<div class="dashboard-wrapper">

	<br />
	<br />
	<div class="row">
		<div class="col-lg-12">

			<div class="panel panel-success">

				<div class="panel-heading">

					<span> <a class="btn btn-default btn-xs"
						href="~{codeUrl(precPage())}~"> <i
							class="fa fa-chevron-left fa-2x"></i>
					</a>&nbsp;
					</span> <span style="font-size: 130%;"> 
					~{if $_param.key eq '0'}~
						~{#libNouveau#}~ ~{else}~
						~{#subtitle#}~&nbsp;~{$users.usr_last_name}~&nbsp;~{$users.usr_first_name}~
					~{/if}~ </span>

					<div class="btn-group pull-right">
						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown">
							<i class="fa fa-bars fa-2x"></i>
						</button>
						<ul class="dropdown-menu slidedown">
							~{if $smarty.session.__admin_mode__ && (! $smarty.server.__app_params__.__APP_USER_CREATE__)}~
							<li><a id="dropdown-item1"
								href="~{codeUrl('-users&paramkey=0')}~"> <i
									class="fa fa-plus fa-fw"></i> ~{#btnAdd#}~
							</a></li>
							~{/if}~
							<li><a id="dropdown-item3" href="#"> <i
									class="fa fa-print fa-fw"></i> ~{#btnPrint#}~
							</a></li>
						</ul>
					</div>
				</div>

				<div class="panel-body">

					<div class="row">
						<div class="col-lg-12">

							<form id="fusers" method="post" role="form"
							
								~{if $smarty.session.__admin_mode__}~
									action="~{codeUrl('users-users_list'|cat:'&paramkey='|cat:$_param.key|strip)}~"
								~{else}~
									action="~{codeUrl('users-index'|cat:'&paramkey='|cat:$_param.key|strip)}~"
								~{/if}~	>

<!-- 							sauvegarde de l'id pour controle au retour vers controller/action -->
								<input name="paramkey" hidden="true" value="~{$_param.key}~">

								<div class="col-lg-6">
								
									<div class="form-group">
										<label>~{#libNom#}~</label> 
										<input name="usr_last_name"
											id="usr_last_name" class="form-control" ~{if $_param.key
											eq '0'}~ placeholder="~{#libNom#}~"
											~{else}~ value="~{$users.usr_last_name}~" ~{/if}~
											autofocus required>
									</div>
									<div class="form-group">
										<label>~{#libPrenom#}~</label> 
										<input name="usr_first_name"
											id="usr_first_name" class="form-control" ~{if $_param.key
											eq '0'}~ placeholder="~{#libPrenom#}~"
											~{else}~ value="~{$users.usr_first_name}~" ~{/if}~ >
									</div>
									<div class="form-group">
										<label>~{#libMail#}~</label> 
										<input name="usr_mail"
											id="usr_mail" type="email" class="form-control"
											~{if $_param.key eq '0'}~ placeholder="~{#libMail#}~"
											~{else}~ value="~{$users.usr_mail}~"~{/if}~  >
									</div>

									~{if $smarty.server.__app_params__.__APP_INTERNATIONAL__}~

									<div class="form-group">
										<label>~{#libLang#}~</label> 
										<select name="usr_lang"
											id="usr_lang" class="selectpicker form-control" required>
											~{foreach $languages as $language}~
											<option value="~{$language.lng_code}~" ~{if $_param.key neq '0'}~
												  			~{if $users.usr_lang eq $language.lng_code}~ selected~{/if}~
												  		~{else}~
												  			~{if $smarty.session.__user_lang__ eq $language.lng_code}~ selected~{/if}~
												  		~{/if}~ >
												~{$language.lng_lib}~</option> ~{/foreach}~
										</select>
									</div>
									~{/if}~ 
									
									~{if $smarty.server.__app_params__.__APP_USER_LOGO__}~

									<div class="form-inline">
										<div class="form-group">
											<label style="margin-right: 20px">~{#libAvatar#}~</label> 
											<img
												id="image_aff" style="width: 40%; height: 40%;"
												~{if $_param.key neq '0'}~ src="~{$users.usr_image_path}~"
												~{else}~ src="~{$smarty.const.__PATH_USERIMG__}~"
												~{/if}~ 
											/>
										</div>
										<div class="form-group">
											<button type="button" class="my_button btn btn-sm"
												onclick="$('#list_logos').toggle('slow');">~{#btnModify#}~
											</button>
										</div>
									</div>

									<div class="form_group">
										<div id="list_logos">
											<br /> <label>~{#libLogo#}~</label>
											<div class="owl-carousel">
												~{foreach from=$logos item=logo}~
												<div style="width: 110px;">
													<a class="my_item link" id="logo_~{$logo}~"> <img
														src="~{$smarty.const.__VIEWS_IMG__}~profiles/~{$logo}~">
													</a>
												</div>
												~{/foreach}~
											</div>
											<input type="hidden" id="usr_image_path"
												name="usr_image_path" ~{if $_param.key
												neq '0'}~ value="~{$users.usr_image_path}~"
												~{else}~ value="~{$smarty.const.__PATH_USERIMG__}~" ~{/if}~ 
												/>
										</div>
									</div>
									~{/if}~ 
									
									~{if $smarty.session.__admin_mode__}~

									<div class="form-inline">
										</br>
										<!-- 				  pas de sortie si utilisateur courant ou création -->
										<fieldset ~{if ($smarty.session.__user_id__	eq $_param.key) || $_param.key eq '0'}~
										  				disabled
										  			~{/if}~ >
											<div class="form-group">
												<label for="out_user">~{#libSortie#}~&nbsp;&nbsp;</label> 
												<input
													type="checkbox" data-on-text="~{#btnYes#}~"
													data-off-text="~{#btnNo#}~" data-on-color="warning"
													data-off-color="default" data-size="small" name="out_user"
													id="out_user" value="1" 
													~{if $_param.key neq '0'}~
								                  		~{if $users.usr_out_date neq $smarty.const.__DATE_NULL__}~ checked>
															<span>le ~{$users.usr_out_date|Date_format:"%d/%m/%Y"}~</span> ~{else}~ >
														~{/if}~ 
													~{else}~ > 
													~{/if}~
											</div>
										</fieldset>
									</div>
									~{/if}~

								</div>

								<div class="col-lg-6">
								
									<div class="form-group">
										<label>~{#libLogin#}~</label> 
										<input name="usr_login"
											id="usr_login" class="form-control" 
											~{if $_param.key eq '0'}~ placeholder="~{#libLogin#}~"
											~{else}~ value="~{$users.usr_login}~" 
											~{/if}~ 
											~{if (! $smarty.server.__app_params__.__APP_USER_CREATE__)}~
											required>
											~{else}~
											disabled>
											~{/if}~
									</div>
									<div class="form-group">
										<label>~{#libMotpass1#}~</label> 
										<input name="usr_password"
											id="usr_password" type="password" class="form-control"
											~{if $_param.key 
											eq '0'}~ placeholder="~{#libMotpass1#}~"
											~{else}~ value="~{$users.usr_password}~" ~{/if}~ required>
									</div>
									<div id="verif_pwd" class="form-group">
										<label>~{#libMotpass2#}~</label> 
										<input name="usrpwd" id="usrpwd"
											type="password" class="form-control" ~{if $_param.key
											eq '0'}~ placeholder="~{#libMotpass2#}~"
											~{else}~ value="~{$users.usr_password}~" ~{/if}~ required>
									</div>

									~{if $smarty.session.__admin_mode__}~

									<div class="form-group">
										<label>~{#libAcces#}~</label> 
										<select name="usr_pro_id"
											id="usr_pro_id" class="selectpicker form-control" required>
											~{foreach $profiles as $profil}~ 
												~{if $smarty.session['__user_access__'] gte $profil.pro_access}~
													<option value="~{$profil.pro_id}~" 
													~{if $_param.key	neq '0'}~
														~{if $users.usr_pro_id eq $profil.pro_id}~ selected~{/if}~
													~{/if}~ >
													~{$profil.pro_name}~
													</option> 
												~{/if}~ 
											~{/foreach}~
										</select>
									</div>
									~{/if}~

									<button type="submit" class="btn">~{#btnSubmit#}~</button>

									<a class="btn btn-default" href=
									~{if $smarty.session.__admin_mode__}~
						        		"~{codeUrl('-users_list')}~"
						        	~{else}~	
						        		"~{codeUrl('index')}~"
						        	~{/if}~ >
							        ~{#btnCancel#}~
							        </a>

								</div>
								
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


