
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        
		    $(document).ready(function() {
		    	
            	$('#addrecipe-addrecord')		.hide();

            	$('#addrecipe').on('click', function () {
	            	
		            $('#addrecipe-nom').val('');
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
			            	$('#addrecipe-addrecord').hide();
	    			    },
		    	    onSelect: function (suggestion) {
		
			            	$('#addrecipe-ingcode').val( suggestion.data );	
			            	$('#addrecipe-addrecord').show();
		    	    	}
		    	});

				$('#addrecipe-cancel').on('click', function () {
	            	
	            	$('#addrecipe-addrecord')		.hide();
		        });
				
				$('#addrecipe-addrecord').on('click', function () {
					
					if ($('#addrecipe-nom').val() != '' && $('#addrecipe-ing').val() != '') {
						
	           			bootbox.confirm('Confirmez-vous la création ?',
	                   			function(result) {
	    	                        if (result) {
						            	$('#modal-faddrecipe').submit();
	    	                        }
	           				});
					}
					else{
						bootbox.alert('Un des champs est vide !');
					}
	            	
		        });
				
		    });   //end of document.ready() 

    	</script>
    	

