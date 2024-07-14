# ATA (American Taekwondo Association) World and State Standings Printer

The American Taekwondo Association's tournament series has its results online.
However, the user interface is oriented towards looking at a division at a time
and has no provisions for searching based on a person's name or school.

# atastandings Options

All `atastandings` options are specified using two hyphens (`--`) and the option name,
possibly followed by an argument such as a search string or a state/province abbreviation.
There are also short versions of most of the options that are a single hyphen and a single lettter.

## Worlds, District and State Standings
The default for `atastandings` is to search the world standings.
You can instead ask it to search one or more state or district standings.

* `--worlds`, `-W` -- search the world standings.
* `--district name`, `-d name` -- search the given district, one of
    `Mid-America`,
    `Midwest`,
    `Northeast`,
    `Northwest`,
    `Rockies`,
    `Southeast`,
    `South`,
    or `Southwest`.
This may be specified multiple times.
* `--state ABBREV`, `-S ABBREV` -- search the given state or province, using the two character state or province postoffice code.
This may be specified multiple times.

For example, both `atastandings` and  `atastandings --worlds` will search the world standings.
`atastandings --district northeast` will search the Northeast district.
`atastandings --state pa --state ca` will search the state standings for Pennsylvania and California.
`atastandings --worlds --state ca` will search both the world stands and the state standings for California.

## Division Control

The default for `atastandings` is to print information for *all* divisions.
Alternatively, you can restrict your output to specific division codes.
For example, the division code for **1st Degree Black Belt Age 9 - 10** is *B01B*.

To find out what the division codes are, you can get a list:

* `--list-division-codes`, `-l` -- list all of the division codes.
This  can be combined with  `--district name`, or `--state STATE-ABBREV` to get the division codes specific to a state/province.

* `--division-code code`, `-c code` -- Restrict the output to the specified diision code.
This may be specified multiple times.
* `--competition competition` -- Only print this competition, one of
    `forms`,
    `weapons`,
    `combat-weapons`,
    `sparring`,
    `creative-forms`,
    `creative-weapons`,
    `x-treme-forms`,
    or `x-treme-weapons`.
May be specified multiple times.

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
where `item` is one of `location`, `place`, `points`, `region`, `division` or `code`.
The `region` is either the world "WORLDS" or the state or province name.
The code is the division code.
This may be specified multiple times.

* `--minimize item`, `-m item` -- Minimize information from the printouts,
where `item` is currently only `division`.
For `division`, a division such as `Forms Boys Color Belt 9 - 10 Years Old` would be minimized to just `Forms`.
        (The division code, which is usually printed as well, can be used to differentiate between divisions.)
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
* `--ignore-cache-times`, `-T` -- Sometimes you want to ignore that the fact that the cache file is older than 24 hours.
* `--do-not-write-cache`, `-D` -- Sometimes you might want the cache files to not be written.
For example, you can use this option if there are problems on your system with the cache directory.

        Note: Not using the cache will give you slow response times each time you run the program because of the web lookups.


## Getting Help and Miscellaneous Other Options

* `--dots`, `-.` -- Dots or colons will be printed for each file that is being retrieved from the web (":") or the cache (".".

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


# Sample Use Examples

The following examples show some of the ways that the various options can be combined together.
All sample output uses fictitious names, and only shows the first 10 lines of the output.


## `Show School's Students in the World Standings`
`atastandings --worlds --search "aurora, co"`

Show all students from Aurora, Colorado in the world standings.

```
WORLD STANDINGS, searching for 'aurora, co', maximum place of 99
DIVISION WORLDS B123A Creative Weapons Boys 1st-3rd Creative Weapons Black Belt 1 - 8 Years Old
 Place Name Pts Location
 10 Musrilndaict Massaurpsi 20 AURORA, CO
DIVISION WORLDS M01B Combat Weapons Men 1st Degree Black Belt 30 - 39 Years Old
 Place Name Pts Location
 9 Disproin Aliquetpharetra 16 AURORA, CO
DIVISION WORLDS MBCB Forms Men Special Abilities Black Belt-Cognitive 30 - 99 Years Old
 Place Name Pts Location
 2 Inceptosdictum Aguueamontes 26 AURORA, CO
. . .
```

## `Show School's Students in Either Worlds or State Standings`
`atastandings --worlds --state co --search aurora`

Show all students from Aurora, Colorado in either the worlds or Colorado state standings.

```
WORLD STANDINGS, searching for 'aurora', maximum place of 99
DIVISION WORLDS B123A Creative Weapons Boys 1st-3rd Creative Weapons Black Belt 1 - 8 Years Old
 Place Name Pts Location
 10 Etlintea Metusvlupuattev 20 AURORA, CO
DIVISION WORLDS M01B Combat Weapons Men 1st Degree Black Belt 30 - 39 Years Old
 Place Name Pts Location
 9 Vulputatemaecenas Lobortisctum 16 AURORA, CO
DIVISION WORLDS MBCB Forms Men Special Abilities Black Belt-Cognitive 30 - 99 Years Old
 Place Name Pts Location
 2 Nfacilisis Counbiaclroem 26 AURORA, CO
. . .
```

## `Show Students Leading Competition in Worlds or States`
`atastandings --worlds --state co --search aurora --maximum-place 1`

Show all students from Aurora, Colorado leading the competition in either the worlds or state standings.

```
WORLD STANDINGS, searching for 'aurora', maximum place of 1

STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Xence Sdeahbitsase Hapretramaxismu 40 AURORA, CO
DIVISION CO B01B Sparring Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Hnedreirtrhnocusr Ultriciespraesent 20 AURORA, CO
DIVISION CO B01C Forms Boys 1st Degree Black Belt 11 - 12 Years Old
. . .
```

## `Show State Champions (after final results)`
`atastandings --state co --search aurora --maximum-place 1`

After the results are finalized, show all state champions from Aurora, Colorado.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Susloitar Etliunnc Pahselluspste 40 AURORA, CO
DIVISION CO B01B Sparring Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Blanditiiduculsri Ntosarsed 20 AURORA, CO
DIVISION CO B01C Forms Boys 1st Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 1 Tlelsuotrtro Metatrotort 16 AURORA, CO
. . .
```

## `Show State Champion Names with Divisions (after final results)`
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 1 --omit points --omit location --omit region`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. Include with each name the divisions they are state champions in. Do not print the location, points or region values.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Raivdagaccumsan Aceenasimperdiet | 1 G01B X-Treme Forms Girls 1st Degree X-Treme Forms Black Belt 9 - 10 Years Old
Facilisisrnrae Adinhbn | 1 B123A Sparring Boys 1st, 2nd, 3rd Degree Black Belt 1 - 8 Years Old
Parturientonuge Aloreteultrices | 1 B23E Combat Weapons Boys 2nd, 3rd Degree Black Belt 15 - 17 Years Old
Mgansiomletsiem Amursiiaculis | 1 G01E Sparring Girls 1st Degree Black Belt 15 - 17 Years Old
Mxaimsumaxismu Anagtcaiit | 1 MBCB X-Treme Weapons Men Special Abilities X-Treme Weapons Black Belt-Cognitive 30 - 99 Years Old
Ipsumidnoecd Anmmagna | 1 B01C X-Treme Forms Boys 1st Degree X-Treme Forms Black Belt 11 - 12 Years Old
Niteegrntea Antetristique | 1 G01B Combat Weapons Girls 1st Degree Black Belt 9 - 10 Years Old
Ollcitiuindlbierol Aolreetolborits | 1 B01C Sparring Boys 1st Degree Black Belt 11 - 12 Years Old
Loeerat Aptentsit | 1 M45B Forms Men 4th, 5th Degree Black Belt 30 - 39 Years Old
. . .
```

## `Print State Champion Names (after final results)`
`atastandings --by-person --state co --search aurora --maximum-place 1 --omit location`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. Print *ONLY* their names, without their location.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Mxaimsuposuere Adipiscingprimis
Pluvinraurna Aolreetfirnglilaf
Rsiituqetrultriecisu Arisudaipbusd
Usiodmac Aruisortittorp
Itnciudntmpedrieti Convallisroni
Cafermentum Doiooepllnetsqeupe
Rehimenoaesh Eegtros
Tempuseinm Effictiuremassa
Nerdeitrdnoecd Egteplatea
. . .
```

## `Show District Championship Eligible Students by Division (after final results)`
`atastandings --state co --search aurora --maximum-place 10`

After the results are finalized, show all students from Aurora, Colorado who are eligible to compete in the District Champoionships.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
DIVISION CO B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 3 Ptetnpluvianr Semperitncdiutn 3 AURORA, CO
 4 Egetetiam Justoda 1 AURORA, CO
DIVISION CO B01B Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 2 Ditcumtsaliquam Dintosar 6 AURORA, CO
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
. . .
```

## `Show District Championship Eligible Students by Name (after final results)`
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 10 --omit points --omit location --omit region`

After the results are finalized, show all students from Aurora, Colorado, sorted by name, who are eligible to compete in the District Champoionships. Include with each name the divisions they are state champions in. Do not print the location, points or region values.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Nullammattis Abiatnttmepsu | 5 BCOC Combat Weapons Boys Color Belt 11 - 12 Years Old
Dnoecjusto Acniialsoicosuq | 2 B23C Combat Weapons Boys 2nd, 3rd Degree Black Belt 11 - 12 Years Old
Tnedurmfusce Actitiortquent | 4 GCOC Combat Weapons Girls Color Belt 11 - 12 Years Old
Pretiumccaumsan Adipiscingbibenmdu | 2 W45C Weapons Women 4th, 5th Degree Black Belt 40 - 49 Years Old
Moelsteimassa Adpiiscniganm | 1 BCOA Forms Boys Color Belt 1 - 8 Years Old
Ultreicsmcongue Adpiubsigual | 1 MBCB X-Treme Forms Men Special Abilities X-Treme Forms Black Belt-Cognitive 30 - 99 Years Old
Utlriceisogune Afciilssipelleentsequ | 4 G23C Combat Weapons Girls 2nd, 3rd Degree Black Belt 11 - 12 Years Old
Auugeonstar Aguueavenenatis | 1 MBCB X-Treme Weapons Men Special Abilities X-Treme Weapons Black Belt-Cognitive 30 - 99 Years Old
Utailquma Ahbiatsesseneuctse | 1 BCOA Creative Weapons Boys Creative Weapons Color Belt 1 - 8 Years Old
. . .
```

## `Show Names of District Championship Eligible Students (after final results)`
`atastandings --by-person --state co --search aurora --maximum-place 10 --omit location`

After the results are finalized, show all students from Aurora, Colorado, sorted by name, who are eligible to compete in the District Champoionships. Print *ONLY* their names, without their location.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Rmisircnoubai Accumsansuspendisse
Faucibushimenaeos Aceenasingillfa
Odlaesslitora Idiulalmcoprer Aneeanaotnetip Acutrorasc
Famesfaiclissi Adpiiscnigpuursq
Morbimictmu Adpiubsisd
Faucibusonidmetnumc Afciilssirotittopr
Ulalarisu Ahbitsasecacumasn
Vneentaisvidctmustd Aidpicsignlemenetum
Rviadhaegte Ailcisirupis
. . .
```

## `Show Competitors of a Division`
`atastandings --worlds --division-code B01B`

Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` (`B01B`) division at Worlds.

```
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Lbooritser Apdiicsngieilt 93 DES PERES, MO
 2 Metani Onvlaliscloarete 92 HUNTERSVILLE, NC
 3 Esnecutsmusri Urbaitruhapretra 83 HENDERSON, NV
 3 Datmepsu Hcabbiendmu 83 SAN DIEGO, CA
 5 Iteaex Umganism 82 SUWANEE, GA
 6 Lutriecsaprtruietn Muetsmmrausi 70 SAN DIEGO, CA
 7 Secleirsqeuquisque Mattismoelstei 68 LAS VEGAS, NV
. . .
```

## `Show Competitors of Multiple Divisions at Worlds`
`atastandings --division-code W23A --division-code M23A`

Show all of the competitors in the top 10 for both the `WOMENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`W23A`) and `MENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`M23A`) divisions.

```
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS W23A Forms Women 2nd, 3rd Degree Black Belt 18 - 29 Years Old
 Place Name Pts Location
 1 Ortquentnisi Palcertannuc 96 MOORESVILLE, NC
 2 Ollciituidnlsas Ipmeridetiientgrei 84 CONCORD, NC
 3 Etditcumts Lbroistce 82 MISHAWAKA, IN
 4 Euaenean Hbaitnatcrussu 52 MURRIETA, CA
 5 Risusfiinbusf Efislsollicitudin 42 HENDERSON, NV
 6 Oprtaplesuadma Upultateonn 40 EAGAN, MN
 7 Tirstqiuetultreicsm Anagaguuea 38 SANTA ROSA, CA
. . .
```

## `Show Rockies Districts Students from Aurora`
`atastandings --district Rockies --keep-division-if aurora`

Show all divisions in the Rockies district that have a student from Aurora in the division.

```
DISTRICT STANDINGS FOR Rockies, maximum place of 99
DIVISION Rockies B01B Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Felisupultate Diusupesndisses 46 AMERICAN FORK, UT
 2 Dignissimteima Iiduculsridictum 28 FORT COLLINS, CO
 3 Nonfeils Ligulanetus 6 AURORA, CO
 3 Rrutmupurus Tnedurmmaximus 6 FORT COLLINS, CO
 5 Nmanepctos Asasrhoncus 1 RIO RANCHO, NM
 5 Praesentdiam Rimsiatits 1 WINDSOR, CO
DIVISION Rockies B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
. . .
```

## `Show Rockies Districts Forms Competition with Students from Aurora`
`atastandings --district Rockies --keep-division-if aurora --competition forms`

Show all forms divisions in the Rockies district that have a student from Aurora in the division.

```
DISTRICT STANDINGS FOR Rockies, maximum place of 99
DIVISION Rockies B23C Forms Boys 2nd, 3rd Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 1 Urpsiblieorl Tmeproptnet 26 ARVADA, CO
 2 Nollcitiuind Maxismuacsu 4 AURORA, CO
 2 Omletsiemviavmusv Veleeu 4 RIO RANCHO, NM
 4 Etesmepre Lbooritsujstol 2 WINDSOR, CO
 5 Lbroistoorl Ivavumsvvimneaeso 1 AURORA, CO
 5 Teimaamu Otrqunetanotuqenn 1 FORT COLLINS, CO
DIVISION Rockies GCOB Forms Girls Color Belt 9 - 10 Years Old
. . .
```

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

