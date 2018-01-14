CREATE PROCEDURE recipies_lines_mjad(
							IN _rel_id           INT(11),
							IN _rel_rec_id       INT(11),
                            IN _rel_code		 VARCHAR(20),
                            IN _rel_qte			FLOAT,
                            OUT _insertedid		 INT(11) )
   MODIFIES SQL DATA 

BEGIN
   SELECT 0 into _insertedid;	#code erreur

   IF _rel_id <= 0
   THEN
      INSERT INTO recipies_lines( 
                        rel_rec_id,
                        rel_code,
                        rel_qte)
           VALUES ( 
                   _rel_rec_id,
                   _rel_code,
                   _rel_qte );

      SELECT LAST_INSERT_ID() INTO _insertedid;
      
   ELSE

      UPDATE recipies_lines
         SET rel_rec_id = _rel_rec_id,
             rel_code = _rel_code,
             rel_qte = _rel_qte
       WHERE rel_id = _rel_id;
       
       SELECT _rel_id INTO _insertedid;
   END IF;
END