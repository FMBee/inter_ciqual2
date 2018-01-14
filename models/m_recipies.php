<?php

class Recipies {
	
	public static function getAll($pdo) 
	// Tous les recipies avec ou sans root
	{
		$req = $pdo->prepare( 'SELECT * FROM recipies_details' );
		
		$req->execute();
		$data = $req->fetchAll( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	
	public static function getOne($pdo, $id) {
		
		$req = $pdo->prepare ( 'SELECT * FROM recipies_details WHERE rec_id = ?' );
		
		$req->execute( array (	$id ) );
		$data = $req->fetchAll( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	
	public static function majOrAdd($pdo, $data) 
	// Ajouter ou modifier un enregistrement
	{
		$req = $pdo->prepare( 'CALL recipies_mjad(' . substr ( str_repeat ( '?,', count ( $data ) ), 0, - 1 ) . ', @retour)' );

		$req->execute( $data );
		
		$retour = $pdo->query( "SELECT @retour" )->fetch ( PDO::FETCH_ASSOC );

		return ($retour ['@retour']);
	}

	public static function majOrAddLine($pdo, $data) 
	// Ajouter ou modifier un enregistrement
	{
		$req = $pdo->prepare( 'CALL recipies_lines_mjad(' . substr ( str_repeat ( '?,', count ( $data ) ), 0, - 1 ) . ', @retour)' );

		$req->execute( $data );
		
		$retour = $pdo->query( "SELECT @retour" )->fetch ( PDO::FETCH_ASSOC );

		return ($retour ['@retour']);
	}
}

?>