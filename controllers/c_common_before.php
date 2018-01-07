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

	require_once (__WEB_ROOT__ . 'phpMailer/PHPMailer.php');
	require_once (__WEB_ROOT__ . 'phpMailer/SMTP.php');
	
	// PHPMailer Object
	$mail = new PHPMailer ();
	
	// Enable SMTP debugging.
	// $mail->SMTPDebug = 3;
	// Set PHPMailer to use SMTP.
	$mail->isSMTP ();
	// Set SMTP host name
	$mail->Host = "smtp.sfr.fr";
	// Set this to true if SMTP host requires authentication to send email
	$mail->SMTPAuth = true;
	// Provide username and password
	$mail->Username = "f.mevollon@sfr.fr";
	$mail->Password = "cadoul46";
	// If SMTP requires TLS encryption then set it
	$mail->SMTPSecure = "ssl";
	// Set TCP port to connect to
	$mail->Port = 465;
	
	// From email address and name
	$mail->From = "f.mevollon@sfr.fr";
	$mail->FromName = "TEST";
	// Address to which recipient will reply
	$mail->addReplyTo ( "f.mevollon@gmail.com", utf8_decode ( "Frédéric" ) );
	// CC and BCC
	// $mail->addCC("cc@example.com");
	// $mail->addBCC("bcc@example.com");
	// Send HTML or Plain Text email
	$mail->isHTML ( true );
	
	// To address and name
	$mail->addAddress ( $adresse );
	
	$mail->Subject = $objet;
	$mail->Body = $message;
	// $mail->AltBody = "This is the plain text version of the email content";
	
	if($mail->smtpConnect()){
		
		if (! $mail->send ()) {
			
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