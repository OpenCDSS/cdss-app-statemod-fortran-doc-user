# StateMod / Introduction #

**This documentation has been copied from the legacy Word version and updated slightly for usability.**

* [Summary](#summary)
* [Key Components](#key-components)
* [Definitions](#definitions)
* [Major Modules](#major-modules)
* [Remainder of Documentation](#remainder-of-documentation)

--------------------------

## Summary ##

The State of Colorado's Stream Simulation Model (StateMod) is a monthly or daily water
allocation and accounting model capable of making comparative analyses for the
assessment of various historical and future water management policies in a river basin.
It is designed to be applied to any river basin through appropriate input data preparation. 

This document was prepared to explain the features and functions of StateMod and
presumes the reader has a basic understanding of river operations.
It is current for StateMod Version 15. The documentation is intended for use by engineers,
water resource planners or anyone involved in water management decision making.
It is structured such that Sections 1 - 3 will stand alone to provide a general description of the model
and its features. Sections 4 – 10 provide the detail required to develop data sets and implement the model in a river basin.

StateMod's operation, like the stream itself, is governed by its hydrology, water rights,
and the associated structures and operating rules.
It recognizes five (5) types of water rights: direct flow rights, instream flow rights,
reservoir storage rights, well rights, and operational rights.
Each of the water rights is given an administration number (rank) and location in the stream system.
The model then sorts the water rights by rank and simulates their operation by priority using
the Prior Appropriation Doctrine (first in time, first in right).
The water right categories are self-explanatory with the possible exception of the operational rights,
which generally pertain to reservoir operating policies, exchanges,
carrier ditch systems, and terms and conditions associated with a water rights operation.

## Key Components ##

The key components of StateMod are as follows:

* **Daily or Monthly Time Step.** Simulates in a monthly or daily time step. For a daily simulation,
input data requirements may be simplified by allowing the user to:
	1. Provide daily data
	2. Estimate daily data by requesting the model divide a monthly value by the number of days in a month
	3. Estimate daily data by requesting the model use a monthly average, or
	4. Estimate daily data by requesting the model use monthly data and another gages daily distribution.<br><br>
Daily baseflow data may be developed directly or estimated from monthly baseflow estimates. 
* **Network System.** Simulates tributaries and main stem river systems through the use of a tree structured network system. 
* **Prior Appropriation Doctrine.** Simulates direct flow, instream flow, reservoir storage,
well and operational rights under the Prior Appropriation doctrine (i.e. First in time, first in right)
as a function of water availability, priority, decreed amount, demand, structure capacity and location. 
* **Operational Rules.** Simulates a wide variety of operating agreements and exchanges between one or more structures. 
* **Return Flows.** For a given structure, simulates one or more return flow patterns
returning to one or more stream nodes to represent the impact of surface and ground water returns on stream operations. 
* **Instream Flows.** Simulates Instream Flows as a reach or point. 
* **Wells.** Simulates wells as the sole source to a water user or as a supplemental supply. 
* **Plans.** Simulates terms and conditions associated with a water transfer,
reusable water supplies or out-of-priority well pumping.
* **Base or Natural Flows.** Estimates a base or natural streamflow from gaged or estimated streamflow, diversion and reservoir data. 
* **Modified Direct Solution Algorithm.** Uses an efficient, Modified Direct Solution Algorithm (Bennett, Ray R., December 2000),
which allows variable efficiency, soil moisture accounting and immediate (current time step) return flows to be evaluated without having to iterate. 
* **Variable Efficiency.** Allows the user to simulate water use by specifying an average or variable efficiency. 
* **Soil Moisture Accounting.** Simulates soil moisture inflow, use and storage. 
* **Transmountain Diversions.** Simulates transmountain imports and diversions from a basin. 
* **Call Reporting.** Estimates the calling structure and calling right.
* **Graphical User Interface (GUI).** Includes a comprehensive GUI that allows input data to be viewed, edited, and graphed;
output data to be viewed and graphed; map based depiction of basin, hydrology, structure locations, etc.
**Currently the StateMod GUI should only be used to view (but not edit) data bacause of
incompatibilities with the latest model file formats and features.**
* **Data-centered Approach.** The entire system operates as a data-centered component using data from 
the CDSS database (HydroBase).
Data Management Interface (DMI) software including TSTool and StateDMI are used to automate
processing HydroBase data into model input files
	to ensure results are reproducible and easily refreshed for a new study period or database updates.
* **Error Checking.** Performs extensive input data error checking throughout the program. 

## Definitions ##

The following definitions are provided in order to define commonly used terms throughout model documentation:

* **Baseflow** – Represents basin streamflows absent human’s influence including diversions, return flows,
reservoir operations and pumping. If 100% of human’s influence is removed,
baseflows are often called natural flows.
* **Physical Flow and Available Flow** – Physical flow represents the amount of water in the
stream that occurs at, or above, the node. The physical flow legally available for diversion
at a node is termed the available flow. Available flow is the portion of the physical flow that is not
required to meet downstream senior water rights.
The Modified Direct Solution Algorithm identifies the minimum available flow at all
downstream nodes in order to determine the available flow at node that can be diverted. 
* **Model Calibration** – Calibration is the process of simulating the river basin under historical conditions,
and judiciously adjusting parameter estimates to achieve agreement between observed and
simulated values of streamflow gages, reservoir levels, and diversions.
* **Diversion Structure** – Represents structures located on the river, such as diversion headgates,
pumps and carrier ditches where water is diverted from the river to meet a diversion demand.
* **Reservoir Structure** – Represents storage structures located on or off channel
that divert water from the river using reservoir storage rights.
* **Demand Structure** – Represent structures located on the river or off channel that have a demand,
which can be met by a different structure such as a carrier, reservoir, or wells.
* **Instream Flow Structure or Instream Flow Point** – Represents a reach on the river (e.g. from tributary
headwaters to confluence with main stem river) or a river location (e.g. wastewater treatment plan outfall) where instream flow demands exist.
* **Plan Structure** – Represents a structure used to account for:
	1. Augmentation Plans
	2. Terms and Conditions associated with a water transfer, and
	3. Reusable water supplies.
* **Unit Response Function** – Represent when return flows or depletions will impact the river over time.
For example a power plant diversion may have an immediate unit response function while an
irrigation diversion or well pumping may have a lagged unit response function.
* **Efficiencies** – Define the amount of diverted water that is consumed versus the amount supplied.
When the water supply is at the source (headgate or well head) it is called System Efficiency.
System efficiency is commonly split into conveyance efficiency (representing diversions less ditch loss)
and application efficiency (representing water use less application loss).
* **Consumptive Water Requirement (CIR)** – The amount of water required for consumption by an irrigation,
municipal or instream use. The CIR excludes any conveyance or application efficiencies.
For an irrigation demand it is often called an Irrigation Water Requirement (IWR),
which is the potential evapotranspiration less effective precipitation

## Major Modules ##

StateMod consists of four major modules:

1. **The Base Flow, or Natural Flow, module** produces a set of streamflows that would have
occurred in the basin without a user-specified level of man's development.
For example, if a user supplied data that allows 100% of man's influence to be removed,
the base flow developed would represent natural stream flows.
On the other hand if a user supplies data that allows only 80% of mans influence to be removed,
the baseflow developed would represent something in-between (e.g. 80%) natural and developed.
The latter in-between approach is often used as a cost effective measure to simplify
baseflow development by including relatively large projects and excluding smaller,
less significant developments. Note that any developments not included in the baseflow calculation are not ignored,
instead their impact on the system is included in the in-between baseflow estimate. 
2. **The Simulation module** operates the river system and accounts for inflows, river gains, diversions,
instream flows, well pumping, and reservoir operations. 
3. **The Report module** processes the results of the Simulation module into user specified reports and graphs data sets. 
4. **The Data Check module** reads the input files and performs various data checks.

Following is a general sequence for operating StateMod:

1. Develop a stream node network based on the location of key gages, river confluences,
reservoirs, diversions, wells, and instream flows.
2. Construct the necessary monthly input files using the formats described in Section 4.0.
3. Check the input files by executing StateMod's Data Check Module.
4. Develop base stream flows by executing StateMod's Base Flow Module.
5. Simulate the stream system's operation by executing StateMod's Simulation Module.
6. Evaluate results and generate graphs and tables by executing StateMod's Report Module.
7. If desired, add daily simulation capability.

## Remainder of Documentation ##
  
The remainder of this document is organized as follows:

| **Section** | **Title** | **Description**|
|--------------|-----------------|--------------|
|3.|[Model Description](../description/description.md)|Describes the theoretical basis of river operations, water allocation and reservoir operations|
|4.|[Input Description](../input/overview.md)|Describes the input format for each data set|
|5.|[Output Description](../output/output.md)|Describes the contents of the various outputs files|
|6.|[Model Operation](../operation/operation.md)|Describes the model's operation from both the screen or command line arguments|
|7.|[Standard Modeling Procedures](../procedures/procedures.md)|Describes technical details of selected portions of the programs operation and provides information on standard modeling procedures|
|8.|[Supporting Utilities](../utilities/utilities.md)|Describes supporting utilities available to assist in developing a StateMod data set|
|9.|[Discontinued but Supported Files](../discontinued-files/discontinued-files.md)|Describes discontinued but supported data file formats|
