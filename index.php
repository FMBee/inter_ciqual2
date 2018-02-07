<?php

	// ob_start();
	
	// Initialisation de l'environnement
	if (! isset( $_SERVER['DOCUMENT_ROOT'] ))
		die();
	
	if (! defined( '__CONFIG_ROOT__' ))
		define( '__CONFIG_ROOT__', '.' . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR );
	
	include(__CONFIG_ROOT__ . 'config_init.php');
	
	include(__CONFIG_ROOT__ . 'functions.php');
	
	// Debugging
	
	if (isset( $_SERVER['__app_params__']['__APP_DEBUG__'] ) && $_SERVER['__app_params__']['__APP_DEBUG__']) {
		
		ini_set( 'display_errors', 'On' );
		error_reporting( E_ALL );
	}
	// debug( 'GET:' );
	// debug( $_GET );
	// debug( 'POST:' );
	// debug( $_POST );
	// debug('SERVER:');debug($_SERVER);
	// debug('SESSION#1:');debug($_SESSION);
	
	// / ROUTING
	
	if (empty( $_SESSION['__history__'] ))
		$_SESSION['__history__'] = array();
	
	if (count( $_SESSION['__history__'] ) >= __HISTO_LEN__)
		array_shift( $_SESSION['__history__'] );
	
	$_SESSION['__history__'][] = array(
			'QUERY' => $_SERVER['QUERY_STRING'],
			'GET' => $_GET,
			'POST' => $_POST 
	);
	
	$specialPages = array(
			'deconnect',
			'inscription',
			'validation',
			'activation',
			'recovery',
			'login'
	);
	
	// Initialisations communes
	
	include(__CONTROLLERS_ROOT__ . 'o_loadparams.php');
	
	include(__CONTROLLERS_ROOT__ . 'c_common_before.php'); // avant controllers
	                                                     
	// Maintenance
	
	if ($_SERVER['__app_params__']['__APP_MAINTAIN__']) {
		
		if (onSession()) { // connecté
			
			$_GET['action'] = 'deconnect'; // déconnexion
			$_GET['page'] = 'login';
			
			$oSmarty->assign( 'ctrlMessage', traductLib( 'msgError1' ) );
		}
	}
	
	if (isAction() && in_array( $_GET['action'], $specialPages )) {
		
		include(action()); // unset de $_SESSION si déconnexion
	}
	
	// Cas général
	
	$oSmarty->assign('onSession', onSession());
	
	if (onSession()) { // connecté
	                   
		// Action
		
		if (isAction() &&(! in_array( $_GET['action'], $specialPages ))) {
			
			include(action());
		}
		
		// Page
		
		if (isPage()) {
			
			include(page());
		} else {
			
			include(__CONTROLLERS_ROOT__ . 'c_index.php');
		}
		
		// Initialisations communes
		
		include(__CONTROLLERS_ROOT__ . 'c_common_after.php'); // après controllers
		                                                    
		// Affichage des templates
		
		$oSmarty->display( __VIEWS_ROOT__ . 'v_header.tpl' );
		
		$oSmarty->display( __VIEWS_ROOT__ . 'v_menu.tpl' );
		
		if (isTemplate()) {
			
			$oSmarty->display( template() );
		} else {
			
			$oSmarty->display( __VIEWS_PAGES__ . 'p_index.tpl' );
		}
		
		$oSmarty->display( __VIEWS_ROOT__ . 'v_footer.tpl' );
	} 
	
	else { // Session expirée - déconnexion - login
		
		if ((isAction() &&(! in_array( $_GET['action'], $specialPages ))) || // action normale !onSession() )
			(isPage() &&(! in_array( $_GET['page'], $specialPages )))) // page normale et !onSession() )
		{
			$_GET['page'] = 'login';
			$oSmarty->assign( 'ctrlMessage', traductLib( 'msgError1' ) ); // session expirée
		}
		
		if (isPage()) {
			
			include(page());
		}
		
		// Initialisations communes
		
		include(__CONTROLLERS_ROOT__ . 'c_common_after.php'); // après controllers
		                                                    
		// Affichage des templates
		
		$oSmarty->display( __VIEWS_ROOT__ . 'v_header.tpl' );
		
		if (isTemplate()) {
			
			$oSmarty->display( template() );
		} else {
			
			$oSmarty->display( __VIEWS_PAGES__ . 'p_login.tpl' );
		}
		
		$oSmarty->display( __VIEWS_ROOT__ . 'v_footer.tpl' );
	}
	
// 	debug( 'SESSION#2:' );debug( $_SESSION );
	
	// ob_end_flush();
	
	
	
	
	//*******************************
	
	function action() {
		return __CONTROLLERS_ACTION__ . 'a_' . $_GET['action'] . '.php';
	}
	function page() {
		return __CONTROLLERS_ROOT__ . 'c_' . $_GET['page'] . '.php';
	}
	function template() {
		return __VIEWS_PAGES__ . 'p_' . $_GET['page'] . '.tpl';
	}
	function isAction() {
		return isset( $_GET['action'] ) && file_exists( action() );
	}
	function isPage() {
		return isset( $_GET['page'] ) && file_exists( page() );
	}
	function isTemplate() {
		return isset( $_GET['page'] ) && file_exists( template() );
	}

?>
