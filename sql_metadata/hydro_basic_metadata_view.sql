CREATE VIEW hydro_basic_metadata as select inv.survey_id,
inv.data_recorded as License1,
inv.data_available as License2,
inv.exchange_restrict as License3,
inv.date_start as date_start,
inv.date_end as date_end,
max(sc1.f_name) as author1_name,
max(sc1.surname) as author1_surname,
max(in1.name) as author1_institute,
max(in1.address) as author1_institute_address,
max(sc2.f_name) as author2_name,
max(sc2.surname) as author2_surname,
max(in2.name) as author2_institute,
max(in2.address) as author2_institute_address,
max(stat.latitude) as "station_max_lat",
min(stat.latitude) as "station_min_lat",
max(stat.longitude) as "station_max_lon",
min(stat.longitude) as "station_min_lon",
max(stat.stndep) as "station_depth",
max(status_mode.flagging) as "station_flags",
max(status_mode.quality) as "station_qualtiy",
max(s2.prjnam) as "project_name",
max(s2.planam) as "platform_name",
max(s2.institute) as "survey_institute",
max(s2.expnam) as "survey_exp_name",
max(platform."name") as "platfrom_name",
max(planam."name") as "planam_name"

from inventory as inv

left join station as stat on inv.survey_id=stat.survey_id
left join watphy as watp on stat.station_id=watp.station_id
left join watqc as wqc on watp.code=wqc.watphy_code
left join scientists as sc1 ON inv.sci_code_1=sc1.code
LEFT JOIN scientists AS sc2 ON inv.sci_code_2=sc2.code
left join institutes as in1 on sc1.instit_code=in1.code
left join institutes as in2 on sc2.instit_code=in2.code
left join survey as s2 on s2.survey_id=inv.survey_id
left join status_mode on stat.status_code=status_mode.code
left join planam on inv.planam_code=planam.code
left join platform on planam.platform_code=platform.code

where inv.survey_type_code=1 group by inv.survey_id order by inv.survey_id desc;

