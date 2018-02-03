<?php

	$oSmarty->assign ( 'App_logs', App_Logs::getAll ( $pdo, $_param ['query'] ) );

?>