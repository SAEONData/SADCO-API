select 
cur_mooring.survey_id,
inv.project_name as project_name,
cur_mooring.stnnam,
sc1.f_name as author1_name,
sc1.surname AS author1_surname,
in1.name as author1_institute,
in1.address as author1_institute_address,
sc2.f_name as author2_name,
sc2.surname AS author2_surname,
in2.name as author2_institute,
in2.address as author2_institute_address,
in3.name as institute,
cur_mooring.date_time_start as date_start,
cur_mooring.date_time_end as date_end,
cur_mooring.latitude,
cur_mooring.longitude,
cur_mooring.description,
string_agg(cur_depth.spldep::varchar,'!') as mooring_depth,
string_agg(cur_depth.instrument_number::varchar,'!') as instrument_number,
string_agg(cur_depth.number_of_records::varchar,'!') as number_of_records,
string_agg(cur_depth.parameters,'!'),
string_agg(edm_instrument2.name,'!'),
inv.data_recorded as License1,
inv.data_available as License2,
inv.exchange_restrict as License3,
inv.data_available as Rights_URL

from cur_mooring 
left join inventory as inv on inv.survey_id=cur_mooring.survey_id
LEFT JOIN scientists AS sc1 ON inv.sci_code_1=sc1.code
LEFT JOIN scientists AS sc2 ON inv.sci_code_2=sc2.code
left join institutes as in1 on sc1.instit_code=in1.code
left join institutes as in2 on sc2.instit_code=in2.code
left join institutes as in3 on inv.instit_code=in3.code
left join institutes on inv.instit_code=institutes.code
left join cur_depth on cur_mooring.code = cur_depth.mooring_code
left join edm_instrument2 on edm_instrument2.code = cur_depth.instrument_number
group by cur_mooring.survey_id,inv.project_name,cur_mooring.stnnam,sc1.f_name,sc1.surname,in1.name,in1.address,sc2.f_name,sc2.surname,
in2.name,in2.address,in3.name,cur_mooring.date_time_start,cur_mooring.date_time_end,cur_mooring.latitude,cur_mooring.longitude,cur_mooring.description,
inv.data_recorded,inv.data_available,inv.exchange_restrict,inv.data_available
