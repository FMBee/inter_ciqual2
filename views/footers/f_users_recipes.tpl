
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users_recipes.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        

		    $(document).ready(function() {
		    	
		    	//******** définitions
		    	
		    	$('.selectpicker').selectpicker({
		    		style: 'btn-warning'
		    	});
		    	
		        $('#data-ingredients').DataTable(	{
		        	
		        	responsive: true,
		        	columnDefs: [
		        	               { width: '20%', targets: [0 ] },
		        	               { width: '8%', targets: [1 ] },
		        	               { width: '9%', targets: [2,3,4,5,6,7,8,9 ] },
		        	               { width: '0%', targets: [10 ] },
		        	               { visible: false, targets: [2,3,4,5,6,7,8,9 ] },
		        	            ],
// 		        	select: {
// 		        		style : 'single'
// 		        	},
					dom: 'rtp',
// 	                pagingType: 'simple',
	                paging: false,
	                pageLength: 10,
	                ordering: false,
	                ~{include file = 'p_datatable_language.inc.tpl'}~
				});
	
		        var table1 = $('#data-ingredients').DataTable();
            	var _ing_id;
            	var _ing_name;
            	var _ing_qte;
            	var _details = false;
            	
            	$('#btn-details').click(function() {
            	
            		_details = !_details;
            		table1.columns( [2,3,4,5,6,7,8,9 ] ).visible( _details, true );
            		$('#-3').toggleClass('hidden');
            	});
            	
	            $('#data-ingredients').children('tbody').on( 'click', 'tr', function () {
	            	
	            	_ing_id			= $(this).attr('id');
	            	
	            	if (_ing_id != '-1' && _ing_id !='-2' && _ing_id !='-3') {	//lignes totaux
	            		
						_ing_name 		= $(this).find('td:eq(0)').text();
						_ing_qte 		= $(this).find('td:eq(1)').text();
						
	                    table1.$('tr.danger').removeClass('danger');
	                    $(this).addClass('danger');
		            	
		            	$('#majingredient-id')	.val( _ing_id );	
	  	            	$('#majingredient-name').val( _ing_name );
	  	            	$('#majingredient-qte')	.val( _ing_qte );
		            	$('#delingredient-id')	.val( _ing_id );	
		            	
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
						
		            	$('#addingredient-fadd').submit();
					}
					else{
						bootbox.alert({size: 'small', message: 'Veuillez saisir une quantité'});
					}
	            	
		        });
				
				$('#majingredient-majrecord').on('click', function () {

			      	_saisie = Number($('#majingredient-qte').val());
	            	
	            	if ( isNaN(_saisie) === false & _saisie > 0 ) {
	            		
		            	$('#majingredient-fmaj').submit();
					}
					else{
						bootbox.alert({size: 'small', message: 'Veuillez saisir une quantité valide'});
					}
	            	
		        });
				
	            $('#majingredient-delrecord').on('click', function() {
	            	
           			bootbox.confirm('Confirmez-vous la suppression ?',
               			function(result) {
	                        if (result) {
				            	$('#majingredient-fdel').submit();
	                        }
       				});
		        });
	            
	            $('#delrecipy').on('click', function() {
	            	
           			bootbox.confirm('<b><span style="font-size:140%">Confirmez-vous la suppression de la recette ?</span></b>',
               			function(result) {
	                        if (result) {
	                        	
				            	$('#delrecipy-form').submit();
// 	                        	window.location.href = "~{codeUrl('users_recipes-index&parammode=del_rec')}~";
	                        }
       				});
		        });

	            $('#chgrecipyname-nom').val("~{$smarty.session._recipy['rec_title']}~");
	            
	            $('#changename').on('click', function () {
	            	
      	        	$('#modal-chgrecipyname').modal({backdrop: "static", keyboard: false});
		        });
	            
				$('#chgrecipyname-chgrecord').on('click', function () {
					
					if ($('#chgrecipyname-nom').val() != '') {
						
		            	$('#chgrecipyname-fchg').submit();
					}
					else{
						bootbox.alert({size: 'small', message: 'Veuillez saisir un libellé'});
					}
	            	
		        });
				

	            $('#select-recipy').on('change', function() {
	            	
	            	$('#chg_recparamkey').val($('#select-recipy').selectpicker('val').trim());
	            	$('#selectrecipy-form').submit();
	            	
~{*            		_url = "users_recipes-users_recipes&parammode=chg_rec&paramkey=" 
	            				+$('#select-recipy').selectpicker('val').trim();
            		
					~{include file = $smarty.const.__VIEWS_FOOTERS__|cat:'f_ajax_urlcode.inc.tpl'}~
*}~		        
				});


		    });   //end of document.ready() 

    	</script>
    	

