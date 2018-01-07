
CREATE TABLE IF NOT EXISTS app_logs (
  log_id int(255) NOT NULL COMMENT 'ID de l''enregistrement',
  log_lty_id int(255) NOT NULL COMMENT 'ID du type de log',
  log_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date',
  log_description varchar(255) DEFAULT NULL COMMENT 'Description',
  log_cli_id int(255) DEFAULT NULL COMMENT 'ID du client',
  log_usr_id int(255) DEFAULT NULL COMMENT 'ID de l''utilisateur'
);

CREATE TABLE IF NOT EXISTS app_logs_types (
lty_id int(255) NOT NULL COMMENT 'ID de l''enregistrement',
  lty_name varchar(50) NOT NULL COMMENT 'Nom du type de log'
);

INSERT INTO app_logs_types (lty_id, lty_name) VALUES
(4, 'Action'),
(1, 'Envoi alerte'),
(2, 'Export des données'),
(3, 'Login');


CREATE OR REPLACE VIEW app_logs_details AS 
select * from app_logs 
join app_logs_types on log_lty_id = app_logs_types.lty_id
left join users on log_usr_id = usr_id;
#join clients on log_cli_id = cli_id


CREATE OR REPLACE VIEW app_logs_last_login AS 
select *, max(log_date) AS log_max_date_login 
from app_logs_details where log_lty_id = 3 
group by log_cli_id,log_usr_id,usr_first_name,usr_last_name;
#group by log_cli_id,log_usr_id,cli_name,usr_first_name,usr_last_name;


CREATE OR REPLACE VIEW app_logs_recap AS 
select *, cast(log_date as date) AS logdate, max(log_id) AS idmax 
from app_logs 
group by log_lty_id, cast(log_date as date), log_description, log_cli_id, log_usr_id;



ALTER TABLE app_logs
 ADD PRIMARY KEY (log_id),
 ADD KEY log_date (log_date), 
 ADD KEY log_lty_id (log_lty_id), 
 ADD KEY log_date_2 (log_date), 
 ADD KEY log_cli_id (log_cli_id), 
 ADD KEY log_usr_id (log_usr_id);

ALTER TABLE app_logs
MODIFY log_id int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID de l''enregistrement', AUTO_INCREMENT=1;

ALTER TABLE app_logs_types
 ADD PRIMARY KEY (lty_id), 
 ADD UNIQUE KEY lty_name (lty_name);


CREATE PROCEDURE app_logs_add(IN _lty_id        INT(255),
                     IN _description   VARCHAR(255),
                     IN _usr_id        INT(255),
                     IN _cli_id        INT(255))
    MODIFIES SQL DATA
    
BEGIN
   INSERT INTO app_logs(log_lty_id,
                     log_description,
                     log_usr_id,
                     log_cli_id)
        VALUES (_lty_id,
                _description,
                _usr_id,
                _cli_id);
END;

          


