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
For example, you can use use this option if there are problems on your system with the cache directory.
Doing this will give you slower response times when you run the program again.


## Getting Help and Miscellaneous Other Options

* `--dots`, `-.` -- Dots will be printed for each file that is being retrieved from the web or the cache.

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
    omit: "string"
    list-division-codes: false
    cache-directory: "string"
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
 10 Sgaititssupsendsise Daipbusdsmepre 20 AURORA, CO
DIVISION WORLDS M01B Combat Weapons Men 1st Degree Black Belt 30 - 39 Years Old
 Place Name Pts Location
 9 Fermentumpelleentsequ Inceptoshabitasse 16 AURORA, CO
DIVISION WORLDS MBCB Forms Men Special Abilities Black Belt-Cognitive 30 - 99 Years Old
 Place Name Pts Location
 2 Proinac Seneuctsefeils 26 AURORA, CO
. . .
```

## `Show School's Students in Either Worlds or State Standings`
`atastandings --worlds --state co --search aurora`

Show all students from Aurora, Colorado in either the worlds or Colorado state standings.

```
WORLD STANDINGS, searching for 'aurora', maximum place of 99
DIVISION WORLDS B123A Creative Weapons Boys 1st-3rd Creative Weapons Black Belt 1 - 8 Years Old
 Place Name Pts Location
 10 Morbimsociosqu Ncasertutmepro 20 AURORA, CO
DIVISION WORLDS M01B Combat Weapons Men 1st Degree Black Belt 30 - 39 Years Old
 Place Name Pts Location
 9 Accumasnitncdiutn Uqamqidi 16 AURORA, CO
DIVISION WORLDS MBCB Forms Men Special Abilities Black Belt-Cognitive 30 - 99 Years Old
 Place Name Pts Location
 2 Unnconuge Hbaitnatoscisoqus 26 AURORA, CO
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
 1 Diooloe Temporhca Otnetipissu 40 AURORA, CO
DIVISION CO B01B Sparring Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Lcetsuin Loaretelacinia 20 AURORA, CO
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
 1 Amximsusoadless Dictumrcasc Rmisirultreicsm 40 AURORA, CO
DIVISION CO B01B Sparring Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Netavle Phasellusfiinbusf 20 AURORA, CO
DIVISION CO B01C Forms Boys 1st Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 1 Omntsefirnglilaf Unncnemie 16 AURORA, CO
. . .
```

## `Show State Champion Names with Divisions (after final results)`
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 1 --omit points --omit location --omit region`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. Include with each name the divisions they are state champions in. Do not print the location, points or region values.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Neaibtupsitucmst Abhitasseainecptso | 1 B123A Weapons Boys 1st, 2nd, 3rd Degree Black Belt 1 - 8 Years Old
Liberopltaea Actitimobri | 1 B01C Sparring Boys 1st Degree Black Belt 11 - 12 Years Old
Uaicbusproin Acutroeelmetnume | 1 MBCB Weapons Men Special Abilities Black Belt-Cognitive 30 - 99 Years Old
Ingillfaudi Adpiubsreose | 1 GCOE Sparring Girls Color Belt 15 - 17 Years Old
Einmin Ahbitsaselefiedn | 1 BCOA X-Treme Weapons Boys X-Treme Weapon Color Belt 1 - 8 Years Old
Tpemsumattis Aicuilsloitar | 1 G01D Creative Forms Girls 1st Degree Creative Forms Black Belt 13 - 14 Years Old
Emtporue Aliquetamursi | 1 GCOC Combat Weapons Girls Color Belt 11 - 12 Years Old
Elmeentmupltaea Aliquethimenoaesh | 1 M45B Combat Weapons Men 4th, 5th Degree Black Belt 30 - 39 Years Old
Rocioteima Amserisus | 1 MBCB X-Treme Forms Men Special Abilities X-Treme Forms Black Belt-Cognitive 30 - 99 Years Old
. . .
```

## `Print State Champion Names (after final results)`
`atastandings --by-person --state co --search aurora --maximum-place 1 --omit location`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. Print *ONLY* their names, without their location.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Aliquamquisque Accumasnin
Nicetposielo Acniialmeolseti
Athabitant Aicuilsalqiueta
Aneenaasgitits Aloretenma
Inhbnnam Amursitortor
Mrobihapretra Anteaidpicsign
Enaitbusptempor Arcuornare
Vulputatemrobim Arcupuursq
Osureeunnc Aurcaruis
. . .
```

## `Show District Championship Eligible Students by Division (after final results)`
`atastandings --state co --search aurora --maximum-place 10`

After the results are finalized, show all students from Aurora, Colorado who are eligible to compete in the District Champoionships.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
DIVISION CO B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 3 Rutrumdoioo Veihcualcras 3 AURORA, CO
 4 Idierta Maecenasoprat 1 AURORA, CO
DIVISION CO B01B Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 2 Tristiquepironp Cacumasnim 6 AURORA, CO
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
. . .
```

## `Show District Championship Eligible Students by Name (after final results)`
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 10 --omit points --omit location --omit region`

After the results are finalized, show all students from Aurora, Colorado, sorted by name, who are eligible to compete in the District Champoionships. Include with each name the divisions they are state champions in. Do not print the location, points or region values.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Torquenthaertar Abhitasseanicetposi | 4 GCOA Sparring Girls Color Belt 1 - 8 Years Old
Sepmereclriesque Abiatntsce | 3 B23C Combat Weapons Boys 2nd, 3rd Degree Black Belt 11 - 12 Years Old
Inecptsonemie Acsuer | 2 G23C Forms Girls 2nd, 3rd Degree Black Belt 11 - 12 Years Old
Laciniaamse Admattis | 2 GCOA Weapons Girls Color Belt 1 - 8 Years Old
Eiltaurc Aeneannno | 1 W45C Combat Weapons Women 4th, 5th Degree Black Belt 40 - 49 Years Old
Doioolutrciesu Alqiuetavitae | 5 GCOB Combat Weapons Girls Color Belt 9 - 10 Years Old
Risusnno Ametacniial | 6 BCOA Combat Weapons Boys Color Belt 1 - 8 Years Old
Feamsfhabitant Amseefficitur | 2 WCOC Forms Women Color Belt 40 - 49 Years Old
Sempervloutapt Anaguid | 1 M45B Forms Men 4th, 5th Degree Black Belt 30 - 39 Years Old
. . .
```

## `Show Names of District Championship Eligible Students (after final results)`
`atastandings --by-person --state co --search aurora --maximum-place 10 --omit location`

After the results are finalized, show all students from Aurora, Colorado, sorted by name, who are eligible to compete in the District Champoionships. Print *ONLY* their names, without their location.

```
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Vlehrnoucsrr Abhitasseatpemsu
Doiontedrum Etiammorbi Acniialelti
Nqeuenomletsiem Acocnsetcetru
Ailqumanaotquen Acutroolborits
Mobritaciti Adpiubsrabitucr
Unncdoioo Aguueajsutol
Lacuscommodoc Aidpicsignlaecrta
Quamahbitsase Ailcisivieltv
Nqeunnec Ailqutecosnequta
. . .
```

## `Show Competitors of a Division`
`atastandings --worlds --division-code B01B`

Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` (`B01B`) division at Worlds.

```
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Olrmentosar Ailqumatnedurm 93 DES PERES, MO
 2 Oscisoqushocnusr Vehiculapellentesque 92 HUNTERSVILLE, NC
 3 Puruscongue Vulputaterinigllaf 83 HENDERSON, NV
 3 Massalsas Portagetee 83 SAN DIEGO, CA
 5 Laoreetsapien Etdsi 82 SUWANEE, GA
 6 Psmumauris Enquenuisomd 70 SAN DIEGO, CA
 7 Loareteloe Reinetgeri 68 LAS VEGAS, NV
. . .
```

## `Show Competitors of Multiple Divisions at Worlds`
`atastandings --division-code W23A --division-code M23A`

Show all of the competitors in the top 10 for both the `WOMENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`W23A`) and `MENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`M23A`) divisions.

```
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS W23A Forms Women 2nd, 3rd Degree Black Belt 18 - 29 Years Old
 Place Name Pts Location
 1 Dnoecdulal Mangaronaer 96 MOORESVILLE, NC
 2 Mobriolils Doioulalmcoprer 84 CONCORD, NC
 3 Vneentaisvelit Vestibulumpharetra 82 MISHAWAKA, IN
 4 Commodoums Racualuctus 52 MURRIETA, CA
 5 Nacsetrunisl Fiaclsisifipmerideti 42 HENDERSON, NV
 6 Nbihposuere Fermentumpleletnesuqe 40 EAGAN, MN
 7 Itncdiutnivavumsvv Duisenaitbusp 38 SANTA ROSA, CA
. . .
```

## `Show Rockies Districts Students from Aurora`
`atastandings --district Rockies --keep-division-if aurora`

Show all divisions in the Rockies district that have a student from Aurora in the division.

```
DISTRICT STANDINGS FOR Rockies, maximum place of 99
DIVISION Rockies B01B Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location
 1 Lualcmoperrblnaditc Naotquenoseurep 76 DES PERES, MO
 2 Nepctosnec Elojsutol 46 AMERICAN FORK, UT
 3 Ututlriceis Ultreicsmntea 33 COLUMBIA, MO
 4 Usecnibh Mrausiclasu 28 FORT COLLINS, CO
 5 Tvvcrussu Etdoio 17 LEES SUMMIT, MO
 6 Lbieorulnlna Prteiumpnepctos 15 O'FALLON, MO
 7 Uidocmmdoo Ietaacsu 7 DES PERES, MO
. . .
```

## `Show Rockies Districts Forms Competition with Students from Aurora`
`atastandings --district Rockies --keep-division-if aurora --competition forms`

Show all forms divisions in the Rockies district that have a student from Aurora in the division.

```
DISTRICT STANDINGS FOR Rockies, maximum place of 99
DIVISION Rockies B23C Forms Boys 2nd, 3rd Degree Black Belt 11 - 12 Years Old
 Place Name Pts Location
 1 Sdenlis Isisus 26 ARVADA, CO
 2 Vvierarfuegita Vestibulumloitar Aspinefuaciubs 19 O'FALLON, MO
 3 Otnetipnascetur Puursqce 18 LEES SUMMIT, MO
 4 Otrqunetolborits Ltecsuhparerta 12 O'FALLON, MO
 5 Luctusoscisoqus Ipmeridetiabiatnt 10 CHESTERFIELD, MO
 6 Aguueahac Nuncurbaitru 5 KEARNEY, MO
 7 Sgtiistquisque Idamdetli 4 RIO RANCHO, NM
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

