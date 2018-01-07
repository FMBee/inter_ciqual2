 ~{config_load file = 'g_global.cfg' section =
$smarty.session.__user_lang__}~

<script type="text/javascript">

		    $(document).ready(function() {
		    	
			    var _url1 = "~{$smarty.const.__CIQUAL_API__}~~{$smarty.const.__CIQUAL_ACC1__}~"; 
// 			    var _url1 = "http://localhost/ciqual_api/ciqual_api.php?table=ingredients&where=xxx&mode=_AAC"; 
			    var _url2 = "~{$smarty.const.__CIQUAL_API__}~~{$smarty.const.__CIQUAL_ACC2__}~"; 
// 			    var _url2 = "http://localhost/ciqual_api/ciqual_api.php?table=categories&where=xxx&mode=_AAC"; 
			    var _mode_ing = true;
			    
            	$('#seek-submit').hide();
//             	$('#seek-list').hide();

		        $('#seek-introvalue').autocomplete({
		        	
		    	    serviceUrl: _url1,
		    	    minChars: 2,
		    	    showNoSuggestionNotice: true,
		    	    noSuggestionNotice : 'Aucun résultat',
	    			onInvalidateSelection: function (){
	    				
	    			        $('#seek-introvalue').val('');
			            	$('#seek-submit').hide();
			            	$('#seek-list').hide();
	    			    },
		    	    onSelect: function (suggestion) {

	  	      	        	_url = '-ingredients' +'&paramkey='+$.trim(suggestion.data)
	  	      	        						 +'&parammode='+(_mode_ing ? 'ing' : 'cat');
	  	      	        	
			                ~{include file = $smarty.const.__VIEWS_FOOTERS__|cat:'f_ajax_urlcode.inc.tpl'}~
			                
// 			            	$('#seek-submit').show();
		    	    	},
		    	    onSearchComplete: function (query, suggestions) {
		    	    	
// 							_query = suggestions[suggestions.length-1].data;	//la queryString est à la fin
		    	    	},
		    	    beforeRender: function (container) {
		    	    	
		            	if (_mode_ing) {
		            		
		            		$('#seek-list').show();
		            	}
		    	    }
		    	});
	            
// 	            $('#seek-submit').on('click', function () {
	            	
// 		        });

				$('#ingredient').on('change', function() {
				
					_mode_ing = !_mode_ing;
			    	$('#seek-introvalue').autocomplete().setOptions({ serviceUrl: _url1 });
// 	            	$('#seek-list').show();
				});
				$('#categorie').on('change', function() {
				
					_mode_ing = !_mode_ing;
			    	$('#seek-introvalue').autocomplete().setOptions({ serviceUrl: _url2 });
	            	$('#seek-list').hide();
				});
				
	            $('#seek-list').on('click', function () {
	            	
  	      	        	_url = '-ingredients_list'  +'&paramseek='+$('#seek-introvalue').val()
        											+'&parammode=ing';
  	      	        	
  	      	        	~{include file = $smarty.const.__VIEWS_FOOTERS__|cat:'f_ajax_urlcode.inc.tpl'}~
		        });


	        });   //end of document.ready() 

	        
    	</script>
