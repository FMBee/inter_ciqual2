<?php
if ($_param ['key'] != '0') {
	
	$parameters = Parametres_Parameters::getAllValues ( $pdo, $_param ['key'] );
	debug ( $parameters );
	
	foreach ( $parameters as &$parameter ) {
		if ($parameter ['ppa_type'] != "comment") {
			if ($parameter ['ppa_type'] != "comment" && $parameter ['ppa_default'] != null) // && $treatment['tre_count'] >= $parameter['tpa_default_when']
{
				$default = $parameter ['ppa_default'];
				
				if (preg_match_all ( "#var=([0-9a-zA-Z]*)/var#", $default, $variables )) {
					debug ( $variables );
					$i = 0;
					foreach ( $variables [0] as $variable ) {
						$default = str_replace ( $variable, $variables [1] [$i], $default );
						$i ++;
						debug ( $variable . "->" . $variables [1] [$i] );
					}
				}
				
				if (preg_match_all ( "#function=([0-9a-zA-Z_\(\)\-\+\*\/\,]*)/function#", $default, $functions )) {
					debug ( $functions );
					$i = 0;
					foreach ( $functions [0] as $function ) {
						$value = "";
						$command = str_replace ( "par_id", $_param ['key'], $functions [1] [$i] );
						debug ( $command );
						eval ( "\$value = " . $command . ";" );
						
						$default = str_replace ( $function, $value, $default );
						$i ++;
						debug ( $function . "->" . $value );
					}
				}
				
				debug ( $default );
				eval ( "\$parameter['ppa_default'] = " . $default . ";" );
			} else {
				$parameter ['ppa_default'] = null;
			}
		}
	}
	$oSmarty->assign ( 'Parametres_parameters', $parameters );
	
	$oSmarty->assign ( 'Parametres', Parametres::getOne ( $pdo, $_param ['key'] ) );
}

?>