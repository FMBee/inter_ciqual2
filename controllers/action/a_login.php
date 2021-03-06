
<?php
	
	if ( onSession() ) {
		
		session_unset();
	}
	
	if (! isset( $_SESSION['__log_try__'] )) {
		
		$_SESSION['__log_try__'] = 0;
	}
	
	$logErr = "";
	
	if ($data = Users::getOneByLogin( $pdo, trim( $_POST["login"] ) )) {
		
// 	debug($data);
		if ($data['usr_confirmed'] == '0') {
			
			$_SESSION['__params__']['paramemail'] = $_POST['login'];
			
			header ( 'Location: ' . codeUrl ( 'validation-index' ) );
		} else {
	
			if (password_verify( $_POST["password"], $data['usr_password'] )) {
				
				maj_user_ss( $data );
				maj_options_ss($data);
				$_GET['page'] = 'index';
				
				App_Logs::Add( $pdo, 3, '', $data['usr_id'], '' );
				
			} else {
				$logErr = traductLib( 'vldLogin1' );
			}
		}
	} else {
		$logErr = traductLib( 'vldLogin1' );
	}
	
	if (! empty( $logErr )) {
		
		if (! $_SERVER['__app_params__']['__APP_USER_CREATE__']) {
			
			$_SESSION['__log_try__'] ++;
			
			if ($_SESSION['__log_try__'] == __LOG_TRY__) {
	
				$_SESSION['__log_try__'] = 0;
				
				if (isset( $data['pro_access'] ) && $data['pro_access'] > __ADMIN_MINACCESS__) {
					
					$oSmarty->assign( 'ctrlMessage', traductLib( 'msgLogin2' ) );
				} else {
					$oSmarty->assign( 'ctrlMessage', traductLib( 'msgLogin1' ) );
				}
			} else {
				$oSmarty->assign( 'ctrlMessage', $logErr );
			}
		} else {
			
			$oSmarty->assign( 'ctrlMessage', $logErr );
		}
	}


