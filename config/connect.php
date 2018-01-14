<?php

// Se connecter a la base
try {
	$pdo = new PDO ( 'mysql:host=localhost;dbname=inter_ciqual2', 'root', '' );
	
	$pdo->query ( "SET NAMES UTF8" );
	
} catch ( Exception $e ) {
	echo "Problème de connexion à la base de donnée...";
	die ();
}
?>	