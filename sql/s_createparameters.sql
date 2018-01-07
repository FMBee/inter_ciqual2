
CREATE PROCEDURE parametres_parameters_mjad(
									IN  _ppa_id             INT(255),
                                    IN  _ppa_par_id         INT(255),
                                    IN  _ppa_name           VARCHAR(255),
                                    IN  _ppa_type           VARCHAR(255),
                                    IN  _ppa_length         FLOAT,
                                    IN  _ppa_default        VARCHAR(255),
                                    IN  _ppa_input_mode     VARCHAR(255),
                                    IN  _ppa_values_list    VARCHAR(500),
                                    IN  _ppa_default_when   INT(255),
                                    IN  _ppa_validation     VARCHAR(255),
                                    IN  _ppa_readonly       INT(10),
                                    IN  _ppa_placeholder    VARCHAR(255),
                                    IN  _ppa_required       INT(10),
                                    IN  _ppa_order          INT(255),
                                    OUT _insertedid         INT(255))
    MODIFIES SQL DATA
    COMMENT 'Gestion des paramètres'
BEGIN
   SELECT 0
     INTO _insertedid;

   IF _ppa_id <= 0
   THEN
      INSERT INTO parametres_parameters(ppa_par_id,
                                        ppa_name,
                                        ppa_type,
                                        ppa_length,
                                        ppa_validation,
                                        ppa_default,
                                        ppa_default_when,
                                        ppa_readonly,
                                        ppa_placeholder,
                                        ppa_input_mode,
                                        ppa_values_list,
                                        ppa_required,
                                        ppa_order
                                        )
           VALUES (_ppa_par_id,
                   _ppa_name,
                   _ppa_type,
                   _ppa_length,
                   _ppa_validation,
                   _ppa_default,
                   _ppa_default_when,
                   _ppa_readonly,
                   _ppa_placeholder,
                   _ppa_input_mode,
                   _ppa_values_list,
                   _ppa_required,
                   _ppa_order
                   );

      SELECT LAST_INSERT_ID()
        INTO _insertedid;
   ELSE
      UPDATE parametres_parameters
         SET ppa_par_id = _ppa_par_id,
             ppa_name = _ppa_name,
             ppa_type = _ppa_type,
             ppa_length = _ppa_length,
             ppa_validation = _ppa_validation,
             ppa_default = _ppa_default,
             ppa_default_when = _ppa_default_when,
             ppa_readonly = _ppa_readonly,
             ppa_placeholder = _ppa_placeholder,
             ppa_input_mode = _ppa_input_mode,
             ppa_values_list = _ppa_values_list,
             ppa_required = _ppa_required,
             ppa_order = _ppa_order
       WHERE ppa_id = _ppa_id;

      SELECT _ppa_id
        INTO _insertedid;
   END IF;
END

CREATE PROCEDURE parametres_parameters_values_mjad(
											 IN  _par_id       INT(255),
                              				 IN  _ppa_id       INT(255),
                              				 IN  _value        VARCHAR(255))
    MODIFIES SQL DATA
BEGIN
	DECLARE _ppv_id INT(255);
	
	SELECT ppv_id
	INTO   _ppv_id
	FROM   parametres_parameters_values
	WHERE  ppv_par_id = _par_id
	AND	   ppv_ppa_id = _ppa_id;
	
	IF _ppv_id IS NULL
	THEN
		INSERT INTO parametres_parameters_values
			(ppv_par_id, ppv_ppa_id, ppv_value) 
		VALUES (_par_id, _ppa_id, _value);
	ELSE
		UPDATE parametres_parameters_values
		SET	   ppv_value = _value
		WHERE  ppv_id = _ppv_id;
	END IF;
END

CREATE TABLE IF NOT EXISTS parametres_parameters (

  ppa_id int(255) NOT NULL COMMENT 'ID de l''enregistrement',
  ppa_par_id int(255) NOT NULL COMMENT 'Id du tracking process',
  ppa_name varchar(255) NOT NULL COMMENT 'Nom du parametre',
  ppa_type varchar(255) NOT NULL COMMENT 'Type de parametre',
  ppa_length float DEFAULT NULL COMMENT 'Longueur du parametre',
  ppa_validation varchar(255) DEFAULT NULL COMMENT 'Formule de validation',
  ppa_default varchar(255) DEFAULT NULL COMMENT 'Valeur par defaut',
  ppa_default_when int(255) DEFAULT '1',
  ppa_readonly int(10) DEFAULT '0' COMMENT 'Read only (0/1/2)',
  ppa_placeholder varchar(255) DEFAULT NULL COMMENT 'Place holder',
  ppa_input_mode varchar(255) DEFAULT NULL COMMENT 'Modalite de saisie',
  ppa_values_list varchar(500) DEFAULT NULL COMMENT 'Liste de valeurs',
  ppa_required int(10) NOT NULL DEFAULT '0' COMMENT 'Requis',
  ppa_order int(255) NOT NULL COMMENT 'Ordre de tri',
  ppa_flag varchar(1) DEFAULT NULL COMMENT 'Flag pour suppression'
) ;


CREATE TABLE IF NOT EXISTS parametres_parameters_values (

  ppv_id int(255) NOT NULL COMMENT 'ID de l enregistrement',
  ppv_par_id int(255) NOT NULL COMMENT 'ID du parametres',
  ppv_ppa_id int(255) NOT NULL COMMENT 'ID du parameters',
  ppv_value varchar(255) NOT NULL COMMENT 'Valeur du parameters'
) ;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER 
VIEW parametres_parameters_details AS 
select *
from parametres join parametres_parameters on par_id = ppa_par_id 
left join parametres_parameters_values on par_id = ppv_par_id and ppa_id = ppv_ppa_id 
where isnull(ppa_flag);


ALTER TABLE parametres_parameters
 ADD PRIMARY KEY (ppa_id), ADD KEY ppa_par_id (ppa_par_id);
 
ALTER TABLE parametres_parameters_values
 ADD PRIMARY KEY (ppv_id), ADD KEY ppv_par_id (ppv_par_id,ppv_ppa_id);

ALTER TABLE parametres_parameters
MODIFY ppa_id int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID de l enregistrement',AUTO_INCREMENT=1;

ALTER TABLE parametres_parameters_values
MODIFY ppv_id int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID de l enregistrement',AUTO_INCREMENT=1;
