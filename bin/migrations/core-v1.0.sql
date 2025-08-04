-- dbo.grup definition

CREATE TABLE grup (
	grup_id int IDENTITY(1,1) NOT NULL,
	grup varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_grup PRIMARY KEY (grup_id),
	CONSTRAINT UQ_grup_nama UNIQUE (grup)
);

-- dbo.users definition

CREATE TABLE users (
	users_id int IDENTITY(1,1) NOT NULL,
	grup_id int NOT NULL,
	username varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	password varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_users PRIMARY KEY (users_id),
	CONSTRAINT UQ_users_username UNIQUE (username),
	CONSTRAINT FK_users_grup FOREIGN KEY (grup_id) REFERENCES grup(grup_id)
);


-- insert data for initial login
INSERT INTO grup (grup) VALUES ('Admin')
INSERT INTO users (grup_id, username) VALUES (1, 'admin')

-- dbo.business_unit definition

CREATE TABLE business_unit (
	business_unit_id int IDENTITY(1,1) NOT NULL,
	business_unit varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	business_unit_warn int NOT NULL,
	business_unit_alarm int NOT NULL,
	CONSTRAINT PK_business_unit PRIMARY KEY (business_unit_id),
	CONSTRAINT UQ_business_unit_business_unit UNIQUE (business_unit)
);

-- dbo.link_up definition

CREATE TABLE link_up (
	link_up_id int IDENTITY(1,1) NOT NULL,
	link_up varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	business_unit_id int NOT NULL,
	link_up_warn int NOT NULL,
	link_up_alarm int NOT NULL,
	CONSTRAINT PK_link_up PRIMARY KEY (link_up_id),
	CONSTRAINT UQ_link_up_link_up UNIQUE (link_up),
	CONSTRAINT FK_link_up_business_unit FOREIGN KEY (business_unit_id) REFERENCES business_unit(business_unit_id)
);


-- dbo.machine definition

CREATE TABLE machine (
	machine_id int IDENTITY(1,1) NOT NULL,
	machine varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	link_up_id int NOT NULL,
	machine_type varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	machine_warn int NOT NULL,
	machine_alarm int NOT NULL,
	gateway_host varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	gateway_port varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	pressure_slave_id int NULL,
	vibration_slave_id int NULL,
	CONSTRAINT PK_machine PRIMARY KEY (machine_id),
	CONSTRAINT FK_machine_link_up FOREIGN KEY (link_up_id) REFERENCES link_up(link_up_id)
);


-- dbo.sensor_config definition

CREATE TABLE sensor_config (
	machine_id int NOT NULL,
	pressure_max_warn int NULL,
	pressure_min_warn int NULL,
	pressure_max_alarm int NULL,
	pressure_min_alarm int NULL,
	x_warn int NULL,
	x_alarm int NULL,
	x_acc_warn int NULL,
	x_acc_alarm int NULL,
	z_warn int NULL,
	z_alarm int NULL,
	z_acc_warn int NULL,
	z_acc_alarm int NULL,
	temp_warn int NULL,
	temp_alarm int NULL,
	CONSTRAINT PK_sensor_config PRIMARY KEY (machine_id),
	CONSTRAINT FK_sensor_config_machine FOREIGN KEY (machine_id) REFERENCES machine(machine_id) ON DELETE CASCADE
);


-- dbo.history_pressure definition

CREATE TABLE history_pressure (
	history_pressure_id int IDENTITY(1,1) NOT NULL,
	machine_id int NOT NULL,
	pressure int NOT NULL,
	pressure_max_alarm int NULL,
	pressure_max_warn int NULL,
	pressure_min_alarm int NULL,
	pressure_min_warn int NULL,
	created_at datetime DEFAULT getutcdate()  NOT NULL,
	[connect] tinyint DEFAULT 0 NOT NULL,
	CONSTRAINT PK_history_pressure PRIMARY KEY (history_pressure_id),
	CONSTRAINT FK_history_pressure_machine FOREIGN KEY (machine_id) REFERENCES machine(machine_id) ON DELETE CASCADE
);
 CREATE NONCLUSTERED INDEX history_pressure_created_at_IDX ON dbo.history_pressure (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_pressure_machine_id_IDX ON dbo.history_pressure (  machine_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_pressure_machine_id_created_at_IDX ON dbo.history_pressure (  machine_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
	 
-- dbo.history_vibration definition

CREATE TABLE history_vibration (
	history_vibration_id int IDENTITY(1,1) NOT NULL,
	machine_id int NOT NULL,
	x int NOT NULL,
	x_base int NOT NULL,
	x_warn int NULL,
	x_alarm int NULL,
	z int NOT NULL,
	z_base int NOT NULL,
	z_warn int NULL,
	z_alarm int NULL,
	x_acc int NOT NULL,
	x_acc_base int NOT NULL,
	x_acc_warn int NULL,
	x_acc_alarm int NULL,
	z_acc int NOT NULL,
	z_acc_base int NOT NULL,
	z_acc_warn int NULL,
	z_acc_alarm int NULL,
	temp int NOT NULL,
	temp_warn int NULL,
	temp_alarm int NULL,
	status int NOT NULL,
	running int NOT NULL,
	created_at datetime DEFAULT getutcdate()  NOT NULL,
	CONSTRAINT PK_History PRIMARY KEY (history_vibration_id)
);
 CREATE NONCLUSTERED INDEX history_vibration_created_at_IDX ON dbo.history_vibration (  created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_vibration_machine_id_IDX ON dbo.history_vibration (  machine_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX history_vibration_machine_id_created_at_IDX ON dbo.history_vibration (  machine_id ASC  , created_at ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- versioning
CREATE TABLE version_master (
    version varchar(10) NOT NULL
)
INSERT INTO version_master (version) VALUES ('1.0')