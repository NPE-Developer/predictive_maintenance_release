-- dbo.history_following_error definition

CREATE TABLE machine_config_following_error (
    machine_id int NOT NULL,
	following_error_warn int NULL,
	following_error_alarm int NULL,
	CONSTRAINT PK_machine_config_following_error PRIMARY KEY (machine_id)
);

CREATE TABLE history_following_error (
	history_following_error_id int IDENTITY(1,1) NOT NULL,
	machine_id int NOT NULL,
    following_error int NOT NULL,
	following_error_warn int NULL,
	following_error_alarm int NULL,
	created_at datetime NOT NULL,
	CONSTRAINT PK_history_following_error PRIMARY KEY (history_following_error_id)
);
 CREATE NONCLUSTERED INDEX history_following_error_created_at_IDX ON dbo.history_following_error (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_following_error_machine_id_IDX ON dbo.history_following_error (  machine_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_following_error_machine_id_created_at_IDX ON dbo.history_following_error (  machine_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;

-- versioning
CREATE TABLE version_following_error (
    version varchar(10) NOT NULL
)
INSERT INTO version_following_error (version) VALUES ('1.0')