create view mims_metadata_view as
select 
inv.survey_id as AlternateID,
inv.data_available as Status1,
inv.data_recorded as Status2,
inv.project_name as Project_Collection,
in3.name as institute,
sc1.f_name as author1_name,
sc1.surname AS author1_surname,
in1.name as author1_institute,
in1.address as author1_institute_address,
sc2.f_name as author2_name,
sc2.surname AS author2_surname,
in2.name as author2_institute,
in2.address as author2_institute_address,
inv.data_centre as Responsible_parties_data_centre,
survey_type.name as keywords1,
survey_type.description as keywords2,
inv.project_name as Abstract1,
inv.cruise_name as Abstract2,
planam.name as Abstract3,
projection.name as proj_name,
spheroid.name as reference_system_spheroid,
datum.name as reference_system_datum,
marine_zones.marine_zone as location,
inv.lat_north as bounding_box1,
inv.lat_south as bounding_box2,
inv.long_west as bounding_box3,
inv.long_east as bounding_box4,
inv.date_start as start_date,
inv.date_end as End_date,
inv.data_recorded as License1,
inv.data_available as License2,
inv.exchange_restrict as License3,
inv.data_available as Rights_URL,
inv.project_name as lineage1,
inv.cruise_name as lineage2,
planam.name as lineage3,
platform.name as lineage4,
inv.survey_id as related,
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

from inventory as inv

LEFT JOIN scientists AS sc1 ON inv.sci_code_1=sc1.code
LEFT JOIN scientists AS sc2 ON inv.sci_code_2=sc2.code
left join institutes as in1 on sc1.instit_code=in1.code
left join institutes as in2 on sc2.instit_code=in2.code
left join institutes as in3 on inv.instit_code=in3.code
left join survey_type on inv.survey_type_code=survey_type.code
left join planam on inv.planam_code=planam.code
left join projection on inv.projection_code=projection.code
left join spheroid on inv.spheroid_code=spheroid.code
left join datum on inv.datum_code=datum.code
left join zones_covered on inv.survey_id=zones_covered.survey_id
left join marine_zones on zones_covered.zone_code=marine_zones.code
left join platform on planam.platform_code=platform.code
left join survey_notes on inv.survey_id=survey_notes.survey_id order by inv.survey_id desc;

