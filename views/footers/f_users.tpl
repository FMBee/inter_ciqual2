 ~{config_load file = 'g_users.cfg' section = $smarty.session.__user_lang__}~

<script type="text/javascript">
        
   $(document).ready(function() {

		~{if $smarty.server.__app_params__.__APP_USER_LOGO__}~

		     $(".owl-carousel").owlCarousel({
			      items : 5 
			      });
		      
		     $('#list_logos').toggle();		//cache le carousel
	
			 $(".link").on('click', function(event) {
				 
				 	var _name = "~{$smarty.const.__VIEWS_IMG__}~" + 'profiles/' + $(this).attr('id').substr(5);
				 	
		    	    $('#usr_image_path').val(_name);
		    	    $('#image_aff').attr('src', _name);
	      		    $('#list_logos').toggle('slow');
		     });
		     
		~{/if}~


		$('.selectpicker').selectpicker();

		$('#fusers').formValidation( {	
			
		    framework: 'bootstrap',
		    // Feedback icons
		    icon: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		    },
		    addOns: {
		    	//marquage champs required
		        mandatoryIcon: {
		            icon: 'glyphicon glyphicon-asterisk'
		        }
		    },
		    locale: "~{$smarty.session.__user_form_lang__}~",
	
		    fields: {
		    	usr_first_name: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 60
		    			}
		    		}
		    	},
		    	usr_last_name: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 80
		    			},
// 		    			stringCase: {
// 		    				message: "~{#msgNom#}~",
// 		    				'case': 'upper'
// 		    			}
		    		}
		    	},
		    	usr_login: {
		    		validators: {
		    			stringLength: {
		    				min: 8,
		    				max: 80
		    			},
		    			regexp: {
		    				regexp: /^[a-zA-Z]{1}[a-zA-Z0-9@.\-]+$/,
		    				message: "~{#msgLogin#}~"
		    			},
		                callback: {
		                	message: "~{#vldLogin1#}~",
		                	callback: function(value, validator, $field) {
		                		return ($('#usr_password').val() != value)
		                	}
		                }
		    		}
		    	},
		    	usr_password: {
		    		validators: {
		    			stringLength: {
		    				min: 8,
		    				max: 20
		    			},
		    			regexp: {
		    				regexp: /^(?=.*\d)(?=.*[a-zA-Z]).{8,20}$/,
		    				message: "~{#msgMotpass#}~"
		    			}
		    		},
		            onSuccess: function(e, data) {
		                data.fv.revalidateField('usrpwd');
		                data.fv.revalidateField('usr_login');
		            }
		    	},
		    	usrpwd: {
		            validators: {
		                stringLength: {
		                    min: 8,
		                    max: 20
		                },
		                regexp: {
		    				regexp: /^(?=.*\d)(?=.*[a-zA-Z]).{8,20}$/,
		    				message: "~{#msgMotpass#}~"
		    			},
		                callback: {
		                	message: "~{#vldMotpass#}~",
		                	callback: function(value, validator, $field) {
		                		return ($('#usr_password').val() == value)
		                	}
		                }
		            }
		        }
		    }
		});
		

		//Boostrap-switch
		$('input[name="out_user"]').on('switchChange.bootstrapSwitch', function(event, state) {
			
					var _message = 	( $(this).is(":checked") ? "~{#msgSortie#}~" : "~{#msgRetour#}~" )+' '+
						~{if (! $smarty.server.__app_params__.__APP_USER_CREATE__)}~
							$('#usr_first_name').val()+' '+$('#usr_last_name').val();
						~{else}~
							$('#usr_login').val();
						~{/if}~

					bootbox.confirm(	_message,
					    				function(result) {
											if (! result) {
												
												$('input[name="out_user"]').bootstrapSwitch('toggleState', true);	//on repositionne le switch
											}
					});
	    });

		$('#verif_pwd').hide();
		
		$('#usr_password').on( 'focus', function() {
			
			$('#usr_password').val('');
			$('#usrpwd').val('');
			$('#verif_pwd').show();
		});
		
		$('#usr_login').on(	'change', function() {

				var _valeur = $('#usr_login').val();
				var _defaut = $('#usr_login').prop('defaultValue');

				if (_valeur != _defaut) { //l'utilisateur a retapé le même login ! ne pas le chercher... il existe
				
					//appel Ajax pour test du login choisi
				     $.getJSON(
				          "~{$smarty.const.__CONTROLLERS_AJAX__}~x_testlog.php",
				          {login : _valeur},
				          function(data) 
				          {  
				        	  if(data.exist == 'true')
				        	  {
								  bootbox.alert("~{#vldLogin2#}~");
				        		  
				        		  $('#usr_login').val(_defaut);   //remet la _valeur initiale
				                  $('#fusers').formValidation('revalidateField', 'usr_login');	//revalide le champ
				        	  }
				          }       
				     );  
				}
		});
		$('#usr_login').on(	'focusout', function() {
			
			$('#usr_last_name').focus();
		});

		
   });   //end of document.ready() 


</script>