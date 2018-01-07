
   	$.ajax({
   			
		url: "~{$smarty.const.__CONTROLLERS_AJAX__}~x_urlcode.php", 
		dataType: "json",
		data: 
	        {
        	url : _url
          	},
       	success: function(data)
       		{
         	window.location.href = data.retour;
      		}
     });