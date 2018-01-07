<?php

	if (isset ( $_GET ['paramdrop'] )) {
		
		Parametres::delOne ( $pdo, $_GET ['paramdrop'] );
	} else {
		
		// mettre a jour $_POST, valeurs indefinies (checkbox), supprimer indesirables par unset(), chgt de types
		
//debug ( $_POST );
		Parametres::majOrAdd ( $pdo, $_POST );
		
		App_Logs::Add ( $pdo, 4, 'modification paramètres', $_SESSION ['__user_id__'], '' );
	}
