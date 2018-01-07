<?php

	if ($_param['mode'] == 'cat') {		//recherche d'une catégorie
		
		$url = __CIQUAL_API__ .'?table=ingredients&where=_CAT&key=' .$_param['key'];

		$data = json_decode( file_get_contents($url), true );
debug($data);
		$oSmarty->assign('Ingredients', $data);
		
		$_GET['page'] = 'ingredients_list'; 	//redirection
	}
	else{
		$url = __CIQUAL_API__ .'?table=ingredients&where=_KEY&order=ihe_id&values=yes&key=' .$_param['key'];

		$data = json_decode( file_get_contents($url), true );
debug($data);
		$oSmarty->assign('Ingredients', $data);

// 		$results = array();
// 		$results[] = $data[0]['ing_code'];
// 		$results[] = $data[0]['ing_name'];
// 		$results[] = $data[0]['catcode'];
// 		$results[] = $data[0]['cat_name'];
// 		$results['values'] = array();
		
// 		foreach ($data as $array) {
			
// 			$results['values'][] = array( 	'ihe_id' => $array['ihe_id'],
// 											'ihe_name' => $array['ihe_name'],
// 											'ihe_id' => $array['ihe_id'],
// 			)
// 		}
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

	