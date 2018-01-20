
 ~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

	<script type="text/javascript">
        
	    $(document).ready(function() {
	    	
	        $('#data-documents').DataTable(	{
	            dom: 'ftp',
                pagingType: "numbers",
                "pageLength": 10,
                ~{include file="p_datatable_language.inc.tpl"}~
			});

        });   //end of document.ready() 

   	</script>

