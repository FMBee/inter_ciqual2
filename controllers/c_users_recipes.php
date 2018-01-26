<?php

	$recipy = Recipes::getOne($pdo, $_SESSION['_recipy']['rec_id']);
//debug($recipy);	
	$include = array_keys($_SESSION['_elements']);
	
	$totalqte = 0;
	foreach ( $include as $code )		{ $totaux[$code] = 0; }
	$data = array();

	foreach ( $recipy as $ingredient ) {
		
		$url = __CIQUAL_API__ .'?table=alim&where=_KEY&values=yes&key=' .'%20'.trim($ingredient['rel_code']);	//attention à ce p... d'espace dans alim_code !
debug($url);		
		$nutriments = json_decode( file_get_contents($url), true );
debug($nutriments);			
		$result = array();
		
		foreach ( $nutriments as $nutriment ) {
debug($nutriment);			
			if ( in_array(trim($nutriment['const_code']), $include, false) ) {
				
				$result[] = $nutriment;
			}
		}

		$resultOrd = array();
		
		foreach ( $include as $code ) {
			
			foreach ( $result as $nutriment ) {
				
				if ( $nutriment['const_code'] == $code ) {
					
					$resultOrd[] = $nutriment;
					$totaux[$code] += floatval($ingredient['rel_qte']) / 100 * myFloatval($nutriment['teneur']);
					specialTest($code, $totaux);
				}
			}
		}
		$totalqte += $ingredient['rel_qte'];
		$table = array(	'rel_id' => $ingredient['rel_id'],
						'rel_qte' => $ingredient['rel_qte']);
		$table[] = $resultOrd;
		$data[] = $table;
	}
// debug($data);	

	$label = $_SESSION['_formats']['T'];
	
	foreach ( $totaux as $code => $teneur ) {
		
		$label .= 	$_SESSION['_elements'][$code]['label'].
					calculSeuil($code, ( $teneur * 100 / $totalqte )).
					$_SESSION['_elements'][$code]['unit'].
					$_SESSION['_elements'][$code]['sep'];
	}
	Recipes::majOrAdd($pdo, array(
								$_SESSION['_recipy']['rec_id'],
								$_SESSION['_recipy']['rec_title'],
								$label,
								'-',
							)
	);
	
	$oSmarty->assign('Ingredients', $data);
	$oSmarty->assign('Totaux', $totaux);
	$oSmarty->assign('Totalqte', $totalqte);
	$oSmarty->assign('Etiquette', $label);
	$oSmarty->assign('Recettes', Recipes::getAll($pdo));

	
	function calculSeuil($code, $teneur) {
		
		$seuils = $_SESSION['_seuils'][$_SESSION['_elements'][$code]['bot']];
		$value = '';
		
		if ( !is_null($seuils) ) {
		
			if ( $teneur >= floatval($seuils['min'])
					&& $teneur <= floatval($seuils['max']) ) {
				
				$value = $seuils['label'];
			}
		}
		if ( empty($value) ) {
			
			$value = sprintf($_SESSION['_arrondis'][$_SESSION['_elements'][$code]['rnd']], $teneur);
		}
 	
		return $value;
	}
	
	function specialTest($code, &$totaux) {
		
		if ( $code = '32000' && ( $totaux['32000'] > $totaux['31000'] ) ) {
			
			$totaux['32000'] = $totaux['31000'];	// sucres <= glucides
		}
	}
	
	
/* $data
Array
(
    [0] => Array
        (
            [rel_id] => 18
            [rel_qte] => 50
            [0] => Array
                (
                    [0] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  327 
                            [const_nom_fr] =>  Energie, Règlement UE N° 1169/2011 (kJ/100g) 
                            [teneur] =>  1140 
                        )

                    [1] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  328 
                            [const_nom_fr] =>  Energie, Règlement UE N° 1169/2011 (kcal/100g) 
                            [teneur] =>  274 
                        )

                    [2] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  40000 
                            [const_nom_fr] =>  Lipides (g/100g) 
                            [teneur] =>  0 
                        )

                    [3] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  40302 
                            [const_nom_fr] =>  AG saturés (g/100g) 
                            [teneur] =>  0 
                        )

                    [4] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  31000 
                            [const_nom_fr] =>  Glucides (g/100g) 
                            [teneur] =>  2,91 
                        )

                    [5] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  32000 
                            [const_nom_fr] =>  Sucres (g/100g) 
                            [teneur] =>  0 
                        )

                    [6] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  25003 
                            [const_nom_fr] =>  Protéines brutes, N x 6.25 (g/100g) 
                            [teneur] =>  0 
                        )

                    [7] => Array
                        (
                            [alim_code] =>  1000 
                            [alim_nom_fr] =>  Pastis 
                            [alim_grp_code] => 06-0603-060304
                            [alim_name] =>  Pastis  |  cocktails  |  boisson alcoolisées 
                            [const_code] =>  10004 
                            [const_nom_fr] =>  Sel chlorure de sodium (g/100g) 
                            [teneur] =>  0 
                        )

                )

        )
          ......
 * 
 * 
 */
	