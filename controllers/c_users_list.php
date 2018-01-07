<?php
$tabUsers = Users::getAll ( $pdo );

foreach ( $tabUsers as &$user ) {
	
	$user ['tag'] = ($user ['usr_out_date'] == __DATE_NULL__ ? 'IN' : 'OUT');
}

$oSmarty->assign ( 'allUsers', $tabUsers );

?>