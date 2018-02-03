<?php

CREATE OR REPLACE 

VIEW app_logs_details AS

SELECT * FROM app_logs

JOIN app_logs_types ON log_lty_id = lty_id

LEFT JOIN users ON log_usr_id = usr_id

