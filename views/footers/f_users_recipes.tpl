
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users_recipes.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        

		    $(document).ready(function() {
		    	
		    	//******** définitions
		    	
		    	$('.selectpicker').selectpicker({
		    		width: '50%',
		    		style: 'btn-info'
		    	});
		    	
		    	$('#select_recipes').on('change', function() {
		    		
      	        	_url = '-users_recipes&parammode=show&paramkey='+$(this).val();
      	        	
	                ~{include file = $smarty.const.__VIEWS_FOOTERS__|cat:'f_ajax_urlcode.inc.tpl'}~

		    	});
		    	
		        $('#data-ingredients').DataTable(	{
		        	"responsive": true,
		        	"columnDefs": [
		        	               { "width": "5%", "targets": [0 ] }
		        	            ],
// 		        	select		: {
// 		        		style : 'single'
// 		        	},
					"dom"		: 'rtp',
// 	                "pagingType": "simple",
	                "paging": false,
	                "pageLength": 10,
	                "ordering"	: false,
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
		        var table1 = $('#data-ingredients').DataTable();
            	var _ing_id;
            	var _ing_name;
            	var _ing_qte;
		        
	            $('#data-ingredients').children('tbody').on( 'click', 'tr', function () {
	            	
	            	_ing_id			= $(this).attr('id');
	            	
	            	if (_ing_id != '-1' && _ing_id !='-2') {	//lignes totaux
	            		
						_ing_name 		= $(this).find('td:eq(1)').text();
						_ing_qte 		= $(this).find('td:eq(2)').text();
						
	                    table1.$('tr.danger').removeClass('danger');
	                    $(this).addClass('danger');
		            	
		            	$('#majingredient-id')	.val( _ing_id );	
	  	            	$('#majingredient-name').val( _ing_name );
	  	            	$('#majingredient-qte')	.val( _ing_qte );
		            	
	      	        	$('#modal-majingredient').modal({backdrop: "static", keyboard: false});
	            	}
	            });


	            $('#addingredient').on('click', function () {
	            	
		            $('#addingredient-introvalue').val('');
      	        	$('#modal-addingredient').modal({backdrop: "static", keyboard: false});
		        });
//             	$('#addingredient').trigger('click');	//OK: à placer après le eventListener !

			    var _url = "~{$smarty.const.__CIQUAL_API__}~~{$smarty.const.__CIQUAL_ACC1__}~"; 
            	$('#addingredient-addrecord')		.hide();
		        
	            $('#addingredient-introvalue').autocomplete({
	            	
		    	    serviceUrl: _url,
		    	    minChars: 2,
		    	    showNoSuggestionNotice: true,
		    	    noSuggestionNotice : 'Aucun résultat',
	    			onInvalidateSelection: function (){
	    				
	    			        $('#addingredient-introvalue').val('');
			            	$('#addingredient-addrecord').hide();
	    			    },
		    	    onSelect: function (suggestion) {
		
			            	$('#addingredient-code').val( suggestion.data );	
			            	$('#addingredient-addrecord').show();
		    	    	}
		    	});
				$('#addingredient-cancel').on('click', function () {
	            	
	            	$('#addingredient-addrecord')		.hide();
		        });
				$('#addingredient-addrecord').on('click', function () {
					
					if ($('#addingredient-qte').val() != 0) {
						
		            	$('#modal-faddingredient').submit();
					}
					else{
						bootbox.alert({size: 'small', message: 'Veuillez saisir une quantité'});
					}
	            	
		        });
				
				$('#majingredient-majrecord').on('click', function () {

			      	_saisie = Number($('#majingredient-qte').val());
	            	
	            	if ( isNaN(_saisie) === false & _saisie > 0 ) {
	            		
		            	$('#modal-fmajingredient').submit();
					}
					else{
						bootbox.alert({size: 'small', message: 'Veuillez saisir une quantité valide'});
					}
	            	
		        });

~{*
				// chargement des valeurs POST
	            $('#addingredient-paramsejour')			.val("~{$paramkey}~");
	            $('#addingredient-paramsejourname')		.val("~{$paramname}~");
                $('#modal-supingredient-paramsejour')			.val("~{$paramkey}~");
                $('#modal-supingredient-paramsejourname')		.val("~{$paramname}~");
            	
            	
            	
            	//********* ingredients
            	
            	
		    	// replacement sur le ingredient courant
            	$('#data-ingredients').children('tbody').find("tr:eq(~{$paramindex|strip}~)").click();

	            
      	        
	            $('#supingredient').on('click', function() {
	            	
// 	            	$('#modal-supingredient').modal( {backdrop: "static", keyboard: false} );
           			
           			bootbox.confirm('Etes-vous sûr ?',
               			function(result) {
	                        if (result) {
	                           
				            	$('#modal-fsupingredient').submit();
	                        }
       					});
		        });


			    
// 			    $('#sk-prenom').on('change', function() {
			    	
// 			    	_reg = new RegExp("cli_prenom=false|cli_prenom=true", "g");
// 			    	_url = _url.replace(_reg, 'cli_prenom='+$(this).is(":checked"));
// 			    	$('#addingredient-introvalue').autocomplete().setOptions({ serviceUrl: _url });
//    			        $('#addingredient-introvalue').val('');
//    			        $('#addingredient-introvalue').focus();
// 			    });
// 	            $('#data-addingredient').children('tbody').on( 'click', 'tr', function () {

//                     table3.$('tr.danger').removeClass('danger');
//                     $(this).addClass('danger');
                    
// 	            	$('#addingredient-addrecord').show();
// 	            	$('#addingredient-paramingredient').val( $(this).attr('id') );	
// 	            });
	            
	            
// 	            $('#modal-supingredient-yes').on('click', function () {
	            	
// 	            	$('#modal-fsupingredient').submit();
// 		        });
*}~		        

		    });   //end of document.ready() 

    	</script>
    	

