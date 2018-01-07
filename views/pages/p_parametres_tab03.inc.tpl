
<br />
<div class="row">
	<div class="col-lg-12">

		<form id="fparametres-03" method="post" role="form"
			action="~{codeUrl('parametres-index')}~">

			<input name="paramkey" id="paramkey" hidden="true"
				value="~{$_param.key}~"> ~{foreach $Parametres_parameters as
			$parameter}~

			<div class="form-group col-sm-12">

				~{if $parameter.ppa_type == 'separator'}~

				<h4>~{$parameter.ppa_name}~</h4>

				~{elseif $parameter.ppa_type != 'comment'}~ <label class="col-sm-4">~{$parameter.ppa_name}~</label>
				<div class="col-sm-8">

					~{if not isset($parameter.ppa_input_mode) ||
					$parameter.ppa_input_mode == ""}~

					<!-- input standard -->
					<input name="p_~{$parameter.ppa_id}~" id="p_~{$parameter.ppa_id}~"
						~{if
						isset($parameter.ppv_value)}~
										       		value="~{$parameter.ppv_value}~"
						~{else}~
										       		value="~{$parameter.ppa_default}~"
						~{/if}~
										       placeholder="~{$parameter.ppa_placeholder}~"
						class="form-control" ~{if $parameter.ppa_required !=0}~required
										       ~{/if}~
										 >

					~{else}~ ~{if $parameter.ppa_input_mode eq "textarea"}~
					<textarea id="p_~{$parameter.ppa_id}~"
						name="p_~{$parameter.ppa_id}~" class="form-control"
						style="height: 100px;"
						placeholder="~{$parameter.ppa_placeholder}~"
						~{if $parameter.ppa_required !=0}~required
													      ~{/if}~
												>
												~{if isset($parameter.ppv_value)}~
													~{$parameter.ppv_value}~
												~{else}~
													~{$parameter.ppa_default}~
												~{/if}~
												</textarea>

					~{elseif $parameter.ppa_input_mode eq "list"}~ <select
						name="p_~{$parameter.ppa_id}~" id="p_~{$parameter.ppa_id}~"
						class="selectpicker form-control"> ~{assign
						var="tabOptions" value="|"|explode:$parameter.ppa_values_list}~
						~{foreach $tabOptions as $option}~
						<option value="~{$option}~" ~{if $option==$parameter.ppv_value}~selected~{/if}~
												      		>
												      		~{$option}~
												      		</option>
						~{/foreach}~
					</select> ~{elseif $parameter.ppa_input_mode eq "calendar"}~
					<div id="div_~{$parameter.ppa_id}~"
						class="input-group date form_date col-sm-6 ~{$parameter.ppa_input_mode}~_~{$parameter.ppa_type}~"
						~{if $parameter.ppa_type==
						'date'}~
															data-date-format="dd/mm/yyyy"
						data-link-format="dd/mm/yyyy" ~{elseif $parameter.ppa_type==
						'date_hour'}~
															data-date-format="dd/mm/yyyy hh:ii"
						data-link-format="dd/mm/yyyy hh:ii" ~{elseif $parameter.ppa_type==
						'hour'}~
															data-date-format="hh:ii"
						data-link-format="hh:ii"
						~{/if}~
														data-link-field="p_~{$parameter.ppa_id}~">
						<input class="form-control my_pointer" type="text" ~{if
							isset($parameter.ppv_value)}~
													       		value="~{$parameter.ppv_value}~"
							~{else}~
													       		value="~{$parameter.ppa_default}~"
							~{/if}~
															 readonly> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
					<input type="hidden" id="p_~{$parameter.ppa_id}~"
						name="p_~{$parameter.ppa_id}~" ~{if
						isset($parameter.ppv_value)}~
																       		value="~{$parameter.ppv_value}~"
						~{else}~
																       		value="~{$parameter.ppa_default}~"~{/if}~>

					~{elseif $parameter.ppa_input_mode eq "touchspin"}~ <input
						name="p_~{$parameter.ppa_id}~" id="p_~{$parameter.ppa_id}~" ~{if
						isset($parameter.ppv_value)}~
												       		value="~{$parameter.ppv_value}~"
						~{else}~
												       		value="~{$parameter.ppa_default}~"
						~{/if}~
												       class="form-control ~{$parameter.ppa_input_mode}~_~{$parameter.ppa_type}~"
						data-post-fix="~{$parameter.ppa_placeholder}~"
						data-length="~{$parameter.ppa_length}~"
						style="text-align: center;"> ~{/if}~ ~{/if}~
				</div>
				~{/if}~

				<div class="form_group hidden">
					<label>~{#par_societe#}~</label><input name="par_societe"
						id="par_societe" class="form-control" autofocus~{if $_param.key
						eq "0"}~ placeholder="~{#par_societe#}~"
						~{else}~ value="~{$Parametres.par_societe}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_rue#}~</label><input name="par_rue" id="par_rue"
						class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_rue#}~"
						~{else}~ value="~{$Parametres.par_rue}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_complement#}~</label><input name="par_complement"
						id="par_complement" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_complement#}~"
						~{else}~ value="~{$Parametres.par_complement}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_codepostal#}~</label><input name="par_codepostal"
						id="par_codepostal" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_codepostal#}~"
						~{else}~ value="~{$Parametres.par_codepostal}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_ville#}~</label><input name="par_ville"
						id="par_ville" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_ville#}~"
						~{else}~ value="~{$Parametres.par_ville}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_pays#}~</label><input name="par_pays" id="par_pays"
						class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_pays#}~"
						~{else}~ value="~{$Parametres.par_pays}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_email#}~</label><input name="par_email"
						id="par_email" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_email#}~"
						~{else}~ value="~{$Parametres.par_email}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_responsable#}~</label><input name="par_responsable"
						id="par_responsable" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_responsable#}~"
						~{else}~ value="~{$Parametres.par_responsable}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_telephone#}~</label><input name="par_telephone"
						id="par_telephone" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_telephone#}~"
						~{else}~ value="~{$Parametres.par_telephone}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_mobile#}~</label><input name="par_mobile"
						id="par_mobile" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_mobile#}~"
						~{else}~ value="~{$Parametres.par_mobile}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_siret#}~</label><input name="par_siret"
						id="par_siret" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_siret#}~"
						~{else}~ value="~{$Parametres.par_siret}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_codenaf#}~</label><input name="par_codenaf"
						id="par_codenaf" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_codenaf#}~"
						~{else}~ value="~{$Parametres.par_codenaf}~"~{/if}~ >
				</div>
				<div class="form_group hidden">
					<label>~{#par_iban#}~</label><input name="par_iban" id="par_iban"
						class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_iban#}~"
						~{else}~ value="~{$Parametres.par_iban}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param1#}~</label><input name="par_param1"
						id="par_param1" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param1#}~"
						~{else}~ value="~{$Parametres.par_param1}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param2#}~</label><input name="par_param2"
						id="par_param2" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param2#}~"
						~{else}~ value="~{$Parametres.par_param2}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param3#}~</label><input name="par_param3"
						id="par_param3" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param3#}~"
						~{else}~ value="~{$Parametres.par_param3}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param4#}~</label><input name="par_param4"
						id="par_param4" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param4#}~"
						~{else}~ value="~{$Parametres.par_param4}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param5#}~</label><input name="par_param5"
						id="par_param5" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param5#}~"
						~{else}~ value="~{$Parametres.par_param5}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param6#}~</label><input name="par_param6"
						id="par_param6" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param6#}~"
						~{else}~ value="~{$Parametres.par_param6}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param7#}~</label><input name="par_param7"
						id="par_param7" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param7#}~"
						~{else}~ value="~{$Parametres.par_param7}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param8#}~</label><input name="par_param8"
						id="par_param8" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param8#}~"
						~{else}~ value="~{$Parametres.par_param8}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_param9#}~</label><input name="par_param9"
						id="par_param9" class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_param9#}~"
						~{else}~ value="~{$Parametres.par_param9}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_tmp1#}~</label><input name="par_tmp1" id="par_tmp1"
						class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_tmp1#}~"
						~{else}~ value="~{$Parametres.par_tmp1}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_tmp2#}~</label><input name="par_tmp2" id="par_tmp2"
						class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_tmp2#}~"
						~{else}~ value="~{$Parametres.par_tmp2}~"~{/if}~ >
				</div>
				<div class="form-group hidden">
					<label>~{#par_tmp3#}~</label><input name="par_tmp3" id="par_tmp3"
						class="form-control" ~{if $_param.key
						eq "0"}~ placeholder="~{#par_tmp3#}~"
						~{else}~ value="~{$Parametres.par_tmp3}~"~{/if}~ >
				</div>
			</div>
			~{/foreach}~ </br>
			<button type="submit" class="btn">~{#btnSubmit#}~</button>

			<a class="btn btn-default" href="~{codeUrl(precPage())}~">
				~{#btnCancel#}~ </a>

		</form>
	</div>
</div>
