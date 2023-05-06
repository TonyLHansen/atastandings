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

* `--worlds`, `-W` -- search the world standings
* `--state ABBREV`, `-S ABBREV` -- search the given state or province, using the two character state or province postoffice code.

For example, both `atastandings` and  `atastandings --worlds` will search the world standings.
`atastandings --state pa --state ca` will search the state standings for Pennsylvania and California.
`atastandings --worlds --state ca` will search both the world stands and the state standings for California.

## Division Control

The default for `atastandings` is to print information for *all* divisions.
Alternatively, you can restrict your output to specific division codes.
For example, the division code for **1st Degree Black Belt Age 9 - 10** is *B01B*.

To find out what the division codes are, you can get a list:

* `--list-division-codes`, `-l` -- list all of the division codes.

This can be combined with `--state STATE-ABBREV` to get the division codes specific to a state/province.
(Not all divisions have competitors in each state or province.
Also, color belt divisions will not show in the world standings list.)

## Place Standings

The default for `atastandings` is to print all current place standings in each division.
The place standings for each state on the web site show the top 10 people, but you might only
be interested in who the first place leaders are.

* `--maximum-place MAXIMUM-PLACE`, `-p MAXIMUM-PLACE` -- limit the output to only those whose place is less than or equal to the specified maximum place.

For example, `--maximum-place 1` would print only the first place leaders,
and `--maximum-place 4` will print only the top four contenders.

## By Person Printing (Champion Status)
Normally, `atastandings` prints the results arranged by division.
You might prefer the printout to be arranged by an individual's name instead, with or without the division information.
The names are printed in order, sorted by last name.
(Suffixes like "Jr." and prefixes like "van" are taken into consideration in the sorting process.)

* `--by-person`, `-b` -- Print the names and location of each individual.
* `--by-person-with-division`, `-B` -- Print the names and location of each individual, followed by a list of their divisions.

## Omitting Information
Normally, `atastandings` will print all information, including such things as the location, place and points.
You can choose to omit pieces of information.

* `--omit item`, `-O item` -- Omit information from the printouts, where `item` is one of `location`, `place`, `points`, `region`, `division` or `code`.
The `region` is either the world "WORLDS" or the state or province name.
The code is the division code.
This may be specified multiple times.

## Web Cache
By default, `atastandings` will maintain a cache of the web sites, so that you can have faster response times
when you run the program multiple times.
Most of the time you can ignore that the cache is being used, as cache files older than 24 hours are automatically ignored.
However power users might want additional controls.

* `--cache-directory PATH`, `-C PATH` -- This will set the cache directory to the given path.
It defaults to an os-specific temp directory.
* `--clean-cache` -- Sometimes you might wish to clean up all of the cached files.
All cache files are named `atastandings.` followed by a long string of characters representing the web file being referenced.
* `--ignore-existing-cache`, `-I` -- Sometimes you might want the existing cache to be ignored, but still created.
Doing this will give you slower response times.
* `--do-not-write-cache`, `-D` -- Sometimes you might want the cache files to not be written.
For example, you can use use this option if there are problems on your system with the cache directory.
Doing this will give you slower response times when you run the program again.


## Getting Help on the options

Finally, you can ask for help on what options are available:

* `--help`, `-h` -- Show a help message listing all of the options and variations.


# Sample Use Examples

The following examples show some of the ways that the various options can be combined together:

1. `atastandings --worlds --search aurora`
Show all students from Aurora (any state) in the world standings.
1. `atastandings --worlds --state co --search aurora`
Show all students from Aurora, Colorado in either the worlds or Colorado state standings.
1. `atastandings --worlds --state co --search aurora --maximum-place 1`
Show all students from Aurora, Colorado leading the competition in either the worlds or state standings.
1. `atastandings --state co --search aurora --maximum-place 1`
After the results are finalized, show all state champions from Aurora, Colorado.
1. `atastandings --by-person-with-divisions --state co --search aurora --maximum-place 1 --omit points --omit location --omit region`
After the results are finalized, show all state champions from Aurora, Colorado, sorted by name.
Include with each name the divisions they are state champions in.
Do not print the location, points or region values.
1. `atastandings --by-person --state co --search aurora --maximum-place 1 --omit location`
After the results are finalized, show all state champions from Aurora, Colorado, sorted by name.
Print *ONLY* their names, without their location.
1. `atastandings --state co --search aurora --maximum-place 10`
After the results are finalized, show all students from Aurora, Colorado
who are eligible to compete in the District Champoionships.
1. `atastandings --by-person-with-divisions --state co --search aurora --maximum-place 10 --omit points --omit location --omit region`
After the results are finalized, show all students from Aurora, Colorado, sorted by name,
who are eligible to compete in the District Champoionships.
Include with each name the divisions they are state champions in.
Do not print the location, points or region values.
1. `atastandings --by-person --state co --search aurora --maximum-place 10 --omit location`
After the results are finalized, show all students from Aurora, Colorado, sorted by name,
who are eligible to compete in the District Champoionships.
Print *ONLY* their names, without their location.
1. `atastandings --worlds --division-code B01B`
Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` (`B01B`) division at Worlds.
1. `atastandings --worlds --division-code B01B`
Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` (`B01B`) division at Worlds.
1. `atastandings --division-code W23A --division-code M23A`
Show all of the competitors in the top 10 for both the `WOMENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`W23A`)
and `MENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`M23A`) divisions.


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
You might need to execute it as `./atastandings` followed by the options you desire.
