<?php

	$url = __CIQUAL_API__ .'?table=alim&where=' .$_param['seek'];
	
	$data = json_decode( file_get_contents($url), true );

// debug($data);
	$oSmarty->assign('Ingredients', $data);
