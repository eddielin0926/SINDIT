CREATE (vgr_actual_pos_horizontal:TIMESERIES {id_short: "vgr_actual_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_actual_pos_horizontal", description: "Measures the current actual horizontal position of the Vacuum Suction Gripper", connection_topic: "ns=3;s=\"gtyp_VGR\".\"Horizontal_Axis\".\"di_Actual_Position\"", connection_keyword: ""})-[:HAS_UNIT]->(mm:UNIT {id_short: "mm", iri: "www.sintef.no/sindit/identifiers/units/mm", description: "Distance measurement in millimeters"})<-[:HAS_UNIT]-(hbw_actual_pos_horizontal:TIMESERIES {id_short: "hbw_actual_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_actual_pos_horizontal", description: "Measures the current actual horizontal position of the High Bay Warehouse", connection_topic: "ns=3;s=\"gtyp_HBW\".\"Horizontal_Axis\".\"di_Actual_Position\"", connection_keyword: ""})<-[:DETECTABLE_WITH]-(`hbw_crane_stuck_01`:EXPERT_ANNOTATION_INSTANCE {id_short: "hbw_crane_stuck_01", iri: "www.sintef.no/aas_identifiers/learning_factory/annotations/hbw_crane_stuck_01", description: "High Bay Warehouse crane did get stuck in horizontal layer", solution_proposal: "Recalibrate the horizontal layer of the crane", begin_datetime: "2022-06-07T11:49:27.490864", end_datetime: "2022-06-07T11:49:34.456755", predictable_since: ""})-[:DETECTABLE_WITH]->(hbw_target_pos_horizontal:TIMESERIES {id_short: "hbw_target_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_target_pos_horizontal", description: "Provides the currently targeted horizontal position of the High Bay Warehouse", connection_topic: "ns=3;s=\"gtyp_HBW\".\"Horizontal_Axis\".\"di_Target_Position\"", connection_keyword: ""})<-[:HAS_TIMESERIES]-(hbw:MACHINE {id_short: "hbw", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/hbw", description: "High Bay Warehouse", similarity_vec: "[234,232,12,6,234,234]"})-[:HAS_TIMESERIES]->(hbw_actual_pos_horizontal)-[:RUNTIME_ACCESS]->(learning_factory_opc_ua:RUNTIME_CONNECTION {id_short: "learning_factory_opc_ua", iri: "www.sintef.no/aas_identifiers/learning_factory/connections/opc_ua", description: "Provides access to timeseries data via OPC UA", type: "OPC_UA", host_environment_variable: "FACTORY_OPC_UA_HOST", port_environment_variable: "FACTORY_OPC_UA_PORT"})<-[:RUNTIME_ACCESS]-(hbw_target_pos_horizontal)-[:DB_ACCESS]->(learning_factory_influx_db:DATABASE_CONNECTION {id_short: "learning_factory_influx_db", iri: "www.sintef.no/aas_identifiers/learning_factory/databases/learning_factory_influx_db", description: "Provides access to timeseries data  via InfluxDB", type: "INFLUX_DB", host_environment_variable: "INFLUX_DB_HOST", port_environment_variable: "INFLUX_DB_PORT", database: "sindit", group: "sindit"})<-[:DB_ACCESS]-(factory_temperature:TIMESERIES {id_short: "factory_temperature", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_temperature", description: "The environment temperature of the factory", connection_topic: "i/bme680", connection_keyword: "t"})<-[:HAS_TIMESERIES]-(vgr:MACHINE {id_short: "vgr", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/vgr", description: "Vacuum Suction Gripper 24 V", similarity_vec: "[232,232,21,9,230,189]", visualization_positioning_x: 100, visualization_positioning_y: 100})-[:HAS_TIMESERIES]->(vgr_actual_pos_horizontal)-[:DB_ACCESS]->(learning_factory_influx_db)<-[:DB_ACCESS]-(vgr_target_pos_horizontal:TIMESERIES {id_short: "vgr_target_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_target_pos_horizontal", description: "Provides the currently targeted horizontal position of the Vacuum Suction Gripper", connection_topic: "ns=3;s=\"gtyp_VGR\".\"Horizontal_Axis\".\"di_Target_Position\"", connection_keyword: ""})-[:RUNTIME_ACCESS]->(learning_factory_opc_ua),
(hbw_actual_pos_horizontal)-[:DB_ACCESS]->(learning_factory_influx_db),
(hbw_step_cad:FILE {id_short: "hbw_step_cad", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_step_cad", description: "CAD model", type: "CAD_STEP", file_name: "HighBayWarehouse.STEP", creation_date: "18.03.2020"})-[:DB_ACCESS]->(`learning_factory_minio_s3`:DATABASE_CONNECTION {id_short: "learning_factory_minio_s3", iri: "www.sintef.no/aas_identifiers/learning_factory/databases/learning_factory_minio_s3", description: "Provides access to binary files stored via the Amazon S3 API", type: "S3", host_environment_variable: "MINIO_S3_HOST", port_environment_variable: "MINIO_S3_PORT", database: "sindit", group: "sindit"})<-[:DB_ACCESS]-(:FILE {id_short: "hbw_user_manual_pdf", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_user_manual_pdf", description: "User manual", type: "PDF", file_name: "HighBayWarehouse.pdf", creation_date: "18.03.2020"})<-[:HAS_FILE]-(hbw)-[:HAS_TIMESERIES]->(factory_temperature)-[:RUNTIME_ACCESS]->(:RUNTIME_CONNECTION {id_short: "learning_factory_mqtt", iri: "www.sintef.no/aas_identifiers/learning_factory/connections/mqtt", description: "Provides access to timeseries data  via MQTT", type: "MQTT", host_environment_variable: "FACTORY_MQTT_HOST", port_environment_variable: "FACTORY_MQTT_Port"}),
(`hbw_crane_stuck_01`)<-[:HAS_FINDING]-(hbw)-[:HAS_FILE]->(hbw_step_cad),
(`hbw_crane_stuck_01`)-[:FINDING_TYPE]->(:EXPERT_FINDING_TYPE {id_short: "crane_stuck", iri: "www.sintef.no/aas_identifiers/expert_finding_types/crane_stuck", description: "A movable crane got physically stuck and could not reach its target position", solution_proposal: "Recalibrate the crane"}),
(vgr_actual_pos_horizontal)-[:RUNTIME_ACCESS]->(learning_factory_opc_ua),
(hbw)-[:PRODUCT_FLOW]->(vgr)<-[:SIMILARITY_MEASURE {similarity_distance: 2}]-(hbw),
(mm)<-[:HAS_UNIT]-(vgr_target_pos_horizontal)<-[:HAS_TIMESERIES]-(vgr)-[:HAS_FILE]->(:FILE {id_short: "vgr_step_cad", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_step_cad", description: "CAD model", type: "CAD_STEP", file_name: "VacuumSuctionGripper.STEP", creation_date: "18.03.2020"})-[:DB_ACCESS]->(`learning_factory_minio_s3`),
(hbw_target_pos_horizontal)-[:HAS_UNIT]->(mm),
(factory_temperature)-[:HAS_UNIT]->(:UNIT {id_short: "deg_celsius", iri: "www.sintef.no/sindit/identifiers/units/deg_celsius", description: "Temperature measurement in degrees celsius"})