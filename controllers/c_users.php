<?php

	if ($_param ['key'] != '0') {
		
		$tabUsers = Users::getOne ( $pdo, $_param ['key'] );
	
		setRecorded('users', $tabUsers);
	
		// on initialise le password pour éviter l'affichage des 60 carac. du hashcode
		$tabUsers ['usr_password'] = __PWD_INIT__;
		
		$oSmarty->assign ( 'users', $tabUsers );
	}
	
	if ($_SERVER ['__app_params__'] ['__APP_USER_LOGO__']) {
		$files = scandir ( __VIEWS_IMG__ . 'profiles' );
		$tablogos = [ ];
		foreach ( $files as $filename ) {
			if (substr ( $filename, 0, 1 ) != '.')
				$tablogos [] = $filename;
		}
		$oSmarty->assign ( 'logos', $tablogos );
	}
	
	if ($_SERVER ['__app_params__'] ['__APP_INTERNATIONAL__']) {
		$oSmarty->assign ( 'languages', App_Languages::getAllLanguages ( $pdo ) );
	}
	
	$oSmarty->assign ( 'profiles', $UsersProfiles );

?>