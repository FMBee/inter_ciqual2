<?php

	if ($_param['mode'] == 'add') {
	
		array_filter ( $_POST, 'trim_value' );
		
		$fields = array(
				'paramkey',
				'usr_first_name',
				'usr_last_name',
				'usr_login',
				'usr_password',
				'usr_activekey',
				'usr_mail',
				'usr_pro_id',
				'usr_lang',
				'usr_image_path',
				'usr_out_date'
		);
// 		$data = testRecorded('users', $fields);
		
// 		Users::majOrAdd ( $pdo, array_values( $data ) );
		
		App_Logs::Add ( $pdo, 4, 'ajout ingrédient ' .$_POST['modal-addingredient-paramingredient'] .', recette ' .$_GET['paramkey'], $_SESSION ['__user_id__']);
		
		//$oSmarty->assign('ctrlMessage', 'Ingrédient ajouté '.$_POST['modal-addingredient-paramingredient']);
		$_param['addkey'] = $_POST['modal-addingredient-paramingredient'];
	}

?>