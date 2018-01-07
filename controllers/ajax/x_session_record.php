<?php
session_start ();
// require('x_common.inc.php');

foreach ( $_POST as $key => $value ) {
	
	$_SESSION [$key] = $_POST [$key];
}

/*
 * appel :
 * $.post(
 * "~{$smarty.const.__CONTROLLERS_AJAX__}~x_session_record.php",
 * {
 * key1 : value1,
 * key2 : value2,
 * key3 : value3...
 * }
 * );
 */

?>