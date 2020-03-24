BEGIN

drop table temp_table;

CREATE TEMP TABLE temp_table as select wav_data.station_id as stat_id,string_agg(distinct edm_instrument2.name,',') as lol from wav_data left join edm_instrument2 on edm_instrument2.code=wav_data.instrument_code group by station_id;

select inv.survey_id,
inv.data_recorded as License1,
inv.data_available as License2,
inv.exchange_restrict as License3,
inv.date_start as date_start,
inv.date_end as date_end,
sc1.f_name as author1_name,
sc1.surname as author1_surname,
in1.name as author1_institute,
in1.address as author1_institute_address,
sc2.f_name as author2_name,
sc2.surname as author2_surname,
in2.name as author2_institute,
in2.address as author2_institute_address,
inv.data_centre as data_centre,
in3.name as institute,
ws.station_id as wav_station_id,
ws.latitude as wav_station_latitide,
ws.longitude as wav_station_longitude,
ws.water_depth as wav_water_depth,
ws.name as wav_name,
temp_table.lol as wav_instruments,
inv.project_name as project_name,
inv.cruise_name as cruise_name

from inventory as inv

left join scientists as sc1 ON inv.sci_code_1=sc1.code
LEFT JOIN scientists AS sc2 ON inv.sci_code_2=sc2.code
left join institutes as in1 on sc1.instit_code=in1.code
left join institutes as in2 on sc2.instit_code=in2.code
left join planam on inv.planam_code=planam.code
left join platform on planam.platform_code=platform.code
left join survey as s2 on s2.survey_id=inv.survey_id
left join institutes as in3 on inv.instit_code=in3.code
left join wav_station as ws on inv.survey_id=ws.survey_id
left join temp_table on ws.station_id=temp_table.stat_id

where inv.survey_type_code=4 order by inv.survey_id desc;
