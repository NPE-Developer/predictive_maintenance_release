-- business_config_centerline

CREATE TABLE business_config_centerline (
    business_unit_id int NOT NULL,
	centerline_warn int NULL,
	centerline_alarm int NULL,
	CONSTRAINT business_config_centerline_pk PRIMARY KEY (business_unit_id)
);

-- link_up_config_centerline

CREATE TABLE link_up_config_centerline (
    link_up_id int NOT NULL,
	centerline_warn int NULL,
	centerline_alarm int NULL,
	CONSTRAINT link_up_config_centerline_pk PRIMARY KEY (link_up_id)
);

-- centerline definition

CREATE TABLE centerline (
	centerline_id int IDENTITY(1,1) NOT NULL,
	link_up_id int NOT NULL,
	parameter_name varchar(200) NOT NULL,
	centerline_tipe varchar(200) NOT NULL,
	centerline_warn int NULL,
	centerline_alarm int NULL
	CONSTRAINT centerline_pk PRIMARY KEY (centerline_id)
);

-- history_centerline definition

CREATE TABLE history_centerline (
	history_centerline_id int IDENTITY(1,1) NOT NULL,
	centerline_id int NOT NULL,
	value decimal(20,2) NOT NULL,
	warning_limit decimal(20,2) NOT NULL,
	alarm_limit decimal(20,2) NOT NULL,
	created_at datetime DEFAULT getutcdate()  NOT NULL,
	CONSTRAINT history_centerline_pk PRIMARY KEY (history_centerline_id)
);
 CREATE NONCLUSTERED INDEX history_centerline_created_at_IDX ON history_centerline (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_centerline_centerline_id_IDX ON history_centerline (  centerline_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_centerline_centerline_id_created_at_IDX ON history_centerline (  centerline_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;

-- versioning
CREATE TABLE version_centerline (
    version varchar(10) NOT NULL
)
INSERT INTO version_centerline (version) VALUES ('1.0')