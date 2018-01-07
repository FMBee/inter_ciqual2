<?php
class Parametres {
	public static function getAll($pdo, $query) 
	// Tous les Parametres
	{
		$req = $pdo->prepare ( 'SELECT * FROM parametres_details WHERE isnull(par_flag)' . $query );
		
		$req->execute ();
		$data = $req->fetchAll ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function getOne($pdo, $id) {
		$req = $pdo->prepare ( 'SELECT * FROM parametres_details WHERE par_id = ?' );
		
		$req->execute ( array (
				$id 
		) );
		$data = $req->fetch ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function searchList($pdo, $query, $values) {
		$req = $pdo->prepare ( "SELECT * FROM parametres_details	WHERE isnull(par_flag) " . $query );
		
		$req->execute ( $values );
		
		$data = $req->fetchAll ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function delOne($pdo, $id) {
		$req = $pdo->prepare ( "UPDATE parametres SET par_flag = 'D' WHERE par_id = ?" );
		
		$req->execute ( array (
				$id 
		) );
		
		return;
	}
	public static function majOrAdd($pdo, $data) {
		$req = $pdo->prepare ( "CALL parametres_mjad(" . substr ( str_repeat ( '?,', count ( $data ) ), 0, - 1 ) . ", @retour)" );
		$insert = $req->execute ( array (
				$data ['paramkey'],
				$data ['par_societe'],
				$data ['par_rue'],
				$data ['par_complement'],
				$data ['par_codepostal'],
				$data ['par_ville'],
				$data ['par_pays'],
				$data ['par_email'],
				$data ['par_responsable'],
				$data ['par_telephone'],
				$data ['par_mobile'],
				$data ['par_siret'],
				$data ['par_codenaf'],
				$data ['par_iban'],
				$data ['par_param1'],
				$data ['par_param2'],
				$data ['par_param3'],
				$data ['par_param4'],
				$data ['par_param5'],
				$data ['par_param6'],
				$data ['par_param7'],
				$data ['par_param8'],
				$data ['par_param9'],
				$data ['par_tmp1'],
				$data ['par_tmp2'],
				$data ['par_tmp3'] 
		) );
		
		$retour = $pdo->query ( "select @retour" )->fetch ( PDO::FETCH_ASSOC );
		
		return ($retour ['@retour']);
	}
}

?>