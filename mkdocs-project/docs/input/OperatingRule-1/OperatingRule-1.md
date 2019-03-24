# StateMod / Input / Operating Rule / 1 - Reservoir to Instream Flow #

* [Overview](#overview)
* [Input File Format](#input-file-format)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The type 1 (Resevoir to instream flow) operating rule provides a method to release water to an instream flow via the river.

## Input File Format ##

The input file format as follows:

```text
a12, a24, 12x, 4x, f12.5, f8.0, i8, 3(1x,a12,i8), i8, 1x,a12, 1x,a12,1x, 2f8.0, 2i8)

```

|**Category**|**Position**|**Format** |**Variable**| **Description**    |**Default**              |
|------------|:----------:|:---------:|- ----------|--------------------|-------------------------|
|Control     |1-1         |`a12`      |`cidvri(1)` |Operational right ID|None - must be specified.|
|Control     |1-2         |`a24`      |`nameo(1)`  |Operational right name|None - must be specified.|
|Control     |1-3         |`f12.5`    |`rtem(1)`   |Administration number|None - must be specified.|
|Control     |1-4         |`f8.0`     |`dumx`      |Monthly switch:<br><ul><li>`0` = no monthly on/off values</li><li>`12` = number of monthly on/off switches provided</li></ul>|None - must be specified.|
|Control     |1-5         |`i8`       |`ioprsw(1)` |Annual on/off switch<br><ul><li>`0` = off</li><li>`1` = on</li><li>`+n` = begin in year `n`</li><li>`-n` = stop after year `n`</li></ul>

**Need to complete**

## Examples ##

**Here would link to automated tests and/or examples for this operating rule**

## Troubleshooting ##

**Here can describe how to troubleshoot**

## See Also ##

**Here would link to other relevant operating rules or other information**
