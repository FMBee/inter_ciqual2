<?php

$data = Users::getOneByLogin ( $pdo, trim ( $_param ['email'] ), true );

if ($_param ['activekey'] == $data ['usr_activekey']) {
	
	// on regarde la validité de l'activation
	
	$stamp1 = strtotime ( $data ['usr_in_date'] );
	$stamp2 = strtotime ( 'now' );
	$delay = $_SERVER ['__app_params__'] ['__APP_ACTIVE_DELAY__'] * 3600;
	
	if (($stamp2 - $stamp1) > $delay) {
		
		$_SESSION['__params__']['paramemail'] = $data ['usr_login'];
		
		header ( 'Location: ' . codeUrl ( 'validation-index' ) );
	} else {
		$result = sqlDo ( $pdo, "UPDATE users SET usr_confirmed = 1 WHERE usr_id = " . $data ['usr_id'] . ";" );
		
		$oSmarty->assign ( 'ctrlMessage', 'Votre compte a bien été activé<br />Vous pouvez à présent vous connecter' );
	}
} else {
	$oSmarty->assign ( 'ctrlMessage', "Problème d'activation<br />Veuillez consulter vos mails récents ou vous connecter ultérieurement" );
}

?>