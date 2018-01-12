<?php

// 		$url = __CIQUAL_API__ .'?table=ingredients&where=_KEY&order=ihe_id&values=yes&key=' .$_param['key'];

// 		$data = json_decode( file_get_contents($url), true );
// debug($data);
	
// 	$oSmarty->assign('allClients', 		SejoursClients::getAll				($pdo, $param['paramkey']));
// 	$oSmarty->assign('paramindex', 		( isset($param['paramindex']) ? $param['paramindex'] : '0' ) );		// repositionnement sur client
// 	$oSmarty->assign('addClients', 		Clients::getAllIn	($pdo));

// 	$curr_id = (! isset($_param['key'])) ? '1' : $_param['key'];
	
// 	if ($_param['mode'] == 'add') {
		
// 		$data1[] = $data1[1];
// 		$data1[count($data1)-1]['ing_name'] = $_param['addkey'];
// 	}

	$recipy = array(
			array('rec_code' => '1001', 'rec_qte' => '15'),
			array('rec_code' => '1002', 'rec_qte' => '8.5'),
	);
	
	$data = array();
	
	foreach ($recipy as $ingredient) {
		
		$url = __CIQUAL_API__ .'?table=alim&where=_KEY&order=const_code&values=yes&key=' .$ingredient['rec_code'];
		$table = array('rec_qte' => $ingredient['rec_qte']);
		$table[] = json_decode( file_get_contents($url), true );
		$data[] = $table;
	}
debug($data);	
	$oSmarty->assign('Ingredients', $data);
// 	$oSmarty->assign('curr_id', $curr_id);
// 	$oSmarty->assign('Recipes', $data0);
	
/* $data
    [0] => Array
        (
            [rec_qte] => 15
            [0] => Array
                (
                    [0] => Array
                        (
                            [alim_code] =>  1001 
                            [alim_nom_fr] =>  Eau de vie 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Eau de vie  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10000 
                            [const_nom_fr] =>  Cendres (g/100g) 
                            [teneur] =>  0,0091 
                        )

                    [1] => Array
                        (
                            [alim_code] =>  1001 
                            [alim_nom_fr] =>  Eau de vie 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Eau de vie  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10004 
                            [const_nom_fr] =>  Sel chlorure de sodium (g/100g) 
                            [teneur] =>  0,0025 
                        )

                    [2] => Array
                        (
                            [alim_code] =>  1001 
                            [alim_nom_fr] =>  Eau de vie 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Eau de vie  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10110 
                            [const_nom_fr] =>  Sodium (mg/100g) 
                            [teneur] =>  1 
                        )

                    [3] => Array
                        (
                            [alim_code] =>  1001 
                            [alim_nom_fr] =>  Eau de vie 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Eau de vie  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10120 
                            [const_nom_fr] =>  Magnésium (mg/100g) 
                            [teneur] =>  0 
                        )
                 .......       
    [1] => Array
        (
            [rec_qte] => 8.5
            [0] => Array
                (
                    [0] => Array
                        (
                            [alim_code] =>  1002 
                            [alim_nom_fr] =>  Gin 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Gin  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10000 
                            [const_nom_fr] =>  Cendres (g/100g) 
                            [teneur] =>  0,0052 
                        )

                    [1] => Array
                        (
                            [alim_code] =>  1002 
                            [alim_nom_fr] =>  Gin 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Gin  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10004 
                            [const_nom_fr] =>  Sel chlorure de sodium (g/100g) 
                            [teneur] =>  0,005 
                        )

                    [2] => Array
                        (
                            [alim_code] =>  1002 
                            [alim_nom_fr] =>  Gin 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Gin  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10110 
                            [const_nom_fr] =>  Sodium (mg/100g) 
                            [teneur] =>  2 
                        )

                    [3] => Array
                        (
                            [alim_code] =>  1002 
                            [alim_nom_fr] =>  Gin 
                            [alim_grp_code] => 06-0603-060304
                            [alim_n
          ......
 * 
 * 
 */
	