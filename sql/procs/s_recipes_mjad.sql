CREATE PROCEDURE recipes_mjad(IN _rec_id           INT(255),
                            IN _rec_title		 VARCHAR(255),
                            IN _rec_label    		TEXT,
                            IN _usr_id		     INT(11),
                            OUT _insertedid		 INT(11) )
   MODIFIES SQL DATA 

BEGIN
   SELECT 0 into _insertedid;	#code erreur

   IF _rec_id <= 0
   THEN
      INSERT INTO recipes( 
      					rec_usr_id,
                        rec_title,
                        rec_label )
           VALUES ( 
                   _usr_id,
                   _rec_title,
                   _rec_label );

      SELECT LAST_INSERT_ID() INTO _insertedid;
      
   ELSE

      UPDATE recipes
         SET rec_title = _rec_title,
             rec_label = _rec_label
       WHERE rec_id = _rec_id;
       
       SELECT _rec_id INTO _insertedid;
   END IF;
END