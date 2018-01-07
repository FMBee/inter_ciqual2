<?php

$email = empty ( $_POST ['email'] ) ? $_param ['email'] : $_POST ['email'];

if ($data = Users::getOneByLogin ( $pdo, $email, true )) {
	
	if ($data ['usr_confirmed'] == '0') {
		
		// on regarde la validité de l'activation
		
		$stamp1 = strtotime ( $data ['usr_in_date'] );
		$stamp2 = strtotime ( 'now' );
		$delay = $_SERVER ['__app_params__'] ['__APP_ACTIVE_DELAY__'] * 3600;	//une heure
		
		if (($stamp2 - $stamp1) > $delay) {
			
			$code = md5 ( uniqid ( mt_rand () ) );
			$sql = "UPDATE users SET usr_in_date = now(), usr_activekey = '" . $code . "' WHERE usr_id = " . $data ['usr_id'] . ";";
//debug ( $sql );
			$result = sqlDo ( $pdo, $sql );
			
			$result = activationMail ( $data, $code );
			
			if($result[0]) {
				
				$oSmarty->assign ( 'ctrlMessage', "Le délai de validation a été dépassé<br />Un mail d'activation vient de vous être renvoyé<br />(Vérifiez également la validité de votre adresse)" );
			}
			else{
				$oSmarty->assign ( 'ctrlMessage', $result[1] );
			}
		
		} else {
			$oSmarty->assign ( 'ctrlMessage', 'Cet identifiant est déjà enregistré<br />Veuillez consulter vos mails et activer le compte' );
		}
	} else {
		$oSmarty->assign ( 'ctrlMessage', 'Cet identifiant est déjà enregistré<br />Veuillez vous connecter' );
	}
} else {
	//création user

	$code = md5 ( uniqid ( mt_rand () ) );
	
	$data = [ ];
	$data ['paramkey'] = 0;
	$data ['usr_first_name'] = '';
	$data ['usr_last_name'] = $_POST ['email'];
	$data ['usr_login'] = $_POST ['email'];
	$data ['usr_password'] = password_hash ( $_POST ['password'], PASSWORD_DEFAULT );
	$data ['usr_activekey'] = $code;
	$data ['usr_mail'] = $_POST ['email'];
	$data ['usr_pro_id'] = '3';
	$data ['usr_lang'] = __LANG_DEFAULT__;
	$data ['usr_image_path'] = __PATH_USERIMG__;
	$data ['out_user'] = '';
			
	Users::majOrAdd ( $pdo, array_values( $data ));
	
	$result = activationMail ( $data, $code );

	if($result[0]) {
		
		$oSmarty->assign ( 'ctrlMessage', 'Un mail de confirmation vous a été envoyé<br />Veuillez activer le compte' );
	}
	else{
		$oSmarty->assign ( 'ctrlMessage', $result[1] );
	}
}

function activationMail($data, $code) {

	$html = '
	<html>
	<body>
		<br />
		Bonjour,<br />
		Vous venez de créer votre compte ' . __APP_TITLE__ . '<br />
		<br />
		Pour activer votre compte cliquez sur le lien suivant : 
		<a href="' .$_SERVER['__app_params__']['__APP_FRONT_ADDRESS__'] 
					.codeUrl( 'activation-login&paramemail=' 
					.$data ['usr_login'] 
					.'&paramactivekey=' .$code ) 
					.'">Activation
		</a>
	</body>
	</html>
	';

	return sendMail( 	$data ['usr_login'], 
						'Activation de votre compte ' .__APP_TITLE__ .' - ' .date('d/m/Y H:i'), 
						$html 
	);
}

?>