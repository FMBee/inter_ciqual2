
CREATE TABLE IF NOT EXISTS app_recovery (
  rcv_id int(255) NOT NULL COMMENT 'ID de l''enregistrement',
  rcv_mail varchar(255) NOT NULL COMMENT 'Identifiant du compte',
  rcv_code varchar(30) NOT NULL COMMENT 'Code de confirmation',
  rcv_code_confirmed int(1) DEFAULT 0 NOT NULL COMMENT 'Code confirmé',
  rcv_flag int(1) DEFAULT NULL COMMENT 'flag'
);

CREATE OR REPLACE VIEW app_recovery_details AS 
select * from app_recovery ;



ALTER TABLE app_recovery
 ADD PRIMARY KEY (rcv_id),
 ADD KEY rcv_mail (rcv_mail);

ALTER TABLE app_recovery
MODIFY rcv_id int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID de l''enregistrement', AUTO_INCREMENT=1;


CREATE PROCEDURE app_recovery_mjad(
                    IN _rcv_id        INT(255),
                    IN _rcv_mail        VARCHAR(255),
                    IN _rcv_code   VARCHAR(30),
                    OUT _insertedid         INT(255))
 
    MODIFIES SQL DATA
    
BEGIN
   SELECT 0
     INTO _insertedid;

   IF _rcv_id <= 0
   THEN
      INSERT INTO app_recovery(
                                        rcv_mail,
                                        rcv_code
                                        )
           VALUES (_rcv_mail,
                   _rcv_code
                   );

      SELECT LAST_INSERT_ID()
        INTO _insertedid;
   ELSE
      UPDATE app_recovery
         SET rcv_code = _rcv_code
       WHERE rcv_mail = _rcv_mail;

      SELECT _rcv_id
        INTO _insertedid;
   END IF;
END;

          


