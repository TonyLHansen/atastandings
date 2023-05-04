# ATA (American Taekwondo Association) World and State Standings Printer

The American Taekwondo Association's tournament series has its results online.
However, the user interface is oriented towards looking at a division at a time
and has no provisions for searching based on a person's name or school.

# atastandings Options

All `atastandings` options are specified using two hyphens (`--`) and the option name,
possibly followed by an argument such as a search string or a state/province abbreviation.
There are also short versions of most of the options that are a single hyphen and a single lettter.

## Worlds and State Standings
The default for `atastandings` is to search the world standings.
You can instead ask it to search one or more state standings.

* `--worlds` search the world standings
* `--state STATE-ABBREV` search the given state or province, using the two character state or province postoffice code.

For example, both `atastandings` and  `atastandings --worlds` will search the world standings.
`atastandings --state pa --state ca` will search the state standings for Pennsylvania and California.
`atastandings --worlds --state ca` will search both the world stands and the state standings for California.

## Division Control

The default for `atastandings` is to print information for *all* divisions.
Alternatively, you can restrict your output to specific division codes.
For example, the division code for **1st Degree Black Belt Age 9 - 10** is *B01B*.

To find out what the division codes are, you can get a list:

* `--list-division-codes` list all of the division codes.

This can be combined with `--state STATE-ABBREV` to get the division codes specific to a state/province.
(Not all divisions have competitors in each state or province.
Also, color belt divisions will not show in the world standings list.)

## Place Standings

The default for `atastandings` is to print all current place standings in each division.
The place standings for each state on the web site show the top 10 people, but you might only
be interested in who the first place leaders are.

* `--maximum-place MAXIMUM-PLACE` limit the output to only those whose place is less than or equal to the specified maximum place.

For example, `--maximum-place 1` would print only the first place leaders,
and `--maximum-place 4` will print only the top four contenders.

## Web Cache
By default, `atastandings` will maintain a cache of the web sites, so that you can have faster response times
when you run the program multiple times.
Most of the time you can ignore that the cache is being used, as cache files older than 24 hours are automatically ignored.
However power users might want additional controls.

* `--cache-directory PATH` This will set the cache directory to the given path.
It defaults to an os-specific temp directory.
* `--clean-cache` Sometimes you might wish to clean up all of the cached files.
All cache files are named `atastandings.` followed by a long string of characters representing the web file being referenced.
* `--ignore-existing-cache` Sometimes you might want the existing cache to be ignored, but still created.
Doing this will give you slower response times.
* `--do-not-write-cache` Sometimes you might want the cache files to not be written.
For example, you can use use this option if there are problems on your system with the cache directory.
Doing this will give you slower response times when you run the program again.


## Getting Help on the options

Finally, you can ask for help on what options are available:

* `--help` Show a help message listing all of the options and variations.


# Sample Use Examples

The following examples show how the various options can be combined together:

* `atastandings --worlds --search aurora`
Show all students from Aurora (any state) in the world standings.
* `atastandings --worlds --state co --search aurora`
Show all students from Aurora, Colorado in either the worlds or Colorado state standings.
* `atastandings --worlds --state co --search aurora --maximum-place 1`
Show all students from Aurora, Colorado leading the competition in either the worlds or state standings.
* `atastandings --state co --search aurora --maximum-place 1`
After the results are finalized, show all state champions from Aurora, Colorado.
* `atastandings --state co --search aurora`
After the results are finalized, show all students from Aurora, Colorado
who are eligible to compete in the District Champoionships.
* `atastandings --worlds --division-code B01B`
Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` (`B01B`) division at Worlds.
* `atastandings --worlds --division-code B01B`
Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` division at Worlds.

# Installation
This program was written using python3, so you will need a python3 environment to run it.
You will also need the python `requests` library.
(In my opinion, if you have a Windows system, the easiest way to install a full python3
environment is to install the MicroSoft WSL2 infrastructure, which will include python3
and many other tools.)

If you do not have the `requests` library, you will need to run a command such as this to load it:
``` shell
pip3 install requests
```

Put the atastandings script somewhere in your path, make sure it is executable
(in Linux and WSL, `chmod a+x atastandings`) and run it with the options you desire.
Or you can invoke the script directly with python3, as in `python3 atastandings` followed
by the options you desire.

