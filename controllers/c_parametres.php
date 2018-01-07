<?php

	if ($_param ['key'] != '0') {
		
		$oSmarty->assign ( 'Parametres', Parametres::getOne ( $pdo, $_param ['key'] ) );
	}

?>