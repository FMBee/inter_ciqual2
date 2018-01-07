<?php

class App_Logs {
	
	public static function getAll($pdo) {
		
		$data = $pdo->query ( 'SELECT * FROM app_logs_details ORDER BY log_date DESC' )->fetchAll ( PDO::FETCH_ASSOC );
		return ($data);
	}
	
	public static function getLastLogin($pdo, $cli_id) {
		
		$data = $pdo->query ( 'SELECT * FROM app_logs_last_login WHERE log_cli_id = ' . $cli_id )->fetchAll ( PDO::FETCH_ASSOC );
		return ($data);
	}
	
	public static function Add($pdo, $lty_id, $description, $usr_id, $cli_id='') {
		
		$req = $pdo->prepare ( "CALL app_logs_add( ?, ?, ?, ?)" );
		
		$retour = $req->execute ( array (
				$lty_id,
				$description,
				$usr_id,
				$cli_id 
		) );
		return ($retour);
	}
}

/*
 * 1 Envoi alerte
 * 2 Export des données
 * 3 Login
 * 4 Action
 */
?>