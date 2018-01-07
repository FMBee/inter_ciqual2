<?php

// 		$url = __CIQUAL_API__ .'?table=ingredients&where=_KEY&order=ihe_id&values=yes&key=' .$_param['key'];

// 		$data = json_decode( file_get_contents($url), true );
// debug($data);
	
// 	$oSmarty->assign('allClients', 		SejoursClients::getAll				($pdo, $param['paramkey']));
// 	$oSmarty->assign('paramindex', 		( isset($param['paramindex']) ? $param['paramindex'] : '0' ) );		// repositionnement sur client
// 	$oSmarty->assign('addClients', 		Clients::getAllIn	($pdo));

	$curr_id = (! isset($_param['key'])) ? '1' : $_param['key'];
	
	$data0 = array(
			array(
					'rci_id'		=> '1',
					'rci_name'		=> 'Ma recette n°1'	
			),	
			array(
					'rci_id'		=> '2',
					'rci_name'		=> 'Ma recette n°2'	
			)
	);
	$data1 = array(
			
			array(
					'ing_id'          => 10,
					'ing_name'        => 'First one',
					'ing_qte'         => 12,
					'ing_col1'        => 2.5,
					'ing_col2'        => 3,
					'ing_col3'        => 2,
					'ing_col4'        => 5,
					'ing_col5'        => 6.5,
					'ing_col6'        => 1,
					'ing_col7'        => 8,
					'ing_col8'        => 9,
					'ing_col9'        => 10
			),
			array(
					'ing_id'          => 12,
					'ing_name'        => 'Second one',
					'ing_qte'         => 27,
					'ing_col1'        => 2.5,
					'ing_col2'        => 31,
					'ing_col3'        => 22,
					'ing_col4'        => 5.4,
					'ing_col5'        => 6.5,
					'ing_col6'        => 12,
					'ing_col7'        => 88,
					'ing_col8'        => 1,
					'ing_col9'        => 10
			)
	);
	if ($_param['mode'] == 'add') {
		
		$data1[] = $data1[1];
		$data1[count($data1)-1]['ing_name'] = $_param['addkey'];
	}
	
	$data2 = array(
			
			array(
					'ing_id'          => 10,
					'ing_name'        => 'Third one',
					'ing_qte'         => 12,
					'ing_col1'        => 2.5,
					'ing_col2'        => 3,
					'ing_col3'        => 2,
					'ing_col4'        => 5,
					'ing_col5'        => 6.5,
					'ing_col6'        => 1,
					'ing_col7'        => 8,
					'ing_col8'        => 9,
					'ing_col9'        => 10
			),
			array(
					'ing_id'          => 12,
					'ing_name'        => 'Fourth one',
					'ing_qte'         => 2,
					'ing_col1'        => 2.5,
					'ing_col2'        => 31,
					'ing_col3'        => 2,
					'ing_col4'        => 5.4,
					'ing_col5'        => 6.5,
					'ing_col6'        => 12,
					'ing_col7'        => 8,
					'ing_col8'        => 1,
					'ing_col9'        => 10
			)
	);
	
	$data = ${'data'.$curr_id};
	
	$oSmarty->assign('curr_id', $curr_id);
	$oSmarty->assign('Ingredients', $data);
	$oSmarty->assign('Recipes', $data0);
	