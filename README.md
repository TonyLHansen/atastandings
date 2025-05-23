# ATA (American Taekwondo Association) World and State Standings Printer

The American Taekwondo Association's tournament series has its results online.
However, the user interface is oriented towards looking at a division at a time
and has no provisions for searching based on a person's name or school.

# atastandings Options

All `atastandings` options are specified using two hyphens (`--`) and the option name,
possibly followed by an argument such as a search string or a state/province abbreviation.
There are also short versions of many of the options that are a single hyphen and a single lettter.

## Worlds, District, State and Top Standings
The default for `atastandings` is to search the world standings.
You can instead ask it to search one or more state or district standings.

* `--worlds`, `-W` -- search the world standings.
* `--district name`, `-d name` -- search the given district, one of
    'Mid-America',
    'Midwest',
    'North',
    'Northeast',
    'Northwest',
    'Rockies',
    'South',
    'Southeast' or
    'Southwest'.

This may be specified multiple times. You may also specify a list, as in `--district 'Midwest,South'`.
Or you may specify `--all-districts`.

* `--state ABBREV`, `-S ABBREV`, `--province ABBREV` -- search the given state or province,
using the two character state or province postoffice code. (`--state` and `--province` are
treated identically in the code.)

This may be specified multiple times. You may also specify a list, as in `--state 'CA,AK'`.
Or you may specify `--all-us`, `--all-us` or `--all-canada`.

For example, both `atastandings` and  `atastandings --worlds` will search the world standings.
`atastandings --district northeast` will search the Northeast district.
`atastandings --state pa --state ca` will search the state standings for Pennsylvania and California.
`atastandings --worlds --state ca` will search both the world stands and the state standings for California.

 `--top` -- This option can be combined with `--state`/`-S` and `--district`/`-d` to
print the top people across the specified states/provinces and districts in order.
(The `--maximum-place`/`-p` option can be used to change the number of places. See below.)

For example, `atastandings --top --maximum-place 20 --district Northeast` will
print the top 20 people in each division across states in the Northeast district.

## Division Control

The default for `atastandings` is to print information for *all* divisions.
Alternatively, you can restrict your output to specific division codes.
For example, the division code for **1st Degree Black Belt Age 9 - 10** is *B01B*.

To find out what the division codes are, you can get a list:

* `--list-division-codes`, `-l` -- list all of the division codes.
This  can be combined with `--district name`, or `--state STATE-ABBREV` to get the division codes specific to a state/province.

* `--division-code code`, `-c code` -- Restrict the output to the specified diision code.
This may be specified multiple times.
* `--competition competition` -- Only print this competition, one of
    'combat-weapons',
    'creative-forms',
    'creative-weapons',
    'forms',
    'sparring',
    'weapons',
    'x-treme-forms' or
    'x-treme-weapons'.
May be specified multiple times, or as a list such as `--competiton 'forms,weapons'`.

(Not all divisions have competitors in each state or province.
Also, color belt divisions will not show in the world standings list.)

## Searching

There are two types of searching available.
* `--search string`, `-s string` -- Only print entries that have this string in either the person's name OR the school location. (Case is ignored.)
* `--keep-division-if string`, `-k string` -- Only print a division if the string is found in any of the people's names or school locations in the division.

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
* `--by-person-with-divisions`, `-B` -- Print the names and location of each individual, followed by a list of their divisions.

## Omitting Information
Normally, `atastandings` will print all information, including such things as the location, place and points.
You can choose to omit pieces of information.

* `--omit item`, `-O item` -- Omit information from the printouts,
where `item` is one of 'code', 'division', 'location', 'place', 'points' or 'region'.
The `region` is either the world "WORLDS" or the state or province name.
The code is the division code.
This may be specified multiple times, or you may specify a list, as in `--omit 'location,place'`.

* `--minimize item`, `-m item` -- Minimize information from the printouts,
where `item` is currently only `division`.
For `division`, a division such as `Forms Boys Color Belt 9 - 10 Years Old` would be minimized to just `Forms`.
        (The division code, which is usually printed as well, can be used to differentiate between divisions.)
When there is more than `division` allowed, this may be specified multiple times or as a list.)

## Connection Options
When making connections there will be an occasional network failure. From the command line, you
can easily restart the command. But if being run in the background, a better strategy is to
retry the connection. To support this, you can set `--connection-count` to a value such as 10 with
a `--retry-interval` value such as `30` (seconds). When the `connection-count` is reached, the
program will exit with an error message. (Note: the `connection-count` restarts for each web
page requested.

To combat too many network failures, it is possible to set a pause after each successful network connection.
This can be set with --request-interval, which defaults to 1 second.

## Web Cache
By default, `atastandings` maintains a cache of the web sites, so that you can have faster response times
when you run the program multiple times.
Most of the time you can ignore that the cache is being used, but power users might want additional controls.

### *Standings Date* Cache
The default form of cache verification downloads the first state or world file that is needed, and looks
    }for the 'updated on' value. If the value is the same in each subsequent state/world standings file,
that state/world cache file will not be downloaded.
(If the first file is less than 5 minutes old, it will not be re-downloaded but used as-is.)
This type of cache verification is enabled using `--use-web-standings-dates`/`-w`.

### Time-Based Cache
With the time-based cache, files older than 24 hours are automatically re-downloaded.

### Turning Off Caching
The `-T`/`--ignore-cache` can be used if you wish to turn off caching.

* `--cache-directory PATH`, `-C PATH` -- This will set the cache directory to the given path.
It defaults to an os-specific temp directory.
* `--clean-cache` -- Sometimes you might wish to clean up all of the cached files.
All cache files are named `atastandings.` followed by a long string of characters representing the web file being referenced.
* `--ignore-existing-cache`, `-I` -- Sometimes you might want the existing cache to be ignored, but still created.
Doing this will give you slower response times.
* `--ignore-cache-times`, `-T` -- Sometimes you want to ignore that the fact that the cache file is older than 24 hours.
* `--do-not-write-cache`, `-D` -- Sometimes you might want the cache files to not be written.
For example, you can use this option if there are problems on your system with the cache directory.

You can use `--update-cache` to check the cached files and update them, without doing any further
analysis.

By default, the cache files are stored as read from the web. However, the `--gzip-cache` and
`--bzip2-cache` options cause the cache files to be compressed. The `gzip` algorithm is slightly
faster than the `bzip2` algorithm, but the latter creates slightly smaller files.

Another option is `--offline`, which causes the program to ONLY run via the cache and to give
an error if a required cache file is not found.

        Note: Not using the cache will give you slow response times every time you run the program because of the web lookups.


## Getting Help and Miscellaneous Other Options

* `--dots`, `-.` -- Dots or colons will be printed for each file that is being retrieved from the
web (":"), the time-based cache (".") or the updated-on date (",").

Finally, you can ask for help on what options are available:

* `--help`, `-h` -- Show a help message listing all of the options and variations.
* `--extended-help` -- Show the preamble of the README

## Configuration File
Some of the options shown above can be specified in a configuration file.
This should be a file named .atastandings.ini that lives in the same
directory/folder as the atastandings program itself or the user's
HOME/HOMEPATH directory/folder.
It consists of lines that have the configuration option, a colon (`:`) and a value.
Use `#` to start a comment.
Use `true` and `false` for boolean options. The options that can be specified in
the configuration file and their default values are:

    by-person: false
    by-person-with-divisions: false
    list-division-codes: false
    omit: ""
    minimize: ""
    cache-directory: ""
    dots: false
    gzip-cache: false
    bzip2-cache: false
    offline: false
    ignore-cache-times: false
    use-web-standings-dates: false
    connection-count: 1
    retry-interval: 30

Some options (such as `--dots`) have `--no-` versions that allow the option to be turned on
in the configuration file, and then be turned off from the command line. The options that currently
allow `--no-` options to be specified are:
'--no-bzip2-cache', '--no-dots', '--no-gzip-cache' or '--no-offline'.

## Configuration environment variable
The options in a configuration file are also settable in an ATASTANDINGS environment variable.
Use the same format as the configuration file, but separate the variables with a semi-colon ("`;`"),
as in `ATASTANDINGS='dots: true; list-division-codes: true'`.


# Sample Use Examples

The following examples show some of the ways that the various options can be combined together.
All sample output uses fictitious names, and only shows the first 10 lines of the output.


## `Show School's Students in the World Standings`
`atastandings --worlds --search "aurora, co"`

Show all students from Aurora, Colorado in the world standings.

```
WORLD STANDINGS, searching for 'aurora, co', maximum place of 99
DIVISION WORLDS B01D Combat Weapons Boys 1st Degree Black Belt 13 - 14 Years Old
 Place Name Pts Location
 8 Teimadsi Tlelsuquis 40 AURORA, CO
DIVISION WORLDS G01C Combat Weapons Girls 1st Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 9 Purussodales Pretiumlqiamu 44 AURORA, CO
DIVISION WORLDS G01D Creative Forms Girls 1st Degree Creative Forms Black Belt 13 - 14 Years Old
 Place Name Pts Location
 9 Maceensaultriecisu Rimsisupsendsise 25 AURORA, CO
. . .
```

## `Show School's Students in Either Worlds or State Standings`
`atastandings --worlds --state co --search aurora`

Show all students from Aurora, Colorado in either the worlds or Colorado state standings.

```
WORLD STANDINGS, searching for 'aurora', maximum place of 99
DIVISION WORLDS B01D Combat Weapons Boys 1st Degree Black Belt 13 - 14 Years Old
 Place Name Pts Location
 8 Nnucnma Idctmustdets 40 AURORA, CO
DIVISION WORLDS G01C Combat Weapons Girls 1st Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 9 Erviavmusv Loremlolrme 44 AURORA, CO
DIVISION WORLDS G01D Creative Forms Girls 1st Degree Creative Forms Black Belt 13 - 14 Years Old
 Place Name Pts Location
 9 Metusmoelstei Classt 25 AURORA, CO
. . .
```

## `Show Students Leading Competition in Worlds or States`
`atastandings --worlds --state co --search aurora --maximum-place 1`

Show all students from Aurora, Colorado leading the competition in either the worlds or state standings.

```
WORLD STANDINGS, searching for 'aurora', maximum place of 1
DIVISION WORLDS MBCB Sparring Men Special Abilities Black Belt-Cognitive 30 - 99 Years Old
 Place Name Pts Location
 1 Perastenmaximus Fsucegusi 31 AURORA, CO
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Smepren Volutpatnon 15 AURORA, CO
DIVISION CO B01C Forms Boys 1st Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
. . .
```

## `Show State Champions (after final results)`
`atastandings --state co --search aurora --maximum-place 1`

After the results are finalized, show all state champions from Aurora, Colorado.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Ntosarsaasa Ibbednumbsoadless 15 AURORA, CO
DIVISION CO B01C Forms Boys 1st Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 1 Mgansierta Doolrnullam 9 AURORA, CO
DIVISION CO B01C Combat Weapons Boys 1st Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 1 Constecertutlelsu Consequatoiocsqu Apdiicsngiaimdi 37 AURORA, CO
. . .
```

## `Show State Champion Names with Divisions (after final results)`
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 1 --omit points --omit location --omit region`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. Include with each name the divisions they are state champions in. Do not print the location, points or region values.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Olboritsauctor Acsupenatibus | 1 B01C Creative Weapons Boys 1st Degree Creative Weapons Black Belt 11 - 12 Years Old
Hapretraasgitits Acutronihb | 1 B01C X-Treme Weapons Boys 1st Degree X-Treme Weapons Black Belt 11 - 12 Years Old
Faemsrutrum Eloplatea Daaccumasn Ailqutepreasetn | 1 W23C X-Treme Weapons Women 2nd, 3rd Degree X-Treme Weapons Black Belt 40 - 49 Years Old
Phasellusisd Amganolrme | 1 GCOA Sparring Girls Color Belt 1 - 8 Years Old
Aneenautv Amueu | 1 GCOA Forms Girls Color Belt 1 - 8 Years Old
Vneenaitsut Amursiaptent | 1 GCOC Combat Weapons Girls Color Belt 11 - 12 Years Old
Commodoblieorl Anotuqenncnovallisc | 1 GCOE Combat Weapons Girls Color Belt 15 - 17 Years Old
Rhoncusnec Arcueiusmdo | 1 B123A Forms Boys 1st-3rd Degree Black Belt 1 - 8 Years Old
Enquenvitae Asasatits | 1 WCOB Combat Weapons Women Color Belt 30 - 39 Years Old
. . .
```

## `Print State Champion Names (after final results)`
`atastandings --by-person --state co --search aurora --maximum-place 1 --omit location`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. Print *ONLY* their names, without their location.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Vloutaptenmi Abaittnptnet
Erpdnigissmid Abhitasseaclasu
Ssupednisesodio Abiatntvuplutaet
Viavmusvlptaae Acutroegestas
Acocmmdoo Afciilssiletcus
Vitaeaceenas Ahbiatsesacutro
Namvoluttpa Aleusadamrcasc
Iamursi Aliquammanga
Ivavumsvvortittorp Aliquethparerta
. . .
```

## `Show Top 20 Students Leading Competition in a District`
`atastandings --top --district rockies --state nv --maximum-place 20`

Show the top 20 students in the Rockies district plus Nevada.

```
TOP 20 STANDINGS, in districts Rockies; and in states NV
DIVISION combined B23D Forms Boys 2nd, 3rd Degree Black Belt 13 - 14 Years Old
 Place Name Pts Location
 1 Haertarntedrum Atitsnemie 79 HENDERSON, NV
 2 Eichulaneaibtups Olilsactiti 39 HENDERSON, NV
 3 Lbooritsdapibus Morbivloutpta 34 NORTH LAS VEGAS, NV
 4 Posueresmepre Naotquenuprsu 22 HENDERSON, NV
 5 Perastenevstiublumv Faucibusnma 10 LAKEWOOD, CO
 6 Diailquma Lptaaefaucibus 9 HENDERSON, NV
 6 Asgititslulacmorepr Orcisenectus 9 LAKEWOOD, CO
. . .
```

## `Show District Championship Eligible Students by Division (after final results)`
`atastandings --state co --search aurora --maximum-place 10`

After the results are finalized, show all students from Aurora, Colorado who are eligible to compete in the District Champoionships.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
DIVISION CO B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 2 Semtempor Diums 10 AURORA, CO
 3 Quamnils Naotquenmaxismu 8 AURORA, CO
 5 Anotuqennaidpicsign Icutmmaecenas 1 AURORA, CO
DIVISION CO B01B Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 2 Onnpenatibus Efficiutreart 9 AURORA, CO
 3 Gainsmmrisitquet Fiinbsufeiusmdo 8 AURORA, CO
. . .
```

## `Show District Championship Eligible Students by Name (after final results)`
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 10 --omit points --omit location --omit region`

After the results are finalized, show all students from Aurora, Colorado, sorted by name, who are eligible to compete in the District Champoionships. Include with each name the divisions they are state champions in. Do not print the location, points or region values.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Onnfelis Aateart | 2 GCOB X-Treme Forms Girls X-Treme Forms Color Belt 9 - 10 Years Old
Pratplboorits Aciinaultriecisu | 5 G01B Forms Girls 1st Degree Black Belt 9 - 10 Years Old
Aicuilsros Acniialpuurs | 3 BCOA Combat Weapons Boys Color Belt 1 - 8 Years Old
Vieltvperdieit Acsuaprtruietn | 7 BCOA Combat Weapons Boys Color Belt 1 - 8 Years Old
Nnucmalesuada Adipiscingmaruis | 3 GCOE Sparring Girls Color Belt 15 - 17 Years Old
Pharetrausm Aeneanauctor | 5 B01C Forms Boys 1st Degree Black Belt 11 - 12 Years Old
Celaoreet Afciilssicommodo | 7 BCOA Forms Boys Color Belt 1 - 8 Years Old
Nodlaess Afciilssifuegita | 1 GCOA Weapons Girls Color Belt 1 - 8 Years Old
Uidproin Aguueaemtpor | 2 BCOB Forms Boys Color Belt 9 - 10 Years Old
. . .
```

## `Show Names of District Championship Eligible Students (after final results)`
`atastandings --by-person --state co --search aurora --maximum-place 10 --omit location`

After the results are finalized, show all students from Aurora, Colorado, sorted by name, who are eligible to compete in the District Champoionships. Print *ONLY* their names, without their location.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Efficiturrurtum Aataciina
Rinigllafaceenas Abiatntquisque
Mgansihimenoaesh Acicutm
Nateaperasten Acsuailqute
Nonsollicitudin Adiamd
Mxaimsunacsetru Adpiubsinteger
Sodalesahc Ahbitsaseispum
Uraibturcmaeta Ahbitsaseleo
Otnetipltecsu Aicuilseros
. . .
```

## `Show Competitors of a Division`
`atastandings --worlds --division-code B01B`

Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` (`B01B`) division at Worlds.

```
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Fuacibsuncasertu Aliquamnaotquen 96 HUNTERSVILLE, NC
 2 Idiuclusrfsuceg Rupistorquent 93 LIMERICK, PA
 3 Mrobimprimis Sollicitudinamximsu 91 SAN DIEGO, CA
 4 Lbierolctum Rasculal 79 SAN DIEGO, CA
 5 Ffciiurtenquen Justoat 71 SAN DIEGO, CA
 6 Soicosuqnveeanist Donecamu 65 DENHAM SPRINGS, LA
 6 Vitaelobortis Rmisirliqaum 65 NORTH LAS VEGAS, NV
. . .
```

## `Show Competitors of Multiple Divisions at Worlds`
`atastandings --division-code W23A --division-code M23A`

Show all of the competitors in the top 10 for both the `WOMENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`W23A`) and `MENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`M23A`) divisions.

```
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS W23A Forms Women 2nd, 3rd Degree Black Belt 18 - 29 Years Old
 Place Name Pts Location
 1 Porttitorfames Fringillablieorl 94 CONCORD, NC
 2 Olboritsipsumi Aolreetntosar 88 FORT WAYNE, IN
 3 Nlulmaissu Vneenaitsnisi 77 MURRIETA, CA
 4 Tinciduntfirnglilaf Adipiscingnullam 55 FORT LAUDERDALE, FL
 5 Eiusmdonetus Patrurinetuueg 51 MISHAWAKA, IN
 6 Omletsiemdapibus Tristiqueracua 50 WATAUGA, TX
 7 Elmeentmuusn Imipsum 37 SHELBY CHARTER TOWNSHIP, MI
. . .
```

## `Show Rockies Districts Students from Aurora`
`atastandings --district Rockies --keep-division-if aurora`

Show all divisions in the Rockies district that have a student from Aurora in the division.

```
DISTRICT STANDINGS FOR Rockies, maximum place of 99
DIVISION Rockies B23D Forms Boys 2nd, 3rd Degree Black Belt 13 - 14 Years Old
 Place Name Pts Location
 1 Etliunlal Itnciudntispum 10 LAKEWOOD, CO
 2 Amximsunulla Aceenasesnecuts 9 LAKEWOOD, CO
 3 Idros Mollismorbim 5 RIO RANCHO, NM
 4 Utvmpedrieti Etmproaruis 3 WINDSOR, CO
 4 Fcailsiicongue Naotquenunnc 3 AURORA, CO
DIVISION Rockies B23D Sparring Boys 2nd, 3rd Degree Black Belt 13 - 14 Years Old
 Place Name Pts Location
. . .
```

## `Show Rockies Districts Forms Competition with Students from Aurora`
`atastandings --district Rockies --keep-division-if aurora --competition forms`

Show all forms divisions in the Rockies district that have a student from Aurora in the division.

```
DISTRICT STANDINGS FOR Rockies, maximum place of 99
DIVISION Rockies B23D Forms Boys 2nd, 3rd Degree Black Belt 13 - 14 Years Old
 Place Name Pts Location
 1 Tcaiitturpis Orlelmvvierar 10 LAKEWOOD, CO
 2 Eegtpulvirna Lbieorcnoubai 9 LAKEWOOD, CO
 3 Namtee Loremlnbih 5 RIO RANCHO, NM
 4 Nuraumattis Onmtestempor 3 WINDSOR, CO
 4 Usrsuuunra Utcrouplacetra 3 AURORA, CO
DIVISION Rockies B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
. . .
```

# Installation
This program was written using python3, so you will need a python3 environment to run it.
You will also need the python `httpx` library.
(In my opinion, if you have a Windows system, the easiest way to install a full python3
environment is to install the MicroSoft WSL2 infrastructure, which will include python3
and many other tools.)

If you do not have the `httpx` library, you will need to run a command such as this to load it:
``` shell
pip3 install httpx
```

Depending on your installation, you may also need to install
the `pyyaml` library.

Put the atastandings script somewhere in your path, make sure it is executable
(in Linux and WSL, `chmod a+x atastandings`) and run it with the options you desire.
Or you can invoke the script directly with python3, as in `python3 atastandings` followed
by the options you desire.
You might need to execute it as `./atastandings` followed by the options you desire.

