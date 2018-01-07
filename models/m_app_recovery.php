<?php

class App_Recovery {

	public static function getAll($pdo) {

		$data = $pdo->query ( 'SELECT * FROM app_recovery_details ORDER BY rcv_mail DESC' )->fetchAll ( PDO::FETCH_ASSOC );
		return ($data);
	}

	public static function getOne($pdo, $rcv_mail) {

		$data = $pdo->query ( 'SELECT * FROM app_recovery_details WHERE trim(rcv_mail) = \'' . $rcv_mail ."'" )->fetch( PDO::FETCH_ASSOC );
		return ($data);
	}

	public static function majOrAdd($pdo, $data) {

		$req = $pdo->prepare ( " CALL app_recovery_mjad(" . substr ( str_repeat ( '?,', count ( $data ) ), 0, - 1 ) . ")" );
		
		$retour = $req->execute ( array (
				$data['rcv_id'],
				$data['rcv_mail'], 
				$data['rcv_code'] 
		) );
		return ($retour);
	}
}

?>