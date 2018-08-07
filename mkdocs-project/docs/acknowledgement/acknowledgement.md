# StateMod / Acknowledgement #

**This documentation was copied from the legacy Word version.**

The State of Colorado's Stream Simulation Model (StateMod) was developed from a model
developed previously for the State of Colorado as part of the
Green Mountain Pump Back and Exchange Project (Boyle Engineering Corporation, 1986).
The model enhancement, support, and renaming by the State of Colorado occurred to provide additional capabilities.
Since the State of Colorado took over the maintenance of the StateMod program,
the model has undergone numerous enhancements using the following version scheme:

```
Version XX.YY.ZZ
```

Where:

* `XX` is the major version,
* `YY` is a new functionality, and
* `ZZ` is a correction

As presented below, key enhancements occurred in 1988 to allow a daily time step,
1989 to include wells, 2001 to allow variable efficiency,
2006 to include plans (augmentation, administration, re-use, Term & Condition, etc.),
and 2007 to allow four land use types (SW Flood, SW Sprinkler, GW Flood and GW Sprinkler)
under a single ditch system. With each major enhancement significant effort has been
made to maintain existing file formats and processes so that historic applications can be duplicated.

In general, a new primary version number (e.g. 10.x) was initiated whenever an existing input format,
output format, new process, new compiler, or extensive testing was added.
Similarly relatively minor enhancements that do not impact existing formats or process get in a new sub version number (e.g. 10.12). 

**<p class="alignCenter">
Major StateMod Enhancements
</p>**

|**Version**|**Year**|**Areas of Key Enhancements**|
|:------:|:--------------:|----|
|1.|1986|Original Development|
|2. – 4.|1995|Baseflow module enhancement<br>New reporting capabilities.|
|5.|1996|Allow multiple replacement reservoirs and reoperate for non-downstream return flows.|
|6.|1996|Enhanced binary file reporting.<br>New reporting capabilities.|
7.|1997|Treat Instream flows as a Reach.<br>Linked model capability.|
|8.|1998|Daily simulation capability.|
|9.|1999|Well simulation capability.|
|10.|2001|Variable efficiency capability.|
|11.|2006|Plans. Operating rules that allow plans, diversion type, carrier losses, annual limits and on/off dates.|
|12.|2007-2008|Irrigation Practice File is allowed to contain 4 water supply irrigation method combinations (Surface Water Flood, Surface Water Sprinkler, Ground Water Flood and Ground Water Sprinkler).  Expanded the ability to divert to and from plans.|
|13|2012|Expanded the ability to divert to and from plans.  Extensive testing of plans by application to the Lower South Platte River in Colorado.|
|14|2014|Revised the program to compile and store under GitHub in order to allow multiple authors to enhance the program and save edits as different branches that can be reviewed and/or adopted for production.|
|15|2015|Testing and comparison to historic results following the transfer to GitHub. Added a Changed Water Right operating rule (type 26) that allows a water right to be diverted by priority from the river and temporarily stored for later use.|
