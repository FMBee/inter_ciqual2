<?php
class Users {
	public static function getAll($pdo, $withRoot = false) 
	// Tous les users avec ou sans root
	{
		$req = $pdo->prepare ( 'SELECT * FROM users_details' . ($withRoot ? ' ' : ' WHERE pro_access != 999 AND usr_confirmed = 1 ') );
		
		$req->execute ();
		$data = $req->fetchAll ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function getAllIn($pdo) 
	// Tous les users non sortis et non root
	{
		$req = $pdo->prepare ( 'SELECT * FROM users_details WHERE pro_access != 999 AND usr_confirmed = 1 
								AND usr_out_date = \'' .__DATE_NULL__ ."'");
		
		$req->execute ();
		$data = $req->fetchAll ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function getOne($pdo, $id) {
		$req = $pdo->prepare ( 'SELECT * FROM users_details WHERE usr_id = ?' );
		
		$req->execute ( array (	$id ) );
		$data = $req->fetch ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function getOneByLogin($pdo, $login, $allUsers = false)
	/* Recherche du user par son login (y compris root)
	 * à la connexion on recherche dans les users non sortis
	 * en contrôle de login existant on recherche dans tous les users 
	 */
   	{
		$req = $pdo->prepare ( 'SELECT * FROM users_details WHERE usr_login = ?' 
								.($allUsers ? ' ' : ' AND usr_out_date = \'' .__DATE_NULL__ ."'") );
		
		$req->execute ( array (	$login ) );
		$data = $req->fetch ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function majOrAdd($pdo, $data) 
	// Ajouter ou modifier un enregistrement
	{
		$req = $pdo->prepare ( 'CALL users_mjad(' . substr ( str_repeat ( '?,', count ( $data ) ), 0, - 1 ) . ', @retour)' );

		$req->execute ( $data );
		
		$retour = $pdo->query ( "SELECT @retour" )->fetch ( PDO::FETCH_ASSOC );

		return ($retour ['@retour']);
	}
}

?>