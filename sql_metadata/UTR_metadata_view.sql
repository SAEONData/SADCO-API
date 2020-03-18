select inv.survey_id,
inv.data_recorded as License1,
inv.data_available as License2,
inv.exchange_restrict as License3,
inv.date_start as date_start,
inv.date_end as date_end,
inv.project_name as project_name,
inv.cruise_name as cruise_name,
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
platform."name" as "platfrom_name",
planam."name" as "planam_name",
s2.prjnam as "survey_project_name",
s2.planam as "survey_platform_name",
s2.institute as "survey_institute",
s2.expnam as "survey_exp_name",
platform."name" as "platfrom_name",
planam."name" as "planam_name",
cur_mooring.latitude as latitude,
cur_mooring.longitude as longitude,
cur_mooring.date_time_start as date_start,
cur_mooring.date_time_end as date_end,
cur_mooring.stndep as project_depth,
cur_mooring.publication_ref as publication_reference,
cur_mooring.prjnam as cur_project_name,
cur_mooring.stnnam as cur_station_name,
cur_mooring.arenam as cur_area_name,
cur_mooring.description as cur_description

from inventory as inv

left join scientists as sc1 ON inv.sci_code_1=sc1.code
LEFT JOIN scientists AS sc2 ON inv.sci_code_2=sc2.code
left join institutes as in1 on sc1.instit_code=in1.code
left join institutes as in2 on sc2.instit_code=in2.code
left join planam on inv.planam_code=planam.code
left join platform on planam.platform_code=platform.code
left join survey as s2 on s2.survey_id=inv.survey_id
left join cur_mooring on cur_mooring.survey_id=inv.survey_id
left join institutes as in3 on inv.instit_code=in3.code

where inv.survey_type_code=6 order by inv.survey_id desc;


