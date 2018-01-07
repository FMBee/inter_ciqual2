<?php

	$url = __CIQUAL_API__ .'?table=ingredients&where=' .$_param['seek'];
	
	$data = json_decode( file_get_contents($url), true );

debug($data);
	$oSmarty->assign('Ingredients', $data);
