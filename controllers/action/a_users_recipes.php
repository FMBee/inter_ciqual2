<?php

	$message = '';
	
	/*
	 * ajout ingrédient
	 */
	if ($_param['mode'] == 'add_ing') {
	
		array_walk( $_POST, 'trim_value' );
		
		$data = array(
				'0',
				$_SESSION['_recipy']['rec_id'],
				$_POST['addingredient-code'],
				$_POST['addingredient-qte'],
		);
		
		$retour = Recipes::majOrAddLine( $pdo, $data );
 			
		if ((int)$retour == 0) {
		
			$message = 'Ingrédient déjà présent - modifiez la quantité';
		}
		else{
			App_Logs::Add( 	$pdo, 
						4, 
						"ajout ingrédient code: {$_POST['addingredient-code']} / recette: {$_SESSION['_recipy']['rec_id']}", 
						$_SESSION ['__user_id__']
			);
		}
	}
	
	/*
	 * modification quantité
	 */
	if ($_param['mode'] == 'maj_ing') {
	
		array_walk( $_POST, 'trim_value' );
		
		$data = array(
				$_POST['majingredient-id'],
				'0',
				'-',
				$_POST['majingredient-qte'],
		);
// 		$data = testRecorded('ingredient', $fields);
		
		$retour = Recipes::majOrAddLine( $pdo, $data );

		App_Logs::Add( 	$pdo, 
					4, 
					"maj ingrédient id: {$_POST['majingredient-id']} / recette: {$_SESSION['_recipy']['rec_id']}", 
					$_SESSION ['__user_id__']
		);
	}
	
	/*
	 * supp. ingrédient
	 */
	if ($_param['mode'] == 'del_ing') {
	
		$data = array(
				trim($_POST['delingredient-id']),
		);
		
		$retour = Recipes::deleteLine( $pdo, $data );

		App_Logs::Add( 	$pdo, 
					4, 
					"suppr. ingrédient id: {$_POST['delingredient-id']} / recette: {$_SESSION['_recipy']['rec_id']}", 
					$_SESSION ['__user_id__']
		);
	}
	
	/*
	 * création recette
	 */
	if ($_param['mode'] == 'add_rec') {
		
		$data = array(
				'0',
				$_POST['addrecipe-nom'],
				'-',
				$_SESSION ['__user_id__'],
		);
		
		$retour = Recipes::majOrAdd( $pdo, $data );

		if ((int)$retour == 0) {
		
			$message = 'Création impossible - contactez l\'assistance';
		}
		else{
			$data = array(
					'0',
					$retour,
					$_POST['addrecipe-ingcode'],
					$_POST['addrecipe-ingqte'],
			);
			
			Recipes::majOrAddLine( $pdo, $data );

			App_Logs::Add( 	$pdo,
					4,
					"nouvelle recette: {$retour} / {$_POST['addrecipe-nom']}",
					$_SESSION ['__user_id__']
					);

			$_SESSION['_recipy']['rec_id'] = trim($retour);
			$_SESSION['_recipy']['rec_title'] = trim($_POST['addrecipe-nom']);
			$_SESSION['_recipy']['rec_label'] = '_init_';
		}
	}
	
	/*
	 * modif. nom recette
	 */
	if ($_param['mode'] == 'chg_nam') {
		
		$data = array(
				$_SESSION['_recipy']['rec_id'],
				$_POST['chgrecipyname-nom'],
				$_SESSION['_recipy']['rec_label'],
				'-',
		);
		
		$retour = Recipes::majOrAdd( $pdo, $data );
		
		App_Logs::Add( 	$pdo, 
					4, 
					'Modif. nom recette ' .$_SESSION['_recipy']['rec_id'], 
					$_SESSION ['__user_id__']
		);
	}
	
	/*
	 * suppr. recette
	 */
	if ($_param['mode'] == 'del_rec') {
		
		$retour = Recipes::delOne( $pdo, $_SESSION['_recipy']['rec_id'] );

		App_Logs::Add( 	$pdo, 
					4, 
					'suppression recette ' .$_SESSION['_recipy']['rec_id'], 
					$_SESSION ['__user_id__']
		);
		$_SESSION['_recipy']['rec_id'] = Recipes::getFirst($pdo);
		
		$message = 'Recette supprimée';
	}
	
	/*
	 * changement de recette
	 */
	if ($_param['mode'] == 'chg_rec') {
		
		$recipy = Recipes::getOne($pdo, $_param['key']);
//debug($recipy);		
		$_SESSION['_recipy']['rec_id'] = trim($recipy[0]['rec_id']);
		$_SESSION['_recipy']['rec_title'] = trim($recipy[0]['rec_title']);
		$_SESSION['_recipy']['rec_label'] = trim($recipy[0]['rec_label']);
	}
	
	$oSmarty->assign('ctrlMessage', $message);

?>