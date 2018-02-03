<?php

// $oSmarty->assign('Users', Users::getAllIn($pdo, $_SESSION['__cli_id__']) );
// $oSmarty->assign('Restaurants', Users::getAllByUser($pdo, $_SESSION['__user_id__'] ));

// $oSmarty->assign('sexes', array(
// array('id' => '0', 'code' => 'Femme'),
// array('id' => '1', 'code' => 'Homme'),
// array('id' => '2', 'code' => '-')
// )
// );

function sendMail($adresse, $objet, $message) {

	require_once(__WEB_ROOT__ . 'phpMailer/PHPMailer.php');
	require_once(__WEB_ROOT__ . 'phpMailer/SMTP.php');
	
	$mail = new PHPMailer ();
	
	$mail->isSMTP();
	$mail->SMTPAuth = true;
	$mail->SMTPSecure =__MAILER_SECU__;
	$mail->Port 	= __MAILER_PORT__;
	
	$mail->Host 	= __MAILER_HOST__;
	$mail->Username = __MAILER_USER__;
	$mail->Password = __MAILER_PWD__;
	$mail->From 	= __MAILER_FROM__;
	$mail->FromName = __MAILER_FROM__;
	
	$mail->addReplyTo( __MAILER_REPLY__, utf8_decode ( __MAILER_REPLY__ ) );
	$mail->addAddress( $adresse );
	
	$mail->isHTML( true );
	$mail->Subject = $objet;
	$mail->Body = $message;
	
	if($mail->smtpConnect()){
		
		if (! $mail->send()) {
			
			return array(false, $mail->ErrorInfo);
		} else {
			return array(true, 'Envoyé');
		}
	   $mail->smtpClose();
	}
	else{
	   return array(false, "Connection SMTP Failed");
	}
	
}