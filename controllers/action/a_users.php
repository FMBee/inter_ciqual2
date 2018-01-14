<?php

if (isset ( $_POST['paramkey'] )) {

	array_walk( $_POST, 'trim_value' );
	
	if ($_POST ['usr_password'] != __PWD_INIT__) {	// un mot de passe a été saisi
	
		$_POST ['usr_password'] = password_hash ( $_POST ['usr_password'], PASSWORD_DEFAULT ); // cryptage
	} 
	else{
		$_POST ['usr_password'] = getRecorded('users', 'usr_password');
	}
	
	if ($_SESSION ['__admin_mode__']) {
		
		if ( !empty ( $_POST['out_user'] )) {
			
			if ( getRecorded('users', 'usr_out_date') == __DATE_NULL__ ) {
				
				$_POST ['usr_out_date'] = date('Y-m-d', strtotime('now')); 
			}
		}
		else{
			$_POST ['usr_out_date'] = __DATE_NULL__; 
		}
	} 
	
	if ($_POST['paramkey'] == '0') {	
	
		if (! $_SERVER['__app_params__']['__APP_USER_CREATE__']) {
			
			$_POST['usr_activekey'] = '0';	//le usr_confirmed sera à 1
		}
	}
	
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
	$data = testRecorded('users', $fields);
//debug($_POST);
//debug($data);	
	Users::majOrAdd ( $pdo, array_values( $data ) );
	
	App_Logs::Add ( $pdo, 4, 'création/modification user : ' . $data ['usr_last_name'], $_SESSION ['__user_id__'], '' );
	
	if ($_SESSION ['__user_id__'] == $data ['paramkey']) // user modifié = user loggé
	{
		$profil = Users_Profiles::getById ( $pdo, $data ['usr_pro_id'] );
		$data ['pro_name'] = $profil ['pro_name'];
		$data ['pro_access'] = $profil ['pro_access'];
		
		maj_user_ss ($data );
	}
}

?>