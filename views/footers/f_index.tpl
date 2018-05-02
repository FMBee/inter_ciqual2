
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        
		    $(document).ready(function() {
		    	
            	$('#addrecipe-addrecord')		.show();

            	$('#addrecipe').on('click', function () {
	            	
		            $('#addrecipe-nom').val('');
		            $('#addrecipe-ing').val('');
      	        	$('#modal-addrecipe').modal({backdrop: "static", keyboard: false});
		        });

// 				$('#addrecipe-nom').on('keyup', function () {
	            	
// 	            	$('#addrecipe-addrecord')		.show();
// 		        });

			    var _url = "~{$smarty.const.__CIQUAL_API__}~~{$smarty.const.__CIQUAL_ACC1__}~"; 
		        
	            $('#addrecipe-ing').autocomplete({
	            	
		    	    serviceUrl: _url,
		    	    minChars: 2,
		    	    showNoSuggestionNotice: true,
		    	    noSuggestionNotice : 'Aucun résultat',
	    			onInvalidateSelection: function (){
	    				
	    			        $('#addrecipe-ing').val('');
// 			            	$('#addrecipe-addrecord').hide();
	    			    },
		    	    onSelect: function (suggestion) {
		
			            	$('#addrecipe-ingcode').val( suggestion.data );	
// 			            	$('#addrecipe-addrecord').show();
		    	    	}
		    	});

				$('#addrecipe-cancel').on('click', function () {
	            	
// 	            	$('#addrecipe-addrecord')		.hide();
		        });
				
				$('#addrecipe-addrecord').on('click', function () {

    				_saisie = Number($('#addrecipe-ingqte').val());
	            	
					if ( $('#addrecipe-nom').val() != '' 
							&& $('#addrecipe-ing').val() != '' 
	            				&& ( isNaN(_saisie) === false & _saisie > 0 ) ) {				
						
						if ( $('#addrecipe-ingcode').val() == '' ) {
							
							bootbox.alert('<b><span style="font-size:130%">L\'ingrédient principal est invalide - veuillez re-sélectionner</span></b>');
						}
						else{
// 	           			bootbox.confirm('<b><span style="font-size:130%">Confirmez-vous la création ?</span></b>',
// 	                   			function(result) {
// 	    	                        if (result) {
// 						            	$('#modal-faddrecipe').submit();
// 	    	                        }
// 	           				});

			            	$('#modal-faddrecipe').submit();
						}
					}
					else{
						bootbox.alert('<b><span style="font-size:130%">Vous devez remplir les 3 champs pour créer une recette</span></b>');
					}
	            	
		        });
				
		    });   //end of document.ready() 

    	</script>
    	

