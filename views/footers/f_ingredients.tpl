
~{config_load file = 'g_ingredients.cfg' section = $smarty.session.__user_lang__}~

<script type="text/javascript">
        
   $(document).ready(function() {

	   
	   //---
	   // l'evenement formValidation suivant est à recopier pour chaque onglet
	   // en modifiant l'indice -01 en -02,-03, pour valider les differents onglets/formulaires
	   //---
		$('#fingredients-01').formValidation( {	
			
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
// 		    	cli_nom: {
// 		    		validators: {
// 		    			stringLength: {
// 		    				min: 2,
// 		    				max: 150
// 		    			}
// 		    			stringCase: {
// 		    				message: 'Veuillez saisir en majuscules',
// 		    				'case': 'upper'
// 		    			}
// 		    		}
// 		    	},
// 	           	cli_codepostal: {
// 	           		validators: {
// 	                    regexp: {
// 	                        regexp: /^[0-9]{5}$/,	
// 	                        message: "Veuillez saisir 5 chiffres"
// 	           			}
// 	           		}
// 	           	},
// 	           	cli_datenais: {
// 	           		validators: {
// 	                    date: {
// 	                        format: 'DD/MM/YYYY',
// 	                        message: 'Date valide (DD/MM/YYYY)'
// 	                    }
// 	           		}
// 	           	}
           	}
		})
	       .on('success.form.fv', function(e) {
	    	   
	              e.preventDefault();
	              _submit = true;
	              
	              // faire tests
	              
	              if (_submit) {
	            	  $('#fingredients-01').data('formValidation').defaultSubmit();
	              }
		});
		
        $('#dropdown-item2').on('click', function () {
        	
            bootbox.confirm(   "~{#msgSuppr#}~",
                    			function(result) {
			                        if (result) {
			                           
			                        	window.location.href = "~{codeUrl('ingredients-ingredients_list&paramdrop='|cat:$_param.key|strip)}~";
			                        }
            					}
			);
        });
	
  });   //end of document.ready() 

</script>