
~{config_load file = 'g_users.cfg' section = 'fr'}~

<script type="text/javascript">
        
   $(document).ready(function() {


		$('#frecovery').formValidation( {	
			
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
		    locale: "fr_FR",
	
		    fields: {
		    	code: {
		    		validators: {
		    			integer: {
		    				message: "Veuillez taper un nombre"
		    			}
		    		}
		    	},
		    	password: {
		    		validators: {
		    			stringLength: {
		    				min: 8,
		    				max: 15
		    			},
		    			regexp: {
		    				regexp: /^(?=.*\d)(?=.*[a-zA-Z]).{8,15}$/,
		    				message: "~{#msgMotpass#}~"
		    			}
		    		},
		            onSuccess: function(e, data) {
		                data.fv.revalidateField('password2');
		            }
		    	},
		    	password2: {
		            validators: {
		                stringLength: {
		                    min: 8,
		                    max: 15
		                },
		                regexp: {
		    				regexp: /^(?=.*\d)(?=.*[a-zA-Z]).{8,15}$/,
		    				message: "~{#msgMotpass#}~"
		    			},
		                callback: {
		                	message: "~{#vldMotpass#}~",
		                	callback: function(value, validator, $field) {
		                		return ($('#password').val() == value)
		                	}
		                }
		            }
		        }
		    }
		});
		
   });   //end of document.ready() 


</script>