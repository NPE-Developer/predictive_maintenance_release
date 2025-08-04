
-- business_config_safety definition

CREATE TABLE business_config_safety (
	business_unit_id int NOT NULL,
	safety_warn int NULL,
	safety_alarm int NULL,
	CONSTRAINT business_config_safety_pk PRIMARY KEY (business_unit_id)
);

-- link_up_config_safety definition

CREATE TABLE link_up_config_safety (
	link_up_id int NOT NULL,
	safety_warn int NULL,
	safety_alarm int NULL,
	CONSTRAINT link_up_config_safety_pk PRIMARY KEY (link_up_id)
);

-- safety definition

CREATE TABLE safety (
	safety_id int IDENTITY(1,1) NOT NULL,
	link_up_id int NOT NULL,
	parameter_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	safety_tipe varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	safety_warn decimal(20,2) NULL,
	safety_alarm decimal(20,2) NULL,
	safety_bottom_warn decimal(20,2) NULL,
	safety_bottom_alarm decimal(20,2) NULL,
	safety_unit varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'mbar' NOT NULL,
	safety_display_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'gauge' NOT NULL,
	CONSTRAINT safety_pk PRIMARY KEY (safety_id)
);


-- history_safety definition

CREATE TABLE history_safety (
	history_safety_id int IDENTITY(1,1) NOT NULL,
	safety_id int NOT NULL,
	value decimal(20,2) NOT NULL,
	warning_limit decimal(20,2) NULL,
	alarm_limit decimal(20,2) NULL,
	warning_limit_bottom decimal(20,2) NULL,
	alarm_limit_bottom decimal(20,2) NULL,
	processed bit DEFAULT 0 NOT NULL,
	created_at datetime DEFAULT getutcdate()  NOT NULL,
	CONSTRAINT history_safety_pk PRIMARY KEY (history_safety_id)
);
 CREATE NONCLUSTERED INDEX history_safety_id_IDX ON history_safety (  safety_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_safety_id_created_at_IDX ON history_safety (  safety_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_safety_created_at_IDX ON history_safety (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_safety_id_processed_IDX ON history_safety ( safety_id ASC  , processed ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;

-- versioning
CREATE TABLE version_safety (
    version varchar(10) NOT NULL
)
INSERT INTO version_safety (version) VALUES ('1.0.0')