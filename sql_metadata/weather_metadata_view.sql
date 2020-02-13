create view weather_metadata_mims_view as
select distinct
wet_station.survey_id as AlternateID,
wet_station.name as Title1,
edm_client2."name" as title2,
inventory.project_name as title3,
sc1.f_name as author1_name,
sc1.surname AS author1_surname,
in1.name as author1_institute,
in1.address as author1_institute_address,
wet_station.latitude as latitude,
wet_station.longitude as longitude,
inventory.date_start as date_start,
inventory.date_end as date_end,
wet_period.height_msl as project_depth,
inventory.data_recorded as License1,
inventory.data_available as License2,
inventory.exchange_restrict as License3,
wet_data_qc.person_checked as lineage1,
wet_data_qc.date_checked as lineage2

from inventory 
LEFT JOIN scientists AS sc1 ON inventory.sci_code_1=sc1.code
left join institutes as in1 on sc1.instit_code=in1.code
left join wet_station on inventory.survey_id=wet_station.survey_id
left join wet_period on wet_station.station_id=wet_period.station_id
left join edm_client2 on wet_station.client_code=edm_client2.code
left join wet_data_qc on wet_period.station_id=wet_data_qc.station_id
where inventory.survey_type_code=3;

