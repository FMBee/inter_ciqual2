~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">

		    $(document).ready(function() {
		    	
		        var table = $('#data-ingredients').DataTable(	{
		        	
		            dom: "<'row'<'col-sm-4'l><'col-sm-4'B><'col-sm-4'f>>" +
		            "<'row'<'col-sm-12'tr>>" +
		            "<'row'<'col-sm-5'i><'col-sm-7'p>>",
// mode Scroll
// 		            dom: "<'row'<'col-sm-6'B><'col-sm-6'f>>" +
// 		            "<'row'<'col-sm-12'tr>>" +
// 		            "<'row'<'col-sm-5'i>>",
		            
		            buttons: [
// mode Scroll
// 		                      { name: 'top', 
// 		                    	text: 'Début',
// 		                    	action: function(e, dt) {
// 		                    		dt.row('tr:eq(0)').scrollTo();
// 		                    	}
// 		                      },
// 		                      { name: 'end', 
// 		                    	text: 'Fin',
// 		                    	action: function(e, dt) {
// 		                    		dt.row('tr:eq(' + (dt.rows().count()-1) + ')').scrollTo();
// 		                    	}
// 		                      },
		                      { extend: 'pdfHtml5', 
			                    	text: 'PDF',
			                    	title: $('#table-title').html(),
			                    	exportOptions: {
			                                columns: ':visible'
			                            }
			                      },
					],
		        	responsive: true,
// mode Scroll		        	
// 		        	responsive: 	false,
// 		        	scroller: 		true,
// 		        	deferRender: 	true,
// 		            scrollY: 		"400px",
// 		            scrollX:		true,
// 		            scrollCollapse: true,

		        	select:		false,
	                pagingType: 'full_numbers',
	                pageLength: 10,
	                
	                ~{include file='p_datatable_language.inc.tpl'}~
				});
		    	
		    	var _clicFirstCol = false;
	            
		        $('#data-ingredients tbody').children('tr').on( 'click', 'td:eq(0)', function () {

	            	_clicFirstCol = true;
	            }); 
	               
	            $('#data-ingredients').children('tbody').on( 'click', 'tr', function () {

	            	if ( _clicFirstCol && $('#data-ingredients').hasClass('collapsed') ) {		//responsive: affichage des colonnes cachees
	
	            		_clicFirstCol = false;
	            	}
	            	else{
								
  	      	        	_url = '-ingredients&parammode=ing&paramkey='+$(this).attr('id');
  	      	        	
		                ~{include file = $smarty.const.__VIEWS_FOOTERS__|cat:'f_ajax_urlcode.inc.tpl'}~

   	                }
	            	
	            });
	            
	            $('#dropdown-item2').on( 'click', function () {
	            	
//	            	 pdfMake.createPdf({ content: 'This is an sample PDF printed with pdfMake' }).download();
	            });
	            
		        table.columns.adjust().draw();

	        });   //end of document.ready() 

    	</script>