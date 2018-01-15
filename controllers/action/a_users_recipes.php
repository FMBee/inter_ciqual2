<?php

	$message = '';
	
	if ($_param['mode'] == 'add_ing') {
	
		array_walk( $_POST, 'trim_value' );
		
		$data = array(
				'0',
				$_SESSION['_recipy']['rec_id'],
				$_POST['addingredient-code'],
				$_POST['addingredient-qte'],
		);
		
		$retour = Recipies::majOrAddLine( $pdo, $data );
 			
		if ((int)$retour == 0) {
		
			$message = 'Ingrédient déjà présent - modifiez la quantité';
		}
		else{
			App_Logs::Add( 	$pdo, 
						4, 
						'ajout ingrédient code:' .$_POST['addingredient-code'] .', recette ' .$_SESSION['_recipy']['rec_id'], 
						$_SESSION ['__user_id__']
			);
		}
	}
	
	if ($_param['mode'] == 'maj_ing') {
	
		array_walk( $_POST, 'trim_value' );
		
		$data = array(
				$_POST['majingredient-id'],
				'0',
				'-',
				$_POST['majingredient-qte'],
		);
// 		$data = testRecorded('ingredient', $fields);
		
		$retour = Recipies::majOrAddLine( $pdo, $data );

		App_Logs::Add( 	$pdo, 
					4, 
					'maj ingrédient id:' .$_POST['majingredient-id'] .', recette ' .$_SESSION['_recipy']['rec_id'], 
					$_SESSION ['__user_id__']
		);
	}
	
	if ($_param['mode'] == 'del_ing') {
	
		$data = array(
				trim($_POST['delingredient-id']),
		);
		
		$retour = Recipies::deleteLine( $pdo, $data );

		App_Logs::Add( 	$pdo, 
					4, 
					'suppr. ingrédient id:' .$_POST['delingredient-id'] .', recette ' .$_SESSION['_recipy']['rec_id'], 
					$_SESSION ['__user_id__']
		);
	}
	
	if ($_param['mode'] == 'del_rec') {
		
		$data = array(
				$_SESSION['_recipy']['rec_id'],
		);
		
		$retour = Recipies::delOne( $pdo, $data );

		App_Logs::Add( 	$pdo, 
					4, 
					'suppression recette ' .$_SESSION['_recipy']['rec_id'], 
					$_SESSION ['__user_id__']
		);
		$_SESSION['_recipy']['rec_id'] = Recipies::getFirst($pdo);
		
		$message = 'Recette supprimée';
	}
	
	$oSmarty->assign('ctrlMessage', $message);

?>