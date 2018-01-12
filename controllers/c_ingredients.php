<?php

	if ($_param['mode'] == 'cat') {		//recherche d'une catégorie
		
		$url = __CIQUAL_API__ .'?table=alim&where=_CAT&key=' .$_param['key'];
		$data = json_decode( file_get_contents($url), true );
		$oSmarty->assign('Ingredients', $data);
		$_GET['page'] = 'ingredients_list'; 	//redirection
	}
	else{
		$url = __CIQUAL_API__ .'?table=alim&where=_KEY&order=const_code&values=yes&key=' .$_param['key'];
		$data = json_decode( file_get_contents($url), true );
debug($data);
		$oSmarty->assign('Ingredients', $data);
	}
	
	
	
// 	[ing_code] => 36100
// 	[ing_cat_code] => 10
// 	[ing_name] => Caille, viande et peau, crue
// 	[cat_code] => 10
// 	[cat_name] => Volailles
// 	[iva_ing_code] => 36100
// 	[iva_ihe_id] => 53
// 	[iva_value] => -
// 	[ihe_id] => 53
// 	[ihe_name] => Vitamine K2 (

	