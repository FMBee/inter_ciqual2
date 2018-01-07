<?php
if (isset ( $_GET ['paramdrop'] )) {
	
	Parametres::delOne ( $pdo, $_GET ['paramdrop'] );
} else {
	
	// mettre a jour $_POST, valeurs indefinies (checkbox), supprimer indesirables par unset(), chgt de types
	
	foreach ( $_POST as $key => $val ) {

		if ((substr ( $key, 0, 2 ) == 'p_') && ($val != null)) {
			
			Parametres_Parameters::majOrAddValues ( $pdo, $_POST ['paramkey'], intval ( substr ( $key, 2 ) ), $val );
			unset ( $_POST [$key] );
		}
	}
//debug ( $_POST );
	Parametres::majOrAdd ( $pdo, $_POST );
	
	App_Logs::Add ( $pdo, 4, 'modification paramètres', $_SESSION ['__user_id__'], '' );
}
?>