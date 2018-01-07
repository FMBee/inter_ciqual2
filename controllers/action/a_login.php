
<?php

if (isset ( $_SESSION ['__user_id__'] )) {
	
	session_unset ();
}

if (! isset ( $_SESSION ['__log_try__'] )) {
	
	$_SESSION ['__log_try__'] = 0;
}

$logErr = "";

if ($data = Users::getOneByLogin ( $pdo, trim ( $_POST ["login"] ) )) {
	
// debug($data);
	if ($data ['usr_confirmed'] == '0') {
		
		header ( 'Location: ' . codeUrl ( 'validation-&paramemail=' . $_POST ['login'] ) );
	} else {

		if (password_verify ( $_POST ["password"], $data ['usr_password'] )) {
			
			$_SESSION ['__user_id__'] = $data ['usr_id'];
			
			maj_user_ss ( $data );
			maj_options_ss($data);
			
			App_Logs::Add ( $pdo, 3, '', $_SESSION ['__user_id__'], '' );
			
		} else {
			$logErr = traductLib ( 'vldLogin1' );
		}
	}
} else {
	$logErr = traductLib ( 'vldLogin1' );
}

if (! empty ( $logErr )) {
	
	if (! $_SERVER ['__app_params__'] ['__APP_USER_CREATE__']) {
		
		$_SESSION ['__log_try__'] ++;
		
		if ($_SESSION ['__log_try__'] == __LOG_TRY__) {

			$_SESSION ['__log_try__'] = 0;
			
			if (isset ( $data ['pro_access'] ) && $data ['pro_access'] > __ADMIN_MINACCESS__) {
				
				$oSmarty->assign ( 'ctrlMessage', traductLib ( 'msgLogin2' ) );
			} else {
				$oSmarty->assign ( 'ctrlMessage', traductLib ( 'msgLogin1' ) );
			}
		} else {
			$oSmarty->assign ( 'ctrlMessage', $logErr );
		}
	} else {
		
		$oSmarty->assign ( 'ctrlMessage', $logErr );
	}
}

?>
