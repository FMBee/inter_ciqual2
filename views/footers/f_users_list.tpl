 ~{config_load file = 'g_global.cfg' section =
$smarty.session.__user_lang__}~

<script type="text/javascript">
        
		    $(document).ready(function() {
		    	
		        $('#data-users').DataTable(	{
		            dom:
		            "<'row'<'col-sm-12'tr>>" +
		            "<'row'<'col-sm-5'i><'col-sm-7'p>>",

	                pagingType: "simple",
	                "pageLength": 10,
	                "columnDefs": [
	                                 { "visible": false, "targets": [ 3, 4, 5 ] } //dates
	                                ],
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
	            var table = $('#data-users').DataTable();
				var _affTous = false;
				
				table.columns(5).search('IN').draw();

				$('.table').children('tbody').on( 'click', 'tr', function () {

      	        	_url = '-users&paramkey='+$(this).attr('id');
      	        	
	                ~{include file = $smarty.const.__VIEWS_FOOTERS__|cat:'f_ajax_urlcode.inc.tpl'}~

	            });

	            $('#dropdown-item1').on('click', function() {
	            	
	            	_affTous = (! _affTous);
	            	
	            	table.columns([3, 4]).visible(_affTous);
					table.columns(5).search(_affTous ? '' : 'IN').draw();
					
					$(this).children('i').toggleClass('fa-check-square-o');
					$(this).children('i').toggleClass('fa-square-o');
		        });
		        	
	        });   //end of document.ready() 

    	</script>

