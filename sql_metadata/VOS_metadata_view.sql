select vm.latitude,
vm.longitude,
vm.date_time,
vm.callsign,
vm.atmospheric_pressure,
vm.surface_temperature,
vm.drybulb,
vm.wetbulb,
vm.dewpoint,
vm.cloud_amount,
vm.swell_direction,
vm.swell_height,
vm.swell_period,
vm.wave_height,
vm.wave_period,
vm.wind_direction,
vm.wind_speed
from vos_main vm;

select va.latitude,
va.longitude,
va.date_time,
va.callsign,
va.atmospheric_pressure,
va.surface_temperature,
va.drybulb,
va.wetbulb,
va.dewpoint,
va.cloud_amount,
va.swell_direction,
va.swell_height,
va.swell_period,
va.wave_height,
va.wave_period,
va.wind_direction,
va.wind_speed
from vos_arch va



--left join platform as pm on vm.platform = pm.code::varchar;


