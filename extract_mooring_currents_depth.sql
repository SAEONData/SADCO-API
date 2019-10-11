select * from cur_mooring where survey_id='2014/0066';
select * from cur_depth where mooring_code='1167';

select 
cur_mooring.survey_id,
cur_mooring.latitude,
cur_mooring.longitude,
cur_data.datetime,
cur_data.speed,
cur_data.direction,
cur_depth.spldep
from cur_data 
left join cur_depth on cur_data.depth_code=cur_depth.code
left join cur_mooring on cur_depth.mooring_code=cur_mooring.code
where cur_data.depth_code in (6138,6162,6163,6164,6165,6166,6167,6168,6169,6110,6111,6112,6113,6114,6115,6116,6117,6118,6119,6292,6291,6290,6080,6081,6082,6083,6084,6085,6086,6087,6088,6089,6090,6091,6092,6093,6094,6095,6096,6097,6098,6099,6100,6101,6102,6103,6104,6105,6106,6107,6108,6109,6120,6121,6122,6123,6124,6125,6126,6127,6128,6129,6130,6131,6132,6133,6134,6135,6136,6137,6139,6140,6141,6142,6143,6144,6145,6146,6147,6148,6149,6150,6151,6152,6153,6154,6155,6156,6157,6158,6159,6160,6161) order by cur_depth.spldep asc

copy 

copy (select cur_mooring.survey_id,cur_mooring.latitude,cur_mooring.longitude,cur_data.datetime,cur_data.speed,cur_data.direction,cur_depth.spldepfrom cur_data left join cur_depth on cur_data.depth_code=cur_depth.code left join cur_mooring on cur_depth.mooring_code=cur_mooring.code where cur_data.depth_code='6138') To '/tmp/test.csv' With csv header

