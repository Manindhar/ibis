SET mapred.job.queue.name=ingestion;
SET mapreduce.map.memory.mb=8000;
SET mapreduce.reduce.memory.mb=16000;
SET hive.exec.dynamic.partition.mode=nonstrict;

DROP VIEW IF EXISTS fake_view_open.fake_database_mock_table;
DROP TABLE IF EXISTS fake_view_open.fake_database_mock_table;

CREATE DATABASE IF NOT EXISTS fake_view_open;
CREATE  TABLE fake_view_open.fake_database_mock_table like mock_domain.fake_database_mock_table;

INSERT OVERWRITE TABLE fake_view_open.fake_database_mock_table PARTITION(incr_ingest_timestamp) select * from mock_domain.fake_database_mock_table ;

msck repair table `fake_view_open.fake_database_mock_table`;

DROP VIEW IF EXISTS fake_view_im.fake_database_mock_table;
DROP TABLE IF EXISTS fake_view_im.fake_database_mock_table;

CREATE DATABASE IF NOT EXISTS fake_view_im;
CREATE  TABLE fake_view_im.fake_database_mock_table like mock_domain.fake_database_mock_table;

INSERT OVERWRITE TABLE fake_view_im.fake_database_mock_table PARTITION(incr_ingest_timestamp) select * from mock_domain.fake_database_mock_table ;

msck repair table `fake_view_im.fake_database_mock_table`;