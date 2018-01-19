<?php
	
	function myFloatval($var) {
		
		return floatval(str_replace(',', '.', $var));
	}
	
	function setRecorded ($table, $list='') {
		
		unset( $_SESSION['__app_values__']["__$table"] );
		
		if (! empty($list)) {
	
			$_SESSION['__app_values__']["__$table"] = $list;
		}
		return true;
	}
	
	function getRecorded ($table, $field) {
		
		return $_SESSION['__app_values__']["__$table"][$field];
	}
	
	function testRecorded($table, $fields) {
	
		$data = array();
	
		foreach ($fields as $field) {
	
			$data[$field] = isset($_POST[$field]) ? $_POST[$field] : getRecorded($table, $field);
		}
		return $data;
	}
	
	function sqlDo($pdo, $sql, $fetch = 0) {
		
		$req = $pdo->prepare ( $sql );
		$result = $req->execute ();
		
		switch ($fetch) {
			
			case 0 :
				return $result;
			
			case 1 :
				return $req->fetch ( PDO::FETCH_ASSOC );
			
			case 2 :
				return $req->fetchAll ( PDO::FETCH_ASSOC );
		}
	}
	
	function codeUrl($url) {
		
		/*
		 * lorsque l'Url est configuree en footer par JS avec des parametres dynamiques
		 * on appelle le module AJAX[x_urlcode.php] avec l'url à coder
		 * qui lui renvoie la fonction codeUrl()
		 */
		// debug ($url);
		$url = htaccess ( $url );
		
		$code = '';
		$decal = rand ( 1, 9 );
		
		for($i = 0, $j = strlen ( $url ); $i < $j; $i ++) {
			
			$hex = dechex ( ord ( substr ( $url, $i, 1 ) ) );
			$code .= chr ( ord ( substr ( $hex, 0, 1 ) ) + $decal ) . chr ( ord ( substr ( $hex, 1, 1 ) ) + $decal );
		}
		
		return 'index.php?cmd=' . (empty ( $code ) ? '0' : $code .strval($decal));
	}
	
	function decodeUrl($url) {
	
		$decal = (int)substr($url, -1, 1);
		$url = substr($url, 0, -1);
		$decode = '';
		
		for($i = 0; $i < strlen ( $url ); $i += 2) {
			
			$hex = substr ( $url, $i, 2 );
			$decode .= chr ( hexdec ( chr ( ord ( substr ( $hex, 0, 1 ) ) - $decal ) . chr ( ord ( substr ( $hex, 1, 1 ) ) - $decal ) ) );
		}
		
		return $decode;
	}
	
	function htaccess($url) {
	
		$isParams = strpos ( $url, '&' );
		
		if ($isParams) {
			
			$params = substr ( $url, $isParams );
			$actionpage = substr ( $url, 0, $isParams );
		} else {
			$params = '';
			$actionpage = $url;
		}
		
		if ($url == 'index') {
			
			$url = '';
		} else {
			$pos = strpos ( $actionpage, '-' );
			
			$action = substr ( $actionpage, 0, $pos );
			$action = (empty ( $action ) ? '' : 'action=' . $action);
			
			$page = substr ( $actionpage, $pos + 1 );
			$page = (empty ( $page ) ? '' : 'page=' . $page);
			
			if (! empty ( $action ) && ! empty ( $page ))
				$action .= '&';
			
			$url = $action . $page . $params;
		}
		
		return $url;
	}
	
	function getParams($chaine) {
		
		foreach ( explode ( '&', $chaine ) as $value ) {
			
			$egal = strpos ( $value, '=' );
			
			$_GET [substr ( $value, 0, $egal )] = substr ( $value, $egal + 1 );
		}
	}
	
	// function precPageOn() { return !empty($_SERVER['HTTP_REFERER']); }
	
	function precPage($code = 0) {
		
		$last = $_SESSION ['__history__'] [count ( $_SESSION ['__history__'] ) - 2]; // avant-dernier
		
		switch ($code) {
			
			case 0 : // retourne la precedente QUERY_STRING sans l'action
				
				if (empty ( $last ['GET'] ['page'] )) {
					
					return ('-index');
				} else {
					
					$retour = preg_replace( 
								array (
									'/&?action=[_a-z0-9]+&?/',
									'/page=/' 
								), 
								array (
									'', // pas d'action précédente
									'-' // - au lieu de page=
								), 
								// decodeUrl($last['QUERY'])
								decodeUrl ( $last ['GET'] ['cmd'] ) 
					);
					if (preg_match (	
							'/&paramkey=(0&.+|0$)/', // si precedente insertion
							$retour
							)) {
						$retour = '-index';
					}
					return $retour;
				}
			
			case 1 : // retourne le precedent controller/page
				
				return (empty ( $last ['GET'] ['page'] ) ? 'index' : $last ['GET'] ['page']);
		}
	}
	
	function traductLib($id, $table = 'global', $champ = 'php', $langue = null) {
		
		settype ( $id, 'string' );
		
		if (onSession ()) {
			$langue = (is_null ( $langue ) ? $_SESSION ['__user_lang__'] : $langue);
		} else {
			$langue = explode ( ',', $_SERVER ['HTTP_ACCEPT_LANGUAGE'] );
			$langue = strtolower ( substr ( rtrim ( $langue [0] ), 0, 2 ) );
			$langue = (is_null ( $langue ) ? __LANG_DEFAULT__ : $langue);
		}
		
		return $_SERVER ['__translate__'] [$table] [$langue] [$champ] [trim ( $id )];
	}
	
	function maj_lang_ss($cod_langue) {
		
		global $pdo;
		
		if (! isset ( $_SESSION ['__user_lang__'] ) || $cod_langue != $_SESSION ['__user_lang__']) {
			// $_SESSION['__user_form_lang__'] = "";
			
			foreach ( App_Languages::getAllLanguages ( $pdo ) as $langue ) {
				if ($langue ['lng_code'] == $cod_langue) {
					$_SESSION ['__user_form_lang__'] = $langue ['lng_form_code'];
				}
			}
			$_SESSION ['__user_lang__'] = $cod_langue;
		}
	}
	
	
	function onSession() {
		
		return isset ( $_SESSION ['__user_id__'] );
	}
	function maj_user_ss($data) {
		
		$_SESSION['__user_id__'] 		= $data['usr_id'];
		$_SESSION ['__user_name__'] 	= $data ['usr_first_name'] . ' ' . $data ['usr_last_name'];
		$_SESSION ['__user_login__'] 	= $data ['usr_login'];
		$_SESSION ['__user_password__'] = $data ['usr_password'];
		$_SESSION ['__user_mail__'] 	= $data ['usr_mail'];
		$_SESSION ['__user_pro_id__'] 	= $data ['usr_pro_id'];
		$_SESSION ['__user_profil__'] 	= $data ['pro_name'];
		$_SESSION ['__user_access__'] 	= $data ['pro_access'];
		$_SESSION ['__user_lang__']	 	= $data ['usr_lang'];
		$_SESSION ['__user_form_lang__'] = __FORM_LANG_DEFAULT__;
		$_SESSION ['__user_image__'] 	= $data ['usr_image_path'];
		
		$_SESSION ['__admin_mode__'] 	= ($data ['pro_access'] > __ADMIN_MINACCESS__);
		$_SESSION ['__root_mode__'] 	= ($data ['pro_access'] == '999');
		
		if ($_SERVER ['__app_params__'] ['__APP_INTERNATIONAL__']) {
			maj_lang_ss ( $data ['usr_lang'] );
		}
		
		// positionnement recette de départ
		$recipy = Recipes::getFirst( $GLOBALS['pdo'] );
		
		if ( count($recipy) == 0 ) {

			$_SESSION['_recipy'] = null;
		}
		else{
			$_SESSION['_recipy']['rec_id'] = trim($recipy[0]['rec_id']);
			$_SESSION['_recipy']['rec_title'] = trim($recipy[0]['rec_title']);
			$_SESSION['_recipy']['rec_label'] = trim($recipy[0]['rec_label']);
		}
	}
	
	function maj_options_ss($data) {
		
		// $_SESSION['__cli_create_daily_tasks__'] = $data['cpa_create_daily_tasks'];
		// $_SESSION['__cli_pms_wizard_enabled__'] = $data['cpa_pms_wizard_enabled'];
		// $_SESSION['__cli_default_temp_rec__'] = $data['cpa_default_temp_rec'];
		// $_SESSION['__cli_default_temp_fridge__'] = $data['cpa_default_temp_fridge'];
		// $_SESSION['__cli_delay_sup__'] = $data['cpa_delay_sup'];
		// $_SESSION['__cli_async_rec_send__'] = $data['cpa_async_rec_send'];
		// $_SESSION['__cli_multi_tasks_close__'] = $data['cpa_multi_tasks_close'];
		// $_SESSION['__cli_histo_tasks_days__'] = $data['cpa_histo_tasks_days'];
		// $_SESSION['__cli_idle_delay__'] = $data['cpa_idle_delay'] * 60000 ; //en ms
	}
	
	function debug($var) {
		// global $debug;
		$debug = (isset ( $_SERVER ['__app_params__'] ['__APP_DEBUG__'] ) ? $_SERVER ['__app_params__'] ['__APP_DEBUG__'] : false);
		
		if ($debug) {
			if (func_num_args () == 2) { // true : vers console
				print_r ( $var );
			} else {
				echo "\n<!-- ";
				print_r ( $var );
				echo " -->\n";
			}
		} else {
			if (! isset ( $_SERVER ['__app_params__'] ['__APP_DEBUG__'] ))
				echo "\n<!-- debugger non paramétré -->\n";
		}
	}
	
	function trim_value(&$value) {
		
		$value = trim ( $value );
	}

