<?php

	$docs = array_slice(scandir(__PATH_DOCS__), 2);
	$data = array();
	
	foreach ( $docs as $nom ) {
		
		$data[] = array(
			'path' => __PATH_DOCS__ .$nom,
			'nom' => substr($nom, 0, strrpos($nom, '.')),
			'type' => strtoupper(substr($nom, strrpos($nom, '.')+1))
		);
	}

	$oSmarty->assign('Documents', $data);
