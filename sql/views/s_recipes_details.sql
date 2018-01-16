
CREATE OR REPLACE 

VIEW recipes_details AS

SELECT *

FROM recipes

JOIN recipes_lines
  ON rec_id  = rel_rec_id
  
WHERE isnull(rec_flag)

ORDER BY rel_rec_id ASC, rel_qte DESC
