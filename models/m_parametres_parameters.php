<?php
class Parametres_Parameters {
	public static function getAll($pdo) {
		$req = $pdo->prepare ( 'SELECT * FROM parametres_parameters ORDER BY ppa_order' );
		
		$req->execute ();
		$data = $req->fetchAll ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function getOne($pdo, $id) {
		$data = $pdo->query ( 'SELECT * FROM parametres_parameters WHERE ppa_id = ' . $this->id )->

		fetch ( PDO::FETCH_ASSOC );
		return ($data);
	}
	public static function getAllValues($pdo, $par_id) {
		$req = $pdo->prepare ( 'SELECT * FROM parametres_parameters_details WHERE ppv_par_id = ? ORDER BY ppa_order' );
		
		$req->execute ( array (
				$par_id 
		) );
		$data = $req->fetchAll ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
	public static function majOrAddValues($pdo, $par_id, $ppa_id, $ppv_value) {
		$req = $pdo->prepare ( 'CALL parametres_parameters_values_mjad( ?, ?, ? )' );
		
		$insert = $req->execute ( array (
				$par_id,
				$ppa_id,
				$ppv_value 
		) );
		
		return ($req);
	}
}

/*
 * INSERT INTO `parametres_parameters` (`ppa_id`, `ppa_par_id`, `ppa_name`, `ppa_type`, `ppa_length`, `ppa_validation`, `ppa_default`, `ppa_default_when`, `ppa_readonly`, `ppa_placeholder`, `ppa_input_mode`, `ppa_values_list`, `ppa_required`, `ppa_order`,`ppa_flag`)
 * VALUES
 * (1, 1, 'Refroidissement rapide', 'separator', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20, NULL),
 * (2, 1, 'Date du traitement', 'date', 0, '', '', 1, 0, '', 'calendar', '', 1, 5, NULL),
 * (3, 1, 'Température de suivi', 'varchar', 0, '> 5', '', 0, 0, '', 'list', '0|5|8|12', 0, 10, NULL),
 * (4, 1, 'Fin de cuisson', 'date_hour', 0, '>= getdate()', 'date(''d/m/Y h:i'')', 1, 0, '', 'calendar', '', 2, 25, NULL),
 * (5, 1, 'Commentaire', 'varchar', 255, NULL, NULL, 1, 0, 'Commentaire', 'textarea', NULL, 1, 15, NULL);
 *
 * INSERT INTO parametres_parameters_values
 * (ppv_par_id, ppv_ppa_id, ppv_value)
 * VALUES
 * (1, 1, NULL),
 * (1, 2, '2017-07-14 12:34'),
 * (1, 3, '5'),
 * (1, 4, '2017-07-14 16:34'),
 * (1, 5, 'ça marche');
 *
 */
?>