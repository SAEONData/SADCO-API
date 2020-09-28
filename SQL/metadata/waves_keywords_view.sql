select ws.survey_id,
case when count(wd.qp) >= 1 then 1 else 0 end "Temeprature",
case when count(wd.hmo) >= 1 then 1 else 0 end "Max_wave_height",
case when count(wd.h1) >= 1 then 1 else 0 end "Extreme_wave_height",
case when count(wd.tp) >= 1 then 1 else 0 end "Spectral_peak",
case when count(wd.tz) >= 1 then 1 else 0 end "Average_zero_down_crossing_wave_period",
case when count(wd.tc) >= 1 then 1 else 0 end "Spectral_Crest_Period",
case when count(wd.tb) >= 1 then 1 else 0 end "Average_Spectral_period"

from wav_station ws 

left join wav_data as wd on ws.station_id=wd.station_id

group by ws.station_id order by ws.survey_id desc;
