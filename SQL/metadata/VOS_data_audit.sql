

select min(vs.latitude) as min_lat,
max(vs.latitude) as max_lat,
min(vs.longitude) as min_lon,
max(vs.longitude) as max_lon

from vos_main vs;


select count(vm.latitude) as lat_count,
count(vm.longitude) as lon_count,
count(vm.date_time) as time_count,
count(vm.daynull) as daynull_count,
count(vm.callsign) as callsign_count,
count(vm.country) as country_count,
count(vm.platform) as platform_count,
count(vm.data_id)as data_id_count,
count(vm.quality_control) as qc_count,
count(vm.source1) as source1_count,
count(vm.load_id) as load_id_count, 
count(vm.dupflag) as dupflag_count,
count(vm.atmospheric_pressure) as atmos_pressure_count,
count(vm.surface_temperature) as surface_temp_count,
count(vm.surface_temperature_type) as surface_temp_type_count,
count(vm.drybulb) as drybulb_count,
count(vm.wetbulb) as wetbulb_count,
count(vm.wetbulb_ice) as wetbulb_ice_count,
count(vm.dewpoint) as dewpoint_count,
count(vm.cloud_amount) cloud_amount_count,
count(vm.cloud1) as cloud1_count, 
count(vm.cloud2) as cloud2_count,
count(vm.cloud3) as cloud3_count,
count(vm.cloud4) as cloud4_count,
count(vm.cloud5) as cloud5_count,
count(vm.visibility_code) as visibility_code_count,
count(vm.weather_code) as weather_code_count,
count(vm.swell_direction) as swell_direction_count,
count(vm.swell_height) as swell_height_count,
count(vm.swell_period) as  swell_period_count,
count(vm.wave_height) as wave_height_count,
count(vm.wave_period) as wave_period_count,
count(vm.wind_direction) as wind_direction_count,
count(vm.wind_speed) as wind_speed_count,
count(vm.wind_speed_type) as wind_speed_type_count
from vos_main vm 

where vm.date_time > '1970-01-01' and vm.date_time < '1970-12-31';


select vm.latitude as lat_count,
vm.longitude as lon_count,
vm.date_time as time_count,
vm.daynull as daynull_count,
vm.callsign as callsign_count,
vm.country as country_count,
vm.platform as platform_count,
vm.data_id as data_id_count,
vm.quality_control as qc_count,
vm.source1 as source1_count,
vm.load_id as load_id_count, 
vm.dupflag as dupflag_count,
vm.atmospheric_pressure as atmos_pressure_count,
vm.surface_temperature as surface_temp_count,
vm.surface_temperature_type as surface_temp_type_count,
vm.drybulb as drybulb_count,
vm.wetbulb as wetbulb_count,
vm.wetbulb_ice as wetbulb_ice_count,
vm.dewpoint as dewpoint_count,
vm.cloud_amount cloud_amount_count,
vm.cloud1 as cloud1_count, 
vm.cloud2 as cloud2_count,
vm.cloud3 as cloud3_count,
vm.cloud4 as cloud4_count,
vm.cloud5 as cloud5_count,
vm.visibility_code as visibility_code_count,
vm.weather_code as weather_code_count,
vm.swell_direction as swell_direction_count,
vm.swell_height as swell_height_count,
vm.swell_period as  swell_period_count,
vm.wave_height as wave_height_count,
vm.wave_period as wave_period_count,
vm.wind_direction as wind_direction_count,
vm.wind_speed as wind_speed_count,
vm.wind_speed_type as wind_speed_type_count
from vos_main vm 

where vm.date_time > '2010-01-01' and vm.date_time < '2020-12-31';

select distinct vos_main.platform from vos_main ;

select * from vos_main2 vm2 ;
select * from vos_arch va ;
select  * from log_vos_loads lvl;

select * from platform p ;

