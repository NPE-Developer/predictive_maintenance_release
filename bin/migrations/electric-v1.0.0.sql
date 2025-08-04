
-- business_config_electric definition

CREATE TABLE business_config_electric (
	business_unit_id int NOT NULL,
	electric_warn int NULL,
	electric_alarm int NULL,
	CONSTRAINT business_config_electric_pk PRIMARY KEY (business_unit_id)
);

-- link_up_config_electric definition

CREATE TABLE link_up_config_electric (
	link_up_id int NOT NULL,
	electric_warn int NULL,
	electric_alarm int NULL,
	CONSTRAINT link_up_config_electric_pk PRIMARY KEY (link_up_id)
);

-- electric definition

CREATE TABLE electric (
	electric_id int IDENTITY(1,1) NOT NULL,
	link_up_id int NOT NULL,
	parameter_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	electric_tipe varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	electric_warn decimal(20,2) NULL,
	electric_alarm decimal(20,2) NULL,
	electric_bottom_warn decimal(20,2) NULL,
	electric_bottom_alarm decimal(20,2) NULL,
	electric_unit varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'mbar' NOT NULL,
	electric_display_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'gauge' NOT NULL,
	CONSTRAINT electric_pk PRIMARY KEY (electric_id)
);


-- history_electric definition

CREATE TABLE history_electric (
	history_electric_id int IDENTITY(1,1) NOT NULL,
	electric_id int NOT NULL,
	value decimal(20,2) NOT NULL,
	warning_limit decimal(20,2) NULL,
	alarm_limit decimal(20,2) NULL,
	warning_limit_bottom decimal(20,2) NULL,
	alarm_limit_bottom decimal(20,2) NULL,
	processed bit DEFAULT 0 NOT NULL,
	created_at datetime DEFAULT getutcdate()  NOT NULL,
	CONSTRAINT history_electric_pk PRIMARY KEY (history_electric_id)
);
 CREATE NONCLUSTERED INDEX history_electric_id_IDX ON history_electric (  electric_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_electric_id_created_at_IDX ON history_electric (  electric_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_electric_created_at_IDX ON history_electric (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_electric_id_processed_IDX ON history_electric (  electric_id ASC  , processed ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;

-- versioning
CREATE TABLE version_electric (
    version varchar(10) NOT NULL
)
INSERT INTO version_electric (version) VALUES ('1.0.0')