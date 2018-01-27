<?php

class Recipes {
	
	/*
	 * les recettes d'un user, triées par nom
	 */
	public static function getAll($pdo) 
	{
		$req = $pdo->prepare( 'SELECT * FROM recipes_details WHERE rec_usr_id = ? GROUP BY rec_id ORDER BY rec_title' );
		
		$req->execute( [$_SESSION['__user_id__']] );
		$data = $req->fetchAll( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	
	/*
	 * une recette par id
	 */
	public static function getOne($pdo, $id) {
		
		$req = $pdo->prepare ( 'SELECT * FROM recipes_details WHERE rec_id = ?' );
		
		$req->execute( [$id] );
		$data = $req->fetchAll( PDO::FETCH_ASSOC );
		
		return ($data);
	}

	/*
	 * la dernière recette du user
	 */
	public static function getFirst($pdo) {
		
		$req = $pdo->prepare ( 'SELECT * FROM recipes_details WHERE rec_usr_id = ? ORDER BY rec_id DESC LIMIT 1' );
		
		$req->execute( [$_SESSION['__user_id__']] );
		$data = $req->fetchALL( PDO::FETCH_ASSOC );
		
		return ($data);
	}

	/*
	 * suppression de recette par id
	 */
	public static function delOne($pdo, $id)
	{
  		$req = $pdo->prepare("UPDATE recipes SET rec_flag = 'D' WHERE rec_id = ?");
		
		$req->execute( [$id] );
		
		return true;
	}
	
	/*
	 * maj d'une entete de recette par id ou creation
	 */
	public static function majOrAdd($pdo, $data) 
	{
		$req = $pdo->prepare( 'CALL recipes_mjad(' . substr ( str_repeat ( '?,', count ( $data ) ), 0, - 1 ) . ', @retour)' );

		$req->execute( $data );
		
		$retour = $pdo->query( "SELECT @retour" )->fetch ( PDO::FETCH_ASSOC );

		return ($retour ['@retour']);
	}

	/*
	 * maj d'une ligne de recette par id ou creation
	 */
	public static function majOrAddLine($pdo, $data) 
	{
		$req = $pdo->prepare( 'CALL recipes_lines_mjad(' . substr ( str_repeat ( '?,', count ( $data ) ), 0, - 1 ) . ', @retour)' );

		$req->execute( $data );
		
		$retour = $pdo->query( "SELECT @retour" )->fetch ( PDO::FETCH_ASSOC );

		return ($retour ['@retour']);
	}
	
	/*
	 * supp d'une ligne de recette par id
	 */
	public static function deleteLine($pdo, $data)
	{
		$req = $pdo->prepare('DELETE FROM recipes_lines WHERE rel_id = ?');
	
		$req->execute( $data );
		
		return true;
	}
	
	public static function generateLabel($pdo, $id) {
		
		return 'Valeurs nutri';
	}
}

?>