<?php

// load/reload des [param] de $_GET et $_POST
$_param = [ ];
$oSmarty->clearAssign ( '_param' );

if ( isset($_SESSION['__params__']) ) {
	
	foreach ( $_SESSION['__params__'] as $key => $value ) {
		
		if (substr ( $key, 0, 5 ) == 'param') {
			
			$_param [substr ( $key, 5 )] = $value;
		}
	}
	unset($_SESSION['__params__']);
}
foreach ( $_GET as $key => $value ) {
	
	if (substr ( $key, 0, 5 ) == 'param') {
		
		$_param [substr ( $key, 5 )] = $value;
	}
}
foreach ( $_POST as $key => $value ) {
	
	if (substr ( $key, 0, 5 ) == 'param') {
		
		$_param [substr ( $key, 5 )] = $value;
	}
}

$_param ['query'] = (empty ( $_param ['query'] ) ? '' : $_param ['query']); // complément du WHERE des ::getALL
$_param ['query'] .= (empty ( $_param ['seek'] ) ? '' : $_param ['seek']); // filtrage sur datatable
                                                                       
// liste à étendre : caracteres refusés en url
$pattern = array (
		'/_CS_SUP_/',
		'/_CS_INF_/',
		'/_CS_APOS_/',
		'/_CS_PCT_/' 
);
$replace = array (
		'>',
		'<',
		"'",
		'%' 
);
$_param ['query'] = preg_replace ( $pattern, $replace, $_param ['query'] );

$oSmarty->assign ( '_param', $_param );

if (! empty ( $_param ['alert'] ))		$oSmarty->assign ( 'ctrlMessage', $_param ['alert'] );

?>