<?php

// Arborescence application

// $_SEP = DIRECTORY_SEPARATOR; // !!:vaut '\' sous Windows Server et '/' sous Linux
$_SEP = '/';
$_ROOT = '.' . $_SEP; // racine pour include PHP

	myDefine('__PATH_SEPARATOR__' 		, $_SEP );
	myDefine('__DOCUMENT_ROOT__' 		, $_ROOT );
	myDefine('__CONTROLLERS_ROOT__' 	, $_ROOT . 'controllers' . $_SEP );
	myDefine('__CONTROLLERS_ACTION__' 	, __CONTROLLERS_ROOT__ . 'action' . $_SEP );
	myDefine('__CONTROLLERS_AJAX__' 	, __CONTROLLERS_ROOT__ . 'ajax' . $_SEP );
	myDefine('__MODELS_ROOT__' 			, $_ROOT . 'models' . $_SEP );
	
	// Liens relatifs

$_SEP = '/';
$_ROOT = ''; // racine pour include Smarty, Ajax, et URLS

	myDefine('__DIRECTORY_ROOT__' 		, substr ( $_SERVER ['SCRIPT_FILENAME'], 0, strrpos ( $_SERVER ['SCRIPT_FILENAME'], '/' ) ) . $_SEP );

	myDefine('__VIEWS_ROOT__' 			, $_ROOT . 'views' . $_SEP );
	myDefine('__VIEWS_CONFIG__' 		, __VIEWS_ROOT__ . 'config' . $_SEP );
	myDefine('__VIEWS_FOOTERS__' 		, __VIEWS_ROOT__ . 'footers' . $_SEP );
	myDefine('__VIEWS_IMG__' 			, __VIEWS_ROOT__ . 'img' . $_SEP );
	myDefine('__VIEWS_LAYOUTS__' 		, __VIEWS_ROOT__ . 'layouts' . $_SEP );
	myDefine('__VIEWS_PAGES__' 			, __VIEWS_ROOT__ . 'pages' . $_SEP );

	myDefine('__WEB_ROOT__' 			, $_ROOT . 'web' . $_SEP );
	myDefine('__WEB_LIB_THEME__' 		, __WEB_ROOT__ . 'sbadmin' . $_SEP );
	myDefine('__WEB_LIB_BOWER__' 		, __WEB_LIB_THEME__ . 'bower_components' . $_SEP );
	myDefine('__WEB_LIB_BOOTSTRAP__' 	, __WEB_LIB_BOWER__ . 'bootstrap' . $_SEP );
	myDefine('__WEB_LIB_FORMVALID__' 	, __WEB_ROOT__ . 'formvalidation-v0.6.3' . $_SEP );
	myDefine('__WEB_LIB_SELECT__' 		, __WEB_ROOT__ . 'select' . $_SEP );
	myDefine('__WEB_LIB_SMARTY__' 		, __WEB_ROOT__ . 'smarty' . $_SEP );
	myDefine('__WEB_LIB_SWITCH__' 		, __WEB_ROOT__ . 'bootstrap-switch' . $_SEP );
	myDefine('__WEB_LIB_FPDF__' 		, __WEB_ROOT__ . 'fpdf' . $_SEP );
	myDefine('__WEB_LIB_CAROUSEL__' 	, __WEB_ROOT__ . 'owl-carousel' . $_SEP );
	myDefine('__WEB_LIB_BOOTBOX__' 		, __WEB_ROOT__ . 'bootbox' . $_SEP );
	myDefine('__WEB_LIB_AUTOCPL__' 		, __WEB_ROOT__ . 'jQuery-Autocomplete' . $_SEP );
	
	// Paramètres

	myDefine('__APP_TITLE__' 			, 'NutriVal' ); // titre appli
	myDefine('__APP_VERSION__' 			, 'v.1.01' ); // version appli
	myDefine('__PWD_INIT__' 			, 'Zz0Zz0Zz0' ); // initialisation du mot de passe user
	myDefine('__LOG_TRY__' 				, 3 ); // nb d'essai de login avant récupération
	myDefine('__LOG_IMG__' 				, 'bg_login.jpg' ); // background
	myDefine('__ACTIVATION_DELAY__' 	, 2 ); // délai d'activation par mail d'un compte (h)
	myDefine('__HISTO_LEN__' 			, 5 ); // longueur historique pages visitées SESSION['__history__']
	myDefine('__PATH_USERIMG__' 		, __VIEWS_IMG__ . '/profiles/profile_logo.png' ); // avatar par défaut
	myDefine('__ADMIN_MINACCESS__' 		, '599' ); // seuil de passage au mode admin
	myDefine('__LANG_DEFAULT__' 		, 'fr' ); // langue par defaut de l'appli
	myDefine('__FORM_LANG_DEFAULT__' 	, 'fr_FR' ); // langue par defaut FormValidation
	myDefine('__DATE_NULL__' 			, '0000-00-00 00:00:00' ); // test date nulle	

	myDefine('__CIQUAL_API__' 			, 'http://nautilusweb.fr/ciqual_api/ciqual_api.php' ); // serveur Ciqual	
// 	myDefine('__CIQUAL_API__' 			, 'http://localhost/ciqual_api/ciqual_api.php' ); // serveur Ciqual	
	myDefine('__CIQUAL_ACC1__' 			, '?table=ingredients&where=xxx&mode=_AAC' ); 	// Ajax_AC search ingredients	
	myDefine('__CIQUAL_ACC2__' 			, '?table=categories&where=xxx&mode=_AAC' ); 	// Ajax_AC search categories	
	
	
/*
 * INSERT INTO `app_parameters` (`prt_id`, `prt_name`, `prt_value`, `prt_apt_id`, `prt_flag`) VALUES
 * (NULL, '__FTP_SERVER__', 'vps344570.ovh.net', '1', NULL),
 * (NULL, '__FTP_PATH_EXPORTS__', 'centrale/', '1', NULL),
 * (NULL, '__FTP_REMOTE_ID__', '5', '3', NULL,
 */
	
// Detect Device/Operating System
$agent = $_SERVER ['HTTP_USER_AGENT'];

if (preg_match ( '/Linux/i', $agent ))
	myDefine('__OS__', 'Linux' );
elseif (preg_match ( '/Mac/i', $agent ))
	myDefine('__OS__', 'Mac' );
elseif (preg_match ( '/iPhone/i', $agent ))
	myDefine('__OS__', 'iPhone' );
elseif (preg_match ( '/iPad/i', $agent ))
	myDefine('__OS__', 'iPad' );
elseif (preg_match ( '/Droid/i', $agent ))
	myDefine('__OS__', 'Droid' );
elseif (preg_match ( '/Unix/i', $agent ))
	myDefine('__OS__', 'Unix' );
elseif (preg_match ( '/Windows/i', $agent ))
	myDefine('__OS__', 'Windows' );
else
	myDefine('__OS__', 'Unknown' );


function myDefine($var, $value) {

	if (! defined($var)) 	define($var, $value);
}
?>	