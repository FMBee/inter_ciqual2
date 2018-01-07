 ~{config_load file = 'g_parametres.cfg' section =
$smarty.session.__user_lang__}~

<script type="text/javascript">
        
   $(document).ready(function() {

		$('.calendar_date').datetimepicker({
	        language:  'fr',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			maxView: 4,
			inline: true,
            sideBySide: true,
			forceParse: 0,
			pickerPosition: "top-left"
	   		 });

		$('.calendar_date_hour').datetimepicker({
	        language:  'fr',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 0,
			maxView: 4,
			inline: true,
            sideBySide: true,
			forceParse: 0,
			pickerPosition: "top-left"
	   		 });

		$('.calendar_hour').datetimepicker({
	        language:  'fr',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 1,
			minView: 0,
			maxView: 1,
			inline: true,
            sideBySide: true,
			forceParse: 0,
			pickerPosition: "top-left"
	   		 });
		
        $(".touchspin_float").each(function()
             {
             var nbDecimals = 2;
             var step = 0.01;
             
             if ($(this).attr("data-length") != '' && $(this).attr("data-length") != '0')
             	{
              	var sLength = $(this).attr("data-length");
              	if (sLength.indexOf('.') != -1)
              		{
              		nbDecimals = sLength.substr(sLength.indexOf(','));
              		step = 1/Math.pow(10,nbDecimals);
              		}
              	else
              		{
              		nbDecimals = 0;
              		step = 1;
              		}
             	}
                  
			 $(this).TouchSpin({
	            min: -1000,
	            max: 10000,
	            step: step,
	            decimals: nbDecimals,
	            boostat: 5,
	            maxboostedstep: 10,
	            postfix: $(this).attr("data-post-fix")
	   		 	});
             });
        
        $(".touchspin_int").each(function()
                {
				 $(this).TouchSpin({
		            min: -1000,
		            max: 10000,
		            step: 1,
		            decimals: 0,
		            boostat: 5,
		            maxboostedstep: 10,
		            postfix: $(this).attr("data-post-fix")
					 });
	   		 });
   
	   //---
	   // l'evenement formValidation suivant est à recopier pour chaque onglet
	   // en modifiant l'indice -01 en -02,-03, pour valider les differents onglets/formulaires
	   //---
		$('#fparametres-01').formValidation( {	
			
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
	            	  $('#fparametres-01').data('formValidation').defaultSubmit();
	              }
		});
		
        $('#dropdown-item2').on('click', function () {
        	
            bootbox.confirm(   "~{#msgSuppr#}~",
                    			function(result) {
			                        if (result) {
			                           
			                        	window.location.href = "~{codeUrl('parametres-parametres_list&paramdrop='|cat:$_param.key|strip)}~";
			                        }
            					}
			);
        });
	
  });   //end of document.ready() 

</script>