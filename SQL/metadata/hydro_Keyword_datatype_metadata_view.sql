select inv.survey_id,
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
--count(stat.station_id) as "station_count",
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
--case when count(watp.temperature) >= 1 then 1 else 0 end "Temeprature",
--case when count(watp.salinity) >= 1 then 1 else 0 end "Salinity",
--case when count(watp.disoxygen) >= 1 then 1 else 0 end "Disoxygen",
--case when count(watp.soundv) >= 1 then 1 else 0 end "SoundV",
--case when count(watchem1.dic) >= 1 then 1 else 0 end "dissolved inorganic carbon",
--case when count(watchem1.doc) >= 1 then 1 else 0 end "doc",
--case when count(watchem1.fluoride) >= 1 then 1 else 0 end "fluoride",
--case when count(watchem1.kjn) >= 1 then 1 else 0 end "kjn",
--case when count(watchem1.nh3) >= 1 then 1 else 0 end "ammonia",
--case when count(watchem1.oxa) >= 1 then 1 else 0 end "oxa",
--case when count(watchem1.ph) >= 1 then 1 else 0 end "ph",
--case when count(watchl.chla) >= 1 then 1 else 0 end "ChlorophyllA",
--case when count(watchl.chlb) >= 1 then 1 else 0 end "ChlorophyllB",
--case when count(watchl.chlc) >= 1 then 1 else 0 end "ChlorophyllC",
--case when count(watnut.no2) >= 1 then 1 else 0 end "Nitrogen Dioxide",
--case when count(watnut.no3) >= 1 then 1 else 0 end "Nitrate",
--case when count(watnut.p) >= 1 then 1 else 0 end "Phospherus",
--case when count(watnut.po4) >= 1 then 1 else 0 end "Phosphate",
--case when count(watnut.sio3) >= 1 then 1 else 0 end "Silicate1",
--case when count(watnut.sio4) >= 1 then 1 else 0 end "Silicate2",
--case when count(wqc.po4) >= 1 then 1 else 0 end "Phosphate_QC",
--case when count(wqc.disoxygen) >= 1 then 1 else 0 end "disoxygen_OC",
--case when count(wqc.salinity) >= 1 then 1 else 0 end "Salinity_QC",
--case when count(wqc.temperature) >= 1 then 1 else 0 end "Temperature_QC",
--case when count(watpol1.arsenic) >= 1 then 1 else 0 end "arsenic",
--case when count(watpol1.cadmium) >= 1 then 1 else 0 end "cadium",
--case when count(watpol1.chromium) >= 1 then 1 else 0 end "chromium",
--case when count(watpol1.cobalt) >= 1 then 1 else 0 end "cobalt",
--case when count(watpol1.copper) >= 1 then 1 else 0 end "copper",
--case when count(watpol1.iron) >= 1 then 1 else 0 end "iron",
--case when count(watpol1.lead) >= 1 then 1 else 0 end "lead",
--case when count(watpol1.manganese) >= 1 then 1 else 0 end "mangenese",
--case when count(watpol1.mercury) >= 1 then 1 else 0 end "mercury",
--case when count(watpol1.nickel) >= 1 then 1 else 0 end "nickel",
--case when count(watpol1.selenium) >= 1 then 1 else 0 end "selenium",
--case when count(watpol1.zinc) >= 1 then 1 else 0 end "zinc"

from inventory as inv

left join station as stat on inv.survey_id=stat.survey_id
left join watphy as watp on stat.station_id=watp.station_id
left join watqc as wqc on watp.code=wqc.watphy_code
left join watchem1 on watp.code=watchem1.watphy_code
left join watchl on watp.code=watchl.watphy_code
left join watnut on watp.code=watnut.watphy_code
left join watpol1 on watp.code=watpol1.watphy_code
left join scientists as sc1 ON inv.sci_code_1=sc1.code
LEFT JOIN scientists AS sc2 ON inv.sci_code_2=sc2.code
left join institutes as in1 on sc1.instit_code=in1.code
left join institutes as in2 on sc2.instit_code=in2.code
left join survey as s2 on s2.survey_id=inv.survey_id
left join status_mode on stat.status_code=status_mode.code
left join planam on inv.planam_code=planam.code
left join platform on planam.platform_code=platform.code

where inv.survey_type_code=1 group by inv.survey_id order by inv.survey_id desc limit 10;

