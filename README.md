# Development
The sadco api is an interface between the SAEON metadata catalog and the SADCO postgres database. The understanding of the database structure is recorded and examples of calls are in corresponding sql scripts.

## Data Types

### Currents

The currents data consists of both physics (temperature, salinity etc) and current (speed, direction) data with some being QC'd

* cur_mooring - The overarching table detailing the project level metadata for different moorings
* cur_depth - The mooring metadata 
* cur_data - The speed and direction data for each mooring
* cur_watphy - The physics data (ph, salinity, disolve oxygen) data for moorings
* cur_depth_qc - The Quality control measures taken on each mooring


