# StateMod / Model Input / Response File (`*.rsp`) #

The response file contains the names of all other data files required to run the model.
his file is read by subroutine StateM.
Note that Version 10.30 and greater allows a user to enter response file data using one of two formats; free-format and sequential.
StateMod reads the first file type and based on the occurrence of the character `=` in the
first file name it determines if the file is free-format (contains a `=`) or sequential (does not contain a `=`).

The free-format file approach allows file names to be entered in any order using the file descriptors described in the table below,
where each line of the response file uses a format similar to the following example:

```
Control = dataset.ctl
```

Any file type that is not required for a simulation is simply not included.
Any file name may be commented out by including a `#` character in column 1.
For a description of the sequential, old, format see the section titled 9.0 Discontinued but Supported File Formats. 

Note that model output files take on the name of the response file.
For example, a response file with name `dataset.rsp` will result in output file `dataset.b43` and similar.
It is recommended that different model runs using descriptive response file naming conventions.
For example, use the dataset name as the general response file name (`dataset.rsp`) and use modifiers such as `H` for historical (`datasetH.rsp`).

| **File Descriptor** | **File Type**| **Standard File Extension**|
|-----------------|---------------|----------------------------|
|`Control`|				Control File			|`*.ctl`|
|`River_Network`|				River Network File		|`*.rin`|
|`River_Gage`|				River Gage File			|`*.rig`|
||||
|`Reservoir_Station`|			Reservoir Station		|`*.res`|
|`Diversion_Station`|			Diversion Station		|`*.dds`|
|`StreamGage_Station`|			Stream Gage Station		|`*.ris`|
|`Instreamflow_Station`|			Instream Flow Station		|`*.ifs`|
|`Well_Station`|				Well Station			|`*.wes`|
||||
|`Instreamflow_Right`|			Instream Flow Right		|`*.ifr`|
|`Reservoir_Right`|			Reservoir Right			|`*.rer`|
|`Diversion_Right`|			Diversion Right			|`*.ddr`|
|`Operational_Right`|			Operational Right		|`*.opr`|
|`Well_Right`|				Well Right			|`*.wer`|
||||
|`Precipitation_Monthly`|		Precipitation Monthly		|`*.prc`|
|`Precipitation_Annual`|			Precipitation Annual		|`*.pra`|
|`Evaporation_Monthly`|			Evaporation Monthly		|`*.evm`|
|`Evaporation_Annual`|			Evaporation Annual		|`*.eva`|
|`Stream_Base Monthly`|			Baseflow Monthly		|`*.rim/*.xbm`|
||||
|`Diversion_Demand_Monthly`|		Diversion Demand Monthly	|`*.ddm`|
|`Diversion_Demand_AverageMonthly`|	Diversion Demand Annual	|`*.dda`|
|`Diversion_DemandOverride_Monthly`|	Diversion Override Monthly	|`*.ddo`|
|`Instreamflow_Demand_Monthly`|		Inst. Flow Demand Monthly	|`*.ifm`|
|`Instreamflow_Demand_AverageMonthly`|	Inst. Flow Demand Ave. Monthly	|`*.ifa`|
|`Well_Demand_Monthly`|			Well Demand Monthly		|`*.wem`|
||||
|`DelayTable_Monthly`|			Delay Table Monthly		|`*.dly`|
|`Reservoir_Target_Monthly`|		Reservoir Target Monthly	|`*.tar`|
|`Reservoir_Return`|			Reservoir Seepage Return Data	|`*.rrf`|
||||
|`IrrigationPractice_Yearly`|		Irrigation Practice Yearly	|`*.ipy`|
|`ConsumptiveWaterRequirement_Monthly`|	Irrigation Water Req. Monthly	|`*.iwr/*.ddc`|
|`StateCU_Structure`|			StateCU Structure (AWC) file	|`*.str`|
||||
|`Reservoir_Historic_Monthly`|		Reservoir Historic Monthly	|`*.eom `|
|`StreamEstimate_Coefficients`|		Stream Estimate Coefficients	|`*.rib`|
|`StreamGage_Historic_Monthly`|		Stream Gage Historic Monthly	|`*.rih
|`Diversion_Historic_Monthly`		Diversion Historic Monthly	|`*.ddh`|
|`Well_Historic_Monthly`|		Well Historic Monthly		|`*.weh`|
||||
|`OutputRequest`|				Output Request			|`*.out`|
||||
|`Stream_Base_Daily`|			Stream Base Daily		|`*.rid`|
|`Diversion_Demand_Daily`|		Direct Flow Demand Daily	|`*.ddd`|
|`Instreamflow_Demand_Daily`|		Instream Flow Demand Daily	|`*.ifd`|
|`Well_Demand_Daily`|			Well Demand Daily		|`*.wed`|
|`Reservoir_Target_Daily`|		Reservoir Target Daily		|`*.tad`|
|`DelayTable_Daily`|			Delay Table Daily		|`*.dld`|
|`ConsumptiveWaterRequirement_Daily`|	Irrigation Water Req. Daily	|`*.iwd`|
|`StreamGage_Historic_Daily`|		StreamGage Historic Daily	|`*.riy`|
|`Diversion_Historic_Daily`|		Diversion Historic Daily	|`*.ddy`|
|`Well_Historic_Daily`|			Well Historic Daily		|`*.wey`|
|`Reservoir_Historic_Daily`|		Reservoir Historic Daily	|`*.eoy`|
||||
|`Downstream_Call`|			Downstream Call			|`*.cal`|
|`RioGrande_Spill_Monthly`|		Rio Grande Spill file		|`*.rgs`|
|`San_Juan_Recovery`|            	San Juan Recovery Data		|`*.sjr`|
||||
|`GeographicInformation`|		Geographic Information (not used by StateMod, used by StateMod GUI) |`*.gis`|
|`Network`|				Network File (not used by StateMod, used by StateMod GUI and StateDMI) 	|`*.net`|
||||
|`Plan_Data`|				Plan Data			|`*.pln`|
|`Plan_Wells`|				Plan Well Augmentation Data	|`*.plw`|
|`Plan_Return`|				Plan Return Data		|`*.prf`|
||||
|`Reach_Data`|				Reach Report Data		|`*.rch`|
