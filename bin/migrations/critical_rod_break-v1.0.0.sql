
-- business_config_critical_rod_break definition

CREATE TABLE business_config_critical_rod_break (
	business_unit_id int NOT NULL,
	critical_rod_break_warn int NULL,
	critical_rod_break_alarm int NULL,
	CONSTRAINT business_config_critical_rod_break_pk PRIMARY KEY (business_unit_id)
);

-- link_up_config_critical_rod_break definition

CREATE TABLE link_up_config_critical_rod_break (
	link_up_id int NOT NULL,
	critical_rod_break_warn int NULL,
	critical_rod_break_alarm int NULL,
	CONSTRAINT link_up_config_critical_rod_break_pk PRIMARY KEY (link_up_id)
);

-- critical_rod_break definition

CREATE TABLE critical_rod_break (
	critical_rod_break_id int IDENTITY(1,1) NOT NULL,
	link_up_id int NOT NULL,
	parameter_name varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	critical_rod_break_tipe varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	critical_rod_break_warn decimal(20,2) NULL,
	critical_rod_break_alarm decimal(20,2) NULL,
	critical_rod_break_bottom_warn decimal(20,2) NULL,
	critical_rod_break_bottom_alarm decimal(20,2) NULL,
	critical_rod_break_unit varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'mbar' NOT NULL,
	critical_rod_break_display_type varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'gauge' NOT NULL,
	CONSTRAINT critical_rod_break_pk PRIMARY KEY (critical_rod_break_id)
);


-- history_critical_rod_break definition

CREATE TABLE history_critical_rod_break (
	history_critical_rod_break_id int IDENTITY(1,1) NOT NULL,
	critical_rod_break_id int NOT NULL,
	value decimal(20,2) NOT NULL,
	warning_limit decimal(20,2) NULL,
	alarm_limit decimal(20,2) NULL,
	warning_limit_bottom decimal(20,2) NULL,
	alarm_limit_bottom decimal(20,2) NULL,
	processed bit DEFAULT 0 NOT NULL,
	created_at datetime DEFAULT getutcdate()  NOT NULL,
	CONSTRAINT history_critical_rod_break_pk PRIMARY KEY (history_critical_rod_break_id)
);
 CREATE NONCLUSTERED INDEX history_critical_rod_break_id_IDX ON history_critical_rod_break (  critical_rod_break_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_critical_rod_break_id_created_at_IDX ON history_critical_rod_break (  critical_rod_break_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_critical_rod_break_created_at_IDX ON history_critical_rod_break (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_critical_rod_break_id_processed_IDX ON history_critical_rod_break (  critical_rod_break_id ASC  , processed ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;

-- versioning
CREATE TABLE version_critical_rod_break (
    version varchar(10) NOT NULL
)
INSERT INTO version_critical_rod_break (version) VALUES ('1.0.0')