<?php

if ( isset($_POST['email']) ) {

	$email = trim($_POST['email']);

	if ($data = Users::getOneByLogin ( $pdo, $email, true )) {
		
		if ($data ['usr_confirmed'] == '1') {
			
			$code = '';
			for ($i=0; $i < 6; $i++) { 

				$code .= mt_rand(1,9);
			}

			$html = '
				<html>
				<body>
					<br />
					Bonjour,<br />
					Vous avez demandé la réinitialisation de votre mot de passe ' . __APP_TITLE__ . '<br />
					<br />
					Votre code de confirmation est le suivant : <b>' .$code .'</b>
				</body>
				</html>
				';
						
			$result = sendMail ( 	$data ['usr_login'],
									utf8_decode('Réinitialisation de votre mot de passe ' .__APP_TITLE__ .' - ' .date('d/m/Y H:i')),
									utf8_decode($html)
			);
			
			if($result[0]) {
			
	//passage par session			
	
				$_SESSION['__app_recovery__']['useremail'] = $email;
				$_SESSION['__app_recovery__']['usercode'] = $code;
	
	//passage par database
	//on enregistre/modifie une ligne de récupération
	
				// $insert = App_Recovery::getOne ($pdo, $email);
	
				// App_Recovery::majOrAdd ($pdo, array( 
				// 	$insert,
				// 	$email,
				// 	$code
				// ) );

				$oSmarty->assign ( 'ctrlMessage', 'Un code de confirmation vous a été envoyé<br />Veuillez consulter votre messagerie' );
				$_SESSION['__params__']['paramsection'] = 'code';
				$_SESSION['__params__']['paramalert'] = 'Un code de confirmation vous a été envoyé<br />Veuillez consulter votre messagerie';
				
				header( 'Location: ' .codeUrl( '-recovery' ) );
			}
			else{
				$oSmarty->assign ( 'ctrlMessage', $result[1] );
			}
		}
		else {
			$oSmarty->assign ( 'ctrlMessage', 'Ce compte n\'est pas encore activé');
		}
	} else {
		
		$oSmarty->assign ( 'ctrlMessage', 'Cet identifiant n\'existe pas');
	}
}
elseif (isset($_POST['code']) && isset($_SESSION['__app_recovery__'])) {

	if (trim($_POST['code']) ==	$_SESSION['__app_recovery__']['usercode'] ) {

		$_SESSION['__params__']['paramsection'] = 'password';
		$_SESSION['__params__']['paramalert'] = 'Code accepté<br />Veuillez entrer votre nouveau mot de passe';
		
		header ( 'Location: ' . codeUrl ( '-recovery' ) );
	}
	else{
		$oSmarty->assign('ctrlMessage', 'Le code saisi est incorrect');
	}
}
elseif (isset($_POST['password']) && isset($_SESSION['__app_recovery__'])) {

	$sql = 'UPDATE users SET usr_password=\'' .password_hash ( $_POST ['password'], PASSWORD_DEFAULT )
			. '\' WHERE usr_login=\'' .$_SESSION['__app_recovery__']['useremail']
			.'\';';
	$result = sqlDo ( $pdo, $sql );

	$oSmarty->assign('ctrlMessage', 'Votre nouveau mot de passe est enregistré<br />Vous pouvez vous connecter');
	unset($_SESSION['__app_recovery__']);
}
else{
	$oSmarty->assign('ctrlMessage', 'Erreur dans la procédure');
}

