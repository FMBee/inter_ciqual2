<?php

// 	if ($_param['mode'] == 'cat') {		//recherche d'une catégorie
		
// 		$url = __CIQUAL_API__ .'?table=alim&where=_CAT&key=' .$_param['key'];
// 		$data = json_decode( file_get_contents($url), true );
// 		$oSmarty->assign('Ingredients', $data);
// 		$_GET['page'] = 'ingredients_list'; 	//redirection
// 	}
// 	else{
		
		$url = __CIQUAL_API__ .'?table=alim&where=_KEY&values=yes&key=' .'%20'.trim($_param['key']);	//attention à ce p... d'espace dans alim_code !
		$data = json_decode( file_get_contents($url), true );
// debug($data);
		$oSmarty->assign('Ingredients', $data);
	
	

	