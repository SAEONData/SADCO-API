select
client_code,
edm_client2.name as client_name,
edm_instrument2.name as platform_name,
stnnam,arenam,description, latitude, longitude,stndep,survey_id,prjnam from cur_mooring
left join edm_client2 on edm_client2.code=cur_mooring.client_code
left join edm_instrument2 on edm_instrument2.code=cur_mooring.planam_code;
left join inventory on inventory.survey_id=cur_mooring.survey_id;

select * from edm_client2;
select * from edm_instrument2;