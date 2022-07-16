CREATE (`HBW Target Pos. Vertical`:TIMESERIES {id_short: "hbw_target_pos_vertical", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_target_pos_vertical", description: "Provides the currently targeted vertical position of the High Bay Warehouse", connection_topic: "ns=3;s=\"gtyp_HBW\".\"Vertical_Axis\".\"di_Target_Position\"", connection_keyword: "", caption: "HBW Target Pos. Vertical", value_type: "INTEGER"})-[:HAS_UNIT]->(mm:UNIT {id_short: "mm", iri: "www.sintef.no/sindit/identifiers/units/mm", description: "Distance measurement in millimeters"})<-[:HAS_UNIT]-(`HBW Actual Pos. Horizontal`:TIMESERIES {id_short: "hbw_actual_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_actual_pos_horizontal", description: "Measures the current actual horizontal position of the High Bay Warehouse", connection_topic: "ns=3;s=\"gtyp_HBW\".\"Horizontal_Axis\".\"di_Actual_Position\"", connection_keyword: "", caption: "HBW Actual Pos. Horizontal", value_type: "INTEGER"})<-[:DETECTABLE_WITH]-(`hbw_crane_stuck_01`:EXPERT_ANNOTATION_INSTANCE {id_short: "hbw_crane_stuck_01", iri: "www.sintef.no/aas_identifiers/learning_factory/annotations/hbw_crane_stuck_01", description: "High Bay Warehouse crane did get stuck in horizontal layer", solution_proposal: "Recalibrate the horizontal layer of the crane", begin_datetime: "2022-06-07T11:49:27.490864", end_datetime: "2022-06-07T11:49:34.456755", predictable_since: ""})-[:DETECTABLE_WITH]->(`HBW Target Pos. Horizontal`:TIMESERIES {id_short: "hbw_target_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_target_pos_horizontal", description: "Provides the currently targeted horizontal position of the High Bay Warehouse", connection_topic: "ns=3;s=\"gtyp_HBW\".\"Horizontal_Axis\".\"di_Target_Position\"", connection_keyword: "", caption: "HBW Target Pos. Horizontal", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(HBW:ASSET {id_short: "hbw", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/hbw", description: "Automated high-bay warehouse 24V", similarity_vec: "[234,232,12,6,234,234]", caption: "HBW"})-[:HAS_TIMESERIES]->(`HBW Actual Pos. Horizontal`)-[:RUNTIME_ACCESS]->(learning_factory_opc_ua:RUNTIME_CONNECTION {id_short: "learning_factory_opc_ua", iri: "www.sintef.no/aas_identifiers/learning_factory/connections/opc_ua", description: "Provides access to timeseries data via OPC UA", type: "OPC_UA", host_environment_variable: "FACTORY_OPC_UA_HOST", port_environment_variable: "FACTORY_OPC_UA_PORT"})<-[:RUNTIME_ACCESS]-(`HBW Target Pos. Horizontal`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db:DATABASE_CONNECTION {id_short: "learning_factory_influx_db", iri: "www.sintef.no/aas_identifiers/learning_factory/databases/learning_factory_influx_db", description: "Provides access to timeseries data  via InfluxDB", type: "INFLUX_DB", host_environment_variable: "INFLUX_DB_HOST", port_environment_variable: "INFLUX_DB_PORT", database: "sindit", group: "sindit", key_environment_variable: "INFLUX_DB_TOKEN", caption: "Learning Factory InfluxDB Connection"})<-[:TIMESERIES_DB_ACCESS]-(`Factory Temperature`:TIMESERIES {id_short: "factory_temperature", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_temperature", description: "temperature compensated", connection_topic: "i/bme680", connection_keyword: "t", caption: "Factory Temperature", value_type: "DECIMAL"})<-[:HAS_TIMESERIES]-(VGR:ASSET {id_short: "vgr", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/vgr", description: "Vacuum Suction Gripper 24V", similarity_vec: "[232,232,21,9,230,189]", visualization_positioning_x: 100, visualization_positioning_y: 100, caption: "VGR"})<-[:PRODUCT_FLOW]-(HBW)-[:SIMILARITY_MEASURE {similarity_distance: 2}]->(VGR)-[:HAS_SUPPLEMENTARY_FILE_BLOCK]->(:SUPPLEMENTARY_FILE_BLOCK {id_short: "vgr_step_cad", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_step_cad", description: "CAD model", type: "CAD_STEP", file_name: "VacuumSuctionGripper.STEP", creation_date: "18.03.2020"})-[:FILE_DB_ACCESS]->(`learning_factory_minio_s3`:DATABASE_CONNECTION {id_short: "learning_factory_minio_s3", iri: "www.sintef.no/aas_identifiers/learning_factory/databases/learning_factory_minio_s3", description: "Provides access to binary files stored via the Amazon S3 API", type: "S3", host_environment_variable: "MINIO_S3_HOST", port_environment_variable: "MINIO_S3_PORT", database: "sindit", group: "sindit", key_environment_variable: "MINIO_S3_PASSWORD", user_environment_variable: "MINIO_S3_USER", caption: "Learning Factory Minio S3 Connection"})<-[:FILE_DB_ACCESS]-(`HBW Model Image JPG`:SUPPLEMENTARY_FILE {id_short: "hbw_model_image_jpg", iri: "www.sintef.no/aas_identifiers/learning_factory/files/hbw_model_image_jpg", description: "Image of the CAD model", type: "IMAGE_JPG", file_name: "hbw_model.jpg", caption: "HBW Model Image JPG"}),
(`HBW Actual Pos. Horizontal`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`Factory Temperature Raw`:TIMESERIES {id_short: "factory_temperature", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_temperature_raw", description: "temperature raw", connection_topic: "i/bme680", connection_keyword: "rt", caption: "Factory Temperature Raw", value_type: "DECIMAL"})<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`Factory Humidity`:TIMESERIES {id_short: "factory_humidity", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_humidity", description: "relative humidity compensated", connection_topic: "i/bme680", connection_keyword: "h", caption: "Factory Humidity", value_type: "DECIMAL"})<-[:HAS_TIMESERIES]-(MPO:ASSET {id_short: "mpo", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/mpo", description: "Multi-processing station with kiln 24V", similarity_vec: "[234,232,12,6,234,234]", caption: "MPO"})-[:HAS_TIMESERIES]->(`Factory Humidity Raw`:TIMESERIES {id_short: "factory_humidity_raw", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_humidity_raw", description: "relative humidity raw", connection_topic: "i/bme680", connection_keyword: "rh", caption: "Factory Humidity Raw", value_type: "DECIMAL"})<-[:HAS_TIMESERIES]-(SLD:ASSET {id_short: "sld", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/sld", description: "Sorting line with colour recognition 24V", similarity_vec: "[234,232,12,6,234,234]", caption: "SLD"})-[:HAS_TIMESERIES]->(`Factory Air Pressure`:TIMESERIES {id_short: "factory_air_pressure", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_air_pressure", description: "air pressure", connection_topic: "i/bme680", connection_keyword: "p", caption: "Factory Air Pressure", value_type: "DECIMAL"})<-[:HAS_TIMESERIES]-(SSC:ASSET {id_short: "ssc", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/ssc", description: "Environmental station with surveillance camera 24V", similarity_vec: "[234,232,12,6,234,234]", caption: "SSC"})-[:HAS_TIMESERIES]->(`Factory Gas Resistance`:TIMESERIES {id_short: "factory_gas_resistance", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_gas_resistance", description: "gas resistance", connection_topic: "i/bme680", connection_keyword: "gr", caption: "Factory Gas Resistance", value_type: "DECIMAL"})<-[:HAS_TIMESERIES]-(DPS:ASSET {id_short: "dps", iri: "www.sintef.no/aas_identifiers/learning_factory/machines/dps", description: "Input/output station with colour detection and NFC Reader 24V", similarity_vec: "[234,232,12,6,234,234]", caption: "DPS"})-[:HAS_TIMESERIES]->(`Factory Index Air Quality`:TIMESERIES {id_short: "factory_index_air_quality", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_index_air_quality", description: "index air quality 0-500 (0...50:Good, 51...100:Moderate, 101...150:Unhealthy for Sensitive Groups, 151...200:Unhealthy, 201...300:Very Unhealthy, 301...500:Hazardous)", connection_topic: "i/bme680", connection_keyword: "iaq", caption: "Factory Index Air Quality", value_type: "INTEGER"}),
(hbw_step_cad:SUPPLEMENTARY_FILE {id_short: "hbw_step_cad", iri: "www.sintef.no/aas_identifiers/learning_factory/files/hbw_step_cad", description: "CAD model", type: "CAD_STEP", file_name: "hbw.step"})-[:FILE_DB_ACCESS]->(`learning_factory_minio_s3`)<-[:FILE_DB_ACCESS]-(:SUPPLEMENTARY_FILE_BLOCK {id_short: "hbw_user_manual_pdf", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_user_manual_pdf", description: "User manual", type: "DOCUMENT_PDF", file_name: "HighBayWarehouse.pdf", creation_date: "18.03.2020"})<-[:HAS_SUPPLEMENTARY_FILE_BLOCK]-(HBW)-[:HAS_TIMESERIES]->(`Factory Temperature`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt:RUNTIME_CONNECTION {id_short: "learning_factory_mqtt", iri: "www.sintef.no/aas_identifiers/learning_factory/connections/mqtt", description: "Provides access to timeseries data  via MQTT", type: "MQTT", host_environment_variable: "FACTORY_MQTT_HOST", port_environment_variable: "FACTORY_MQTT_Port"})<-[:RUNTIME_ACCESS]-(`Factory Temperature Raw`)-[:HAS_UNIT]->(deg_celsius:UNIT {id_short: "deg_celsius", iri: "www.sintef.no/sindit/identifiers/units/deg_celsius", description: "Temperature measurement in degrees celsius"}),
(`hbw_crane_stuck_01`)<-[:HAS_FINDING]-(HBW)-[:HAS_SUPPLEMENTARY_FILE]->(hbw_step_cad),
(`hbw_crane_stuck_01`)-[:FINDING_TYPE]->(:EXPERT_FINDING_TYPE {id_short: "crane_stuck", iri: "www.sintef.no/aas_identifiers/expert_finding_types/crane_stuck", description: "A movable crane got physically stuck and could not reach its target position", solution_proposal: "Recalibrate the crane"}),
(`HBW active-status`:TIMESERIES {id_short: "hbw_active_status", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_active_status", description: "", connection_topic: "f/i/state/hbw", connection_keyword: "active", caption: "HBW active-status", value_type: "BOOLEAN"})<-[:HAS_TIMESERIES]-(`HBW Target Pos. Horizontal`)-[:HAS_UNIT]->(mm)<-[:HAS_UNIT]-(`VGR Actual Pos. Vertical`:TIMESERIES {id_short: "vgr_actual_pos_vertical", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_actual_pos_vertical", description: "", connection_topic: "ns=3;s=\"gtyp_VGR\".\"vertical_Axis\".\"di_Actual_Position\"", connection_keyword: "", caption: "VGR Actual Pos. Vertical", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`VGR Target Pos. Vertical`:TIMESERIES {id_short: "vgr_target_pos_vertical", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_target_pos_vertical", description: "", connection_topic: "ns=3;s=\"gtyp_VGR\".\"vertical_Axis\".\"di_Target_Position\"", connection_keyword: "", caption: "VGR Target Pos. Vertical", value_type: "INTEGER"}),
(:UNIT {id_short: "hPa", iri: "www.sintef.no/sindit/identifiers/units/hpa", description: "Hectopascal (unit for atmospheric pressure)"})<-[:HAS_UNIT]-(`Factory Air Pressure`)<-[:HAS_TIMESERIES]-(DPS)-[:HAS_TIMESERIES]->(`Factory Humidity Raw`)<-[:HAS_TIMESERIES]-(SSC)-[:HAS_TIMESERIES]->(`Factory Humidity`)<-[:HAS_TIMESERIES]-(SLD)-[:HAS_TIMESERIES]->(`Factory Temperature Raw`)<-[:HAS_TIMESERIES]-(MPO)-[:HAS_TIMESERIES]->(`Factory Temperature`)-[:HAS_UNIT]->(deg_celsius),
(`Factory Brightness Sensor Resistance`:TIMESERIES {id_short: "factory_brightness_sensor_resistance", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_brightness_sensor_resistance", description: "value resistance 0-15000", connection_topic: "i/ldr", connection_keyword: "ldr", caption: "Factory Brightness Sensor Resistance", value_type: "INTEGER"})-[:_RELATED]->(:UNIT {id_short: "Ohm", iri: "www.sintef.no/sindit/identifiers/units/ohm", description: "Ohm (resistance unit)"})<-[:HAS_UNIT]-(`Factory Gas Resistance`)<-[:HAS_TIMESERIES]-(SLD)-[:HAS_TIMESERIES]->(`Factory Temperature`)<-[:HAS_TIMESERIES]-(SSC)-[:HAS_TIMESERIES]->(`Factory Temperature Raw`)<-[:HAS_TIMESERIES]-(DPS)-[:HAS_TIMESERIES]->(`Factory Humidity`)-[:HAS_UNIT]->(percent:UNIT {id_short: "percent", iri: "www.sintef.no/sindit/identifiers/units/percent", description: "Percentage value"})<-[:HAS_UNIT]-(`Factory Humidity Raw`),
(`Factory Air Quality Score`:TIMESERIES {id_short: "factory_air_quality_score", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_air_quality_score", description: "air quality score 0-3 (0:IAQ invalid, 1:calibration necessary, 2:calibration done, 3:IAQ is calibrated)", connection_topic: "i/bme680", connection_keyword: "aq", caption: "Factory Air Quality Score", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(DPS)-[:HAS_TIMESERIES]->(`Factory Temperature`),
(percent)<-[:_RELATED]-(`Factory Brightness Percentage`:TIMESERIES {id_short: "factory_brightness_percentage", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/factory_brightness_percentage", description: "brightness 0-100.0 [%]", connection_topic: "i/ldr", connection_keyword: "br", caption: "Factory Brightness Percentage", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(DPS)-[:HAS_TIMESERIES]->(`Factory Brightness Sensor Resistance`)<-[:HAS_TIMESERIES]-(SSC)-[:HAS_TIMESERIES]->(`Factory Air Quality Score`)<-[:HAS_TIMESERIES]-(SLD)-[:HAS_TIMESERIES]->(`Factory Index Air Quality`)<-[:HAS_TIMESERIES]-(MPO)-[:HAS_TIMESERIES]->(`Factory Gas Resistance`)<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`Factory Air Pressure`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`Factory Humidity Raw`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`Factory Humidity`)<-[:HAS_TIMESERIES]-(HBW)-[:HAS_TIMESERIES]->(`Factory Temperature Raw`),
(`Factory Humidity`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`Factory Gas Resistance`),
(`Factory Gas Resistance`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`Factory Air Pressure`)<-[:HAS_TIMESERIES]-(HBW)-[:HAS_TIMESERIES]->(`Factory Humidity Raw`)<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`Factory Index Air Quality`)<-[:HAS_TIMESERIES]-(SSC)-[:HAS_TIMESERIES]->(`Factory Brightness Percentage`),
(`Factory Air Quality Score`)<-[:HAS_TIMESERIES]-(MPO)-[:HAS_TIMESERIES]->(`Factory Air Pressure`),
(`MPO status-code`:TIMESERIES {id_short: "mpo_status_code", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/mpo_status_code", description: "", connection_topic: "f/i/state/mpo", connection_keyword: "code", caption: "MPO status-code", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(MPO)-[:HAS_TIMESERIES]->(`Factory Brightness Percentage`)<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`Factory Brightness Sensor Resistance`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`Factory Air Quality Score`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`Factory Index Air Quality`)<-[:HAS_TIMESERIES]-(HBW)-[:HAS_TIMESERIES]->(`Factory Gas Resistance`),
(`Factory Index Air Quality`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`Factory Brightness Percentage`)<-[:HAS_TIMESERIES]-(SLD)-[:HAS_TIMESERIES]->(`SLD status-code`:TIMESERIES {id_short: "sld_status_code", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/sld_status_code", description: "", connection_topic: "f/i/state/sld", connection_keyword: "code", caption: "SLD status-code", value_type: "INTEGER"}),
(`Factory Brightness Percentage`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`Factory Brightness Sensor Resistance`)<-[:HAS_TIMESERIES]-(HBW)-[:HAS_TIMESERIES]->(`Factory Air Quality Score`)<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`VGR status-code`:TIMESERIES {id_short: "vgr_status_code", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_status_code", description: "", connection_topic: "f/i/state/vgr", connection_keyword: "code", caption: "VGR status-code", value_type: "INTEGER"}),
(`MPO active-status`:TIMESERIES {id_short: "mpo_active_status", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/mpo_active_status", description: "", connection_topic: "f/i/state/mpo", connection_keyword: "active", caption: "MPO active-status", value_type: "BOOLEAN"})<-[:HAS_TIMESERIES]-(MPO)-[:HAS_TIMESERIES]->(`Factory Brightness Sensor Resistance`)<-[:HAS_TIMESERIES]-(SLD)-[:HAS_TIMESERIES]->(`SLD active-status`:TIMESERIES {id_short: "sld_active_status", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/sld_active_status", description: "", connection_topic: "f/i/state/sld", connection_keyword: "active", caption: "SLD active-status", value_type: "BOOLEAN"}),
(`HBW status-code`:TIMESERIES {id_short: "hbw_status_code", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_status_code", description: "", connection_topic: "f/i/state/hbw", connection_keyword: "code", caption: "HBW status-code", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(HBW)-[:HAS_TIMESERIES]->(`Factory Brightness Percentage`),
(`Camera Relative Position Tilt`:TIMESERIES {id_short: "camera_relative_position_tilt", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/camera_relative_position_tilt", description: "relative position tilt: -1.000...0.000...1.000", connection_topic: "i/ptu/pos", connection_keyword: "tilt", caption: "Camera Relative Position Tilt", value_type: "DECIMAL"})<-[:HAS_TIMESERIES]-(SSC)-[:HAS_TIMESERIES]->(`Camera Relative Position Pan`:TIMESERIES {id_short: "camera_relative_position_pan", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/camera_relative_position_pan", description: "relative position pan: -1.000...0.000...1.000", connection_topic: "i/ptu/pos", connection_keyword: "pan", caption: "Camera Relative Position Pan", value_type: "DECIMAL"})-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`Camera Relative Position Tilt`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`HBW status-code`),
(`Camera Relative Position Pan`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`VGR status-code`),
(`HBW status-code`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`VGR status-code`),
(`DPS DSO status-code`:TIMESERIES {id_short: "dps_dso_status_code", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/dps_dso_status_code", description: "", connection_topic: "f/i/state/dso", connection_keyword: "code", caption: "DPS DSO status-code", value_type: "INTEGER"})-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`MPO status-code`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`SLD status-code`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`DPS DSI status-code`:TIMESERIES {id_short: "dps_dsi_status_code", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/dps_dsi_status_code", description: "", connection_topic: "f/i/state/dsi", connection_keyword: "code", caption: "DPS DSI status-code", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(DPS)-[:HAS_TIMESERIES]->(`DPS DSO status-code`),
(`DPS DSI status-code`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`DPS DSO status-code`),
(`HBW Actual Pos. Vertical`:TIMESERIES {id_short: "hbw_actual_pos_vertical", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/hbw_actual_pos_vertical", description: "Measures the current actual vertical position of the High Bay Warehouse", connection_topic: "ns=3;s=\"gtyp_HBW\".\"Vertical_Axis\".\"di_Actual_Position\"", connection_keyword: "", caption: "HBW Actual Pos. Vertical", value_type: "INTEGER"})<-[:HAS_TIMESERIES]-(HBW)-[:HAS_TIMESERIES]->(`HBW Target Pos. Vertical`)-[:RUNTIME_ACCESS]->(learning_factory_opc_ua)<-[:RUNTIME_ACCESS]-(`VGR Actual Pos. Vertical`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`HBW Actual Pos. Vertical`)-[:HAS_UNIT]->(mm)<-[:HAS_UNIT]-(`VGR Target Pos. Vertical`),
(`HBW Target Pos. Vertical`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`VGR Target Pos. Vertical`),
(`HBW Actual Pos. Vertical`)-[:RUNTIME_ACCESS]->(learning_factory_opc_ua)<-[:RUNTIME_ACCESS]-(`VGR Target Pos. Vertical`),
(`VGR Target Pos. Rotation`:TIMESERIES {id_short: "vgr_target_pos_rotation", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_target_pos_rotation", description: "", connection_topic: "ns=3;s=\"gtyp_VGR\".\"rotate_Axis\".\"di_Target_Position\"", connection_keyword: "", caption: "VGR Target Pos. Rotation", value_type: "INTEGER"})-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`VGR Target Pos. Horizontal`:TIMESERIES {id_short: "vgr_target_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_target_pos_horizontal", description: "", connection_topic: "ns=3;s=\"gtyp_VGR\".\"horizontal_Axis\".\"di_Target_Position\"", connection_keyword: "", caption: "VGR Target Pos. Horizontal", value_type: "INTEGER"})-[:RUNTIME_ACCESS]->(learning_factory_opc_ua)<-[:RUNTIME_ACCESS]-(`VGR Actual Pos. Rotation`:TIMESERIES {id_short: "vgr_actual_pos_rotation", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_actual_pos_rotation", description: "", connection_topic: "ns=3;s=\"gtyp_VGR\".\"rotate_Axis\".\"di_Actual_Position\"", connection_keyword: "", caption: "VGR Actual Pos. Rotation", value_type: "INTEGER"})-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`VGR Actual Pos. Horizontal`:TIMESERIES {id_short: "vgr_actual_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_actual_pos_horizontal", description: "", connection_topic: "ns=3;s=\"gtyp_VGR\".\"horizontal_Axis\".\"di_Actual_Position\"", connection_keyword: "", caption: "VGR Actual Pos. Horizontal", value_type: "INTEGER"})-[:HAS_UNIT]->(mm)<-[:HAS_UNIT]-(`VGR Target Pos. Rotation`)<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`VGR target status`:TIMESERIES {id_short: "vgr_target_status", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_target_status", description: "", connection_topic: "f/i/state/vgr", connection_keyword: "target", caption: "VGR target status", value_type: "STRING"}),
(`VGR active-status`:TIMESERIES {id_short: "vgr_active_status", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/vgr_active_status", description: "", connection_topic: "f/i/state/vgr", connection_keyword: "active", caption: "VGR active-status", value_type: "BOOLEAN"})<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`VGR Target Pos. Horizontal`)-[:HAS_UNIT]->(mm)<-[:HAS_UNIT]-(`VGR Actual Pos. Rotation`)<-[:HAS_TIMESERIES]-(VGR)-[:HAS_TIMESERIES]->(`VGR Actual Pos. Horizontal`),
(`VGR Actual Pos. Horizontal`)-[:RUNTIME_ACCESS]->(learning_factory_opc_ua)<-[:RUNTIME_ACCESS]-(`VGR Target Pos. Rotation`),
(`SSC Target Pos. Horizontal`:TIMESERIES {id_short: "ssc_target_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/ssc_target_pos_horizontal", description: "", connection_topic: "ns=3;s=\"gtyp_SSC\".\"Horizontal_Axis\".\"di_Target_Position\"", connection_keyword: "", caption: "SSC Target Pos. Horizontal", value_type: "INTEGER"})-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`SSC Target Pos. Vertical`:TIMESERIES {id_short: "ssc_target_pos_vertical", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/ssc_target_pos_vertical", description: "", connection_topic: "ns=3;s=\"gtyp_SSC\".\"Vertical_Axis\".\"di_Target_Position\"", connection_keyword: "", caption: "SSC Target Pos. Vertical", value_type: "INTEGER"})-[:RUNTIME_ACCESS]->(learning_factory_opc_ua)<-[:RUNTIME_ACCESS]-(`SSC Actual Pos. Vertical`:TIMESERIES {id_short: "ssc_actual_pos_vertical", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/ssc_actual_pos_vertical", description: "", connection_topic: "ns=3;s=\"gtyp_SSC\".\"Vertical_Axis\".\"di_Actual_Position\"", connection_keyword: "", caption: "SSC Actual Pos. Vertical", value_type: "INTEGER"})-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`SSC Actual Pos. Horizontal`:TIMESERIES {id_short: "ssc_actual_pos_horizontal", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/ssc_actual_pos_horizontal", description: "", connection_topic: "ns=3;s=\"gtyp_SSC\".\"Horizontal_Axis\".\"di_Actual_Position\"", connection_keyword: "", caption: "SSC Actual Pos. Horizontal", value_type: "INTEGER"})-[:HAS_UNIT]->(mm)<-[:HAS_UNIT]-(`SSC Target Pos. Horizontal`)<-[:HAS_TIMESERIES]-(SSC),
(SSC)-[:HAS_TIMESERIES]->(`SSC Target Pos. Vertical`)-[:HAS_UNIT]->(mm)<-[:HAS_UNIT]-(`SSC Actual Pos. Vertical`)<-[:HAS_TIMESERIES]-(SSC)-[:HAS_TIMESERIES]->(`SSC Actual Pos. Horizontal`),
(`SSC Actual Pos. Horizontal`)-[:RUNTIME_ACCESS]->(learning_factory_opc_ua)<-[:RUNTIME_ACCESS]-(`SSC Target Pos. Horizontal`),
(`MPO active-status`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`VGR target status`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`VGR active-status`)-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`HBW active-status`),
(`HBW active-status`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`MPO active-status`),
(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`DPS DSI active-status`:TIMESERIES {id_short: "dps_dsi_active_status", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/dps_dsi_active_status", description: "", connection_topic: "f/i/state/dsi", connection_keyword: "active", caption: "DPS DSI active-status", value_type: "BOOLEAN"})-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db)<-[:TIMESERIES_DB_ACCESS]-(`DPS DSO active-status`:TIMESERIES {id_short: "dps_dso_active_status", iri: "www.sintef.no/aas_identifiers/learning_factory/sensors/dps_dso_active_status", description: "", connection_topic: "f/i/state/dso", connection_keyword: "active", caption: "DPS DSO active-status", value_type: "BOOLEAN"})-[:RUNTIME_ACCESS]->(learning_factory_mqtt)<-[:RUNTIME_ACCESS]-(`SLD active-status`),
(`DPS DSO active-status`)<-[:HAS_TIMESERIES]-(DPS)-[:HAS_TIMESERIES]->(`DPS DSI active-status`),
(`SLD active-status`)-[:TIMESERIES_DB_ACCESS]->(learning_factory_influx_db),
(HBW)-[:HAS_SUPPLEMENTARY_FILE]->(`HBW Model Image JPG`)