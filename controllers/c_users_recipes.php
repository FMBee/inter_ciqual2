<?php

	$recipy = Recipies::getOne($pdo, $_SESSION['_recipy']['rec_id']);
debug($recipy);	
	$data = array();
	$include = array_keys($_SESSION['_elements']);
	
	foreach ($recipy as $ingredient) {
		
		$url = __CIQUAL_API__ .'?table=alim&where=_KEY&order=const_code&values=yes&key=' .$ingredient['rel_code'];
		
		$nutriments = json_decode( file_get_contents($url), true );
		$result = array();
		
		foreach ($nutriments as $nutriment) {
			
			if ( in_array(trim($nutriment['const_code']), $include, false) ) {
				
				$result[] = $nutriment;
			}
		}
		$resultOrd = array();
		
		foreach ($include as $code) {
			
			foreach ($result as $nutriment) {
				
				if ( $nutriment['const_code'] == $code ) {
					
					$resultOrd[] = $nutriment;
				}
			}
		}
		
		$table = array(	'rel_id' => $ingredient['rel_id'],
						'rel_qte' => $ingredient['rel_qte']);
		$table[] = $resultOrd;
		$data[] = $table;
	}
debug($data);	

	$oSmarty->assign('Ingredients', $data);
	
/* $data
    [0] => Array
        (
            [rel_qte] => 15
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
            [rel_qte] => 8.5
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
	