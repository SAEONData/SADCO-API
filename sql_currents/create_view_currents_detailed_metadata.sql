create view currents_metadata_mims_view as
select
cur_mooring.survey_id as AlternateID,
inv.data_available as Status1,
inv.data_recorded as Status2,
cur_mooring.prjnam as Project_name,
in3.name as institute,
edm_client2.name as client_name,
sc1.f_name as author1_name,
sc1.surname AS author1_surname,
in1.name as author1_institute,
in1.address as author1_institute_address,
sc2.f_name as author2_name,
sc2.surname AS author2_surname,
in2.name as author2_institute,
in2.address as author2_institute_address,
inv.data_centre as Responsible_parties_data_centre,
survey_type.name as keywords_survey_type_name,
survey_type.description as keywords_survey_type_description,
inv.project_name as Abstract_inv_project_name,
inv.cruise_name as Abstract_inv_cruise_name,
cur_mooring.stnnam as Abstract_station_name,
cur_mooring.arenam as Abstract_area_name,
cur_mooring.description as Abstract_cur_description,
edm_instrument2.name as cur_platform_name,
projection.name as projection,
spheroid.name as reference_system_spheroid,
datum.name as reference_system_datum,
cur_mooring.latitude as latitude,
cur_mooring.longitude as longitude,
cur_mooring.date_time_start as date_start,
cur_mooring.date_time_end as date_end,
cur_mooring.stndep as project_depth,
cur_mooring.publication_ref as publication_reference,
inv.data_recorded as License1,
inv.data_available as License2,
inv.exchange_restrict as License3,
inv.data_available as Rights_URL,
survey_notes.line1 as notes1,
survey_notes.line2 as notes2,
survey_notes.line3 as notes3,
survey_notes.line4 as notes4,
survey_notes.line5 as notes5,
survey_notes.line6 as notes6,
survey_notes.line7 as notes7,
survey_notes.line8 as notes8,
survey_notes.line9 as notes9,
survey_notes.line10 as notes10
 
from cur_mooring
left join edm_client2 on edm_client2.code=cur_mooring.client_code
left join edm_instrument2 on edm_instrument2.code=cur_mooring.planam_code
left join inventory as inv on inv.survey_id=cur_mooring.survey_id
LEFT JOIN scientists AS sc1 ON inv.sci_code_1=sc1.code
LEFT JOIN scientists AS sc2 ON inv.sci_code_2=sc2.code
left join institutes as in1 on sc1.instit_code=in1.code
left join institutes as in2 on sc2.instit_code=in2.code
left join institutes as in3 on inv.instit_code=in3.code
left join institutes on inv.instit_code=institutes.code
left join survey_type on inv.survey_type_code=survey_type.code
left join planam on inv.planam_code=planam.code
left join projection on inv.projection_code=projection.code
left join spheroid on inv.spheroid_code=spheroid.code
left join datum on inv.datum_code=datum.code
left join survey_notes on inv.survey_id=survey_notes.survey_id order by cur_mooring.survey_id desc;
