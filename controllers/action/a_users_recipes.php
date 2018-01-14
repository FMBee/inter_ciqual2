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
// 		$data = testRecorded('ingredient', $fields);
		
		$retour = Recipies::majOrAddLine( $pdo, $data );
 			
		if ((int)$retour == 0) {
		
			$message = 'Ingrédient déjà ajouté - modifiez la quantité';
		}
		else{
			App_Logs::Add( 	$pdo, 
						4, 
						'ajout ingrédient ' .$_POST['addingredient-code'] .', recette ' .$_SESSION['_recipy']['rec_id'], 
						$_SESSION ['__user_id__']
			);
		}
	}
	
	if ($_param['mode'] == 'maj_ing') {
	
		array_walk( $_POST, 'trim_value' );
		
		$data = array(
				$_POST['majingredient-id'],
				$_SESSION['_recipy']['rec_id'],
				'-',
				$_POST['majingredient-qte'],
		);
// 		$data = testRecorded('ingredient', $fields);
		
		$retour = Recipies::majOrAddLine( $pdo, $data );
 			
		App_Logs::Add( 	$pdo, 
					4, 
					'modif ingrédient ' .$_POST['majingredient-id'] .', recette ' .$_SESSION['_recipy']['rec_id'], 
					$_SESSION ['__user_id__']
		);
	}
	
	$oSmarty->assign('ctrlMessage', $message);

?>