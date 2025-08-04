
-- business_config_quality_factor definition

CREATE TABLE business_config_quality_factor (
	business_unit_id int NOT NULL,
	quality_factor_warn int NULL,
	quality_factor_alarm int NULL,
	CONSTRAINT business_config_quality_factor_pk PRIMARY KEY (business_unit_id)
);

-- link_up_config_quality_factor definition

CREATE TABLE link_up_config_quality_factor (
	link_up_id int NOT NULL,
	quality_factor_warn int NULL,
	quality_factor_alarm int NULL,
	CONSTRAINT link_up_config_quality_factor_pk PRIMARY KEY (link_up_id)
);

-- quality_factor definition

CREATE TABLE quality_factor (
	quality_factor_id int IDENTITY(1,1) NOT NULL,
	link_up_id int NOT NULL,
	parameter_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	quality_factor_tipe varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	quality_factor_warn decimal(20,2) NULL,
	quality_factor_alarm decimal(20,2) NULL,
	quality_factor_bottom_warn decimal(20,2) NULL,
	quality_factor_bottom_alarm decimal(20,2) NULL,
	quality_factor_unit varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'mbar' NOT NULL,
	quality_factor_display_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'gauge' NOT NULL,
	CONSTRAINT quality_factor_pk PRIMARY KEY (quality_factor_id)
);


-- history_quality_factor definition

CREATE TABLE history_quality_factor (
	history_quality_factor_id int IDENTITY(1,1) NOT NULL,
	quality_factor_id int NOT NULL,
	value decimal(20,2) NOT NULL,
	warning_limit decimal(20,2) NULL,
	alarm_limit decimal(20,2) NULL,
	warning_limit_bottom decimal(20,2) NULL,
	alarm_limit_bottom decimal(20,2) NULL,
	processed bit DEFAULT 0 NOT NULL,
	created_at datetime DEFAULT getutcdate()  NOT NULL,
	CONSTRAINT history_quality_factor_pk PRIMARY KEY (history_quality_factor_id)
);
 CREATE NONCLUSTERED INDEX history_quality_factor_id_IDX ON history_quality_factor (  quality_factor_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_quality_factor_id_created_at_IDX ON history_quality_factor (  quality_factor_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_quality_factor_created_at_IDX ON history_quality_factor (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_quality_factor_id_processed_IDX ON history_quality_factor (  quality_factor_id ASC  , processed ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;

-- versioning
CREATE TABLE version_quality_factor (
    version varchar(10) NOT NULL
)
INSERT INTO version_quality_factor (version) VALUES ('1.0.0')