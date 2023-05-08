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

The following examples show some of the ways that the various options can be combined together.
All sample output uses fictitious names, and only shows the first 10 lines of the output.

## Show School's Students in the World Standings
`atastandings --worlds --search "aurora, co"`

Show all students from Aurora, Colorado in the world standings.

``` shell
WORLD STANDINGS, searching for 'aurora, co' maximum place of 99
DIVISION WORLDS B01E Creative Forms Boys 1st Degree Creative Forms Black Belt 15 - 17 Years Old
 Place Name Pts Location 
 6 Vestibulumat 20 AURORA, CO
DIVISION WORLDS B01E Creative Weapons Boys 1st Degree Creative Weapons Black Belt 15 - 17 Years Old
 Place Name Pts Location 
 7 Raivdaglesuadma Pretiumudi 20 AURORA, CO
DIVISION WORLDS B01E X-Treme Forms Boys 1st Degree X-Treme Forms Black Belt 15 - 17 Years Old
 Place Name Pts Location 
 7 Feilsfames Noorl 15 AURORA, CO
. . .
```

## Show School's Students in Either Worlds or State Standings
`atastandings --worlds --state co --search aurora`
Show all students from Aurora, Colorado in either the worlds or Colorado state standings.
``` shell
WORLD STANDINGS, searching for 'aurora', maximum place of 99
DIVISION WORLDS B01E Creative Forms Boys 1st Degree Creative Forms Black Belt 15 - 17 Years Old
 Place Name Pts Location 
 6 Oseurepcnoubai 20 AURORA, CO
DIVISION WORLDS B01E Creative Weapons Boys 1st Degree Creative Weapons Black Belt 15 - 17 Years Old
 Place Name Pts Location 
 7 Osureeunnc Ailqutedioo 20 AURORA, CO
DIVISION WORLDS B01E X-Treme Forms Boys 1st Degree X-Treme Forms Black Belt 15 - 17 Years Old
 Place Name Pts Location 
 7 Ondmientmuhabitant Dimaceensa 15 AURORA, CO
. . .
```

## Show Students leading Competition in Worlds or States
`atastandings --worlds --state co --search aurora --maximum-place 1`

Show all students from Aurora, Colorado leading the competition in either the worlds or state standings.

``` shell
WORLD STANDINGS, searching for 'aurora', maximum place of 1

STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
DIVISION CO B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Xeconstecertu Daipbusdloitar 8 AURORA, CO
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Disipsum Blieorlpironp 14 AURORA, CO
DIVISION CO B01B Sparring Boys 1st Degree Black Belt 9 - 10 Years Old
. . .
```

## Show State Champions (after final results)
`atastandings --state co --search aurora --maximum-place 1`

After the results are finalized, show all state champions from Aurora, Colorado.

``` shell
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
DIVISION CO B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Oiocsquptoenit 8 AURORA, CO
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Euedioo Letcusnec 14 AURORA, CO
DIVISION CO B01B Sparring Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Ingillfanunc Porttitorsde 20 AURORA, CO
. . .
```

## Show State Champion Names with Divisions (after final results)
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 1 --omit points --omit location --omit region`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name.
Include with each name the divisions they are state champions in.
Do not print the location, points or region values.

``` shell
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Eclriesquescelerisque Ailcisimagna | 1 G01E Creative Weapons Girls 1st Degree Creative Weapons Black Belt 15 - 17 Years Old
Tuvle Asectrupluvianr | 1 B23C X-Treme Forms Boys 2nd, 3rd Degree X-Treme Forms Black Belt 11 - 12 Years Old
Ulalccaumsan Auugelgiual | 1 B23C Sparring Boys 2nd, 3rd Degree Black Belt 11 - 12 Years Old
Vneenaitsodnminetum Bibenmduprion | 1 WCOA Combat Weapons Women Color Belt 18 - 29 Years Old
Fuegitalutriecs Convallisdictumst | 1 WCOC X-Treme Forms Women X-Treme Forms Color Belt 40 - 49 Years Old
Ulnlnapsaines Counbiacamet | 1 MBCB X-Treme Forms Men Special Abilities X-Treme Forms Black Belt-Cognitive 30 - 99 Years Old
Pleletnesuqeatciit Crasupesndisses | 1 G01D Combat Weapons Girls 1st Degree Black Belt 13 - 14 Years Old
Tempusper Dnigissmidtortor | 1 B01C Sparring Boys 1st Degree Black Belt 11 - 12 Years Old
Pluvianrhbaitnat Dolorvelit | 1 MBCB Weapons Men Special Abilities Black Belt-Cognitive 30 - 99 Years Old
. . .
```

## Print State Champion Names (after final results)
`atastandings --by-person --state co --search aurora --maximum-place 1 --omit location`

After the results are finalized, show all state champions from Aurora, Colorado, sorted by name.
Print *ONLY* their names, without their location.

``` shell
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 1
Upesndissestellus Abhitasseaenquen
Accumsanfaucibus
Lroempenatibus Amursinam
Cacumasnnascetur Aolreetliqaum
Vlupuattevrsiituqetr Cnoubaionidmetnumc
Erhapretra Commodocornare
Aphsleuslmtea Cosnequtahparerta
Rfemneumtue Crussusgtiist
Auguesollicitudin Daipbusdamse
. . .
```

## Show District Championship Eligible Students by Division (after final results)
`atastandings --state co --search aurora --maximum-place 10`

After the results are finalized, show all students from Aurora, Colorado
who are eligible to compete in the District Champoionships.

``` shell
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
DIVISION CO B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Einmdioo 8 AURORA, CO 4 Tpemsuidctmustd Firnglilafusicpti 5 AURORA, CO 7 Lualcmoperrocmmdoocc Velittorquent Ultreicsmlifeend 1 AURORA, CO
DIVISION CO B01B Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 2 Naeenaaipsum Rhnocusrdiam 6 AURORA, CO
DIVISION CO B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Pretiumusjtlo Psmuoorl 14 AURORA, CO 2 Uctrounra Quisafciilssi 6 AURORA, CO 5 Natoquersiituqetr Raseetnalqiueta Qiusqeurviadha 3 AURORA, CO 5 Tacitiporta Saasaac 3 AURORA, CO 8 Nlisnihb Iidn 1 AURORA, CO 8 Antenma Tlelsunnuc 1 AURORA, CO
. . .
```

## Show District Championship Eligible Students by Name (after final results)
`atastandings --by-person-with-divisions --state co --search aurora --maximum-place 10 --omit points --omit location --omit region`

After the results are finalized, show all students from Aurora, Colorado, sorted by name,
who are eligible to compete in the District Champoionships.
Include with each name the divisions they are state champions in.
Do not print the location, points or region values.

``` shell
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Evhiuclavpulvinar Aatnemie | 4 BCOB Sparring Boys Color Belt 9 - 10 Years Old
Gravidapahsellusp Abaittnmlaesaudam | 2 WCOB Sparring Women Color Belt 30 - 39 Years Old
Olremlonidmetnumc Abiatntlndaict | 6 B23E Forms Boys 2nd, 3rd Degree Black Belt 15 - 17 Years Old
Ahbiatsesroni Acniialuid | 1 G01E Combat Weapons Girls 1st Degree Black Belt 15 - 17 Years Old
Cuonbaicsit Acsuulnlna | 2 B23C Sparring Boys 2nd, 3rd Degree Black Belt 11 - 12 Years Old
Mrobimdingissmi Actima | 6 B23C Combat Weapons Boys 2nd, 3rd Degree Black Belt 11 - 12 Years Old
Pahselluspsupsendsise Acutrovsetibluum | 6 GCOB Forms Girls Color Belt 9 - 10 Years Old
Ahcieta Adipiscingsme | 3 GCOB Forms Girls Color Belt 9 - 10 Years Old
Diooconsequat Adpiiscniglobortis | 8 BCOB Combat Weapons Boys Color Belt 9 - 10 Years Old
. . .
```

## Show Names of District Championship Eligible Students (after final results)
`atastandings --by-person --state co --search aurora --maximum-place 10 --omit location`

After the results are finalized, show all students from Aurora, Colorado, sorted by name,
who are eligible to compete in the District Champoionships.
Print *ONLY* their names, without their location.

``` shell
STATE STANDINGS FOR CO, searching for 'aurora', maximum place of 10
Blanditveilt Abiatntcelreisqeu
Ollcitiuindmaximus Aceenasrupis
Ocmmdooex Aciinasoadless
Usmeilt Adipiscingquam
Einmmi Adusm
Acutrofuegita Aeneanultrices
Enaitbuspivavumsvv Afciilssifinibus
Justoposuere Ahbiatsessgtiist
Mrobiuisomd Nmarurtum Ahcerp
. . .
```

## Show Competitors of a Division
`atastandings --worlds --division-code B01B`
Show who are competing in the `BOYS 1st Degree Black Belt 9 - 10 YEARS OLD` (`B01B`) division at Worlds.
``` shell
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS B01B Forms Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Saasaitnciudnt 88 SAN DIEGO, CA 2 Ltioareegstsa Tmepsusollicitudin 85 SALINE, MI 3 Liberoue Nicetposioprtap 75 SAN DIEGO, CA 4 Uctsuelo Rpimsiemtsu 70 BETHEL PARK, PA 5 Nineaibtups Etedioo 62 NAPLES, FL 6 Fuacibsuptreimup Uraibturcca 61 HOUSTON, TX 7 Esnecutsocmmdoo Constecertuidiuclusr 59 ALLEN, TX 8 Pluvianrrhnocusr Iqusequltircise 49 PHOENIX, AZ 9 Ispumetli Sitaciina 48 EAGAN, MN 10 Ietaporta Ncasertuqiusqeu 46 ORLANDO, FL
DIVISION WORLDS B01B Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Teimau Eliefednnacsetru 91 SAN DIEGO, CA 2 Upesndissescelreisqeu Arisulaecrta 85 SALINE, MI 3 Tisoscisoqus Ssucpitisnaotquen 75 HOUSTON, TX 4 Amganaguuea Niisictmu 72 DENHAM SPRINGS, LA 5 Ccaumsanissu Sagittiscnovallisc 71 PHOENIX, AZ 6 Dictumstssupednises Posuerelutrciesu 63 ALLEN, TX 7 Stefsuceg Amuinhbn 62 SUWANEE, GA 8 Geteeanm Eremntmuuctro 60 BETHEL PARK, PA 9 Muetsmpleletnesuqe Sapienientgrei 58 EAGAN, MN 10 Epllnetsqeupescelerisque Psmuunllan 51 ORLANDO, FL
DIVISION WORLDS B01B Combat Weapons Boys 1st Degree Black Belt 9 - 10 Years Old
 Place Name Pts Location 
 1 Molestielorem Ptaruirnteinterdum 91 PHOENIX, AZ 2 Nteaornare Notsraocnsceteutr 79 NAPLES, FL 3 Uallollcitiuind Ditcumtsid Cnoubaiim 58 CUTLER BAY, FL 4 Aruct Nveeanisttrotort 54 SALINE, MI 5 Urssueclriesque Ocnsqeutaaccumsan 52 DENHAM SPRINGS, LA 6 Atciitlqiamu Pretiummobri 51 PETALUMA, CA 7 Bibenmdufelis Aneeanami 46 CHULA VISTA, CA 7 Pahselulssaodlses Niterudmeelmetnume 46 ALLEN, TX 9 Eichulatmia Nqeuensenectus 42 MATTHEWS, NC 9 Idctmustdasas Mollismaeta 42 FOREST HILL, MD
. . .
```

## Show Competitors of Multiple Divisions at Worlds
`atastandings --division-code W23A --division-code M23A`
Show all of the competitors in the top 10 for both the `WOMENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`W23A`)
and `MENS 2nd, 3rd Degree Black Belt Age 18 - 29` (`M23A`) divisions.
``` shell
WORLD STANDINGS, maximum place of 99
DIVISION WORLDS W23A Forms Women 2nd, 3rd Degree Black Belt 18 - 29 Years Old
 Place Name Pts Location 
 1 Cnoubaivlupuattev 82 CONCORD, NC 2 Mxaimsulbroist Hcasuspendisse 52 MISHAWAKA, IN 3 Hparertamtea Rabitucrigual 49 ALLEN, TX 4 Tmeprolesuadma Hapretraientgrei 40 LAVEEN, AZ 5 Metaortittorp Dapibusvivamus 38 HIGHLAND, IN 6 Nibhacsu Sneecutsiginssmi 37 LAKEWOOD, CO 6 Aidpicsignest Ingillfaelo 37 MURPHY, TX 8 Ievrarhrnoucsrr Nihbnon 35 MURPHY, TX 9 Vloutaptrurtum Qaummattis 32 OREGON CITY, OR 10 Imocmmdoocc Utlriceissus 31 CUTLER BAY, FL 10 Ahbitsasesoadless Doiodignissim 31 WEST SACRAMENTO, CA 10 Crasmpedrieti Mlaesaudamocmmdoo 31 HEIDELBERG, PA
DIVISION WORLDS W23A Weapons Women 2nd, 3rd Degree Black Belt 18 - 29 Years Old
 Place Name Pts Location 
 1 Espmrelsas Anagnascetur 81 ALLEN, TX 2 Lacustmepsu Nisiusicpti 70 CONCORD, NC 3 Velletcus Lbooritsdius 51 HIGHLAND, IN 4 Ispummrobim Daipbusdomntse 48 SULPHUR SPRINGS, TX 5 Onidmetnumcjusto Eegstsainecptso 40 MISHAWAKA, IN 6 Pellentesqueatciit Insinda 31 OREGON CITY, OR 6 Blieorlunllan Gravidatincidunt 31 WEST SACRAMENTO, CA 8 Ousreealorete Roslbierol 30 MAIPU, SANTIAGO 8 Eegtaleusadam Qiusnqeun 30 CONCORD, NC 10 Quamlqiamu Eclriesqueorlelm 29 QUINCY, IL
DIVISION WORLDS W23A Combat Weapons Women 2nd, 3rd Degree Black Belt 18 - 29 Years Old
 Place Name Pts Location 
 1 Aneenanec Nostraltircise 64 HIGHLAND, IN 1 Scelerisqueesnecuts Convallismorbim 64 SULPHUR SPRINGS, TX 3 Naotquenauctor Adpiubsgetee 62 JONESBORO, AR 4 Sociosquhabitasse Raivdagmobri 53 MISHAWAKA, IN 5 Tepmuslibero Parturientveihcual 39 BARTLETT, TN 6 Tacitipuursq Feamsfusrsuu 38 ROANOKE, TX 7 Massaraseetn Hnedrreithatits 36 DES PERES, MO 7 Amseujstol Odlropatrurinet 36 LAKEWOOD, CO 7 Luctusnisl Isdn 36 ALLEN, TX 10 Usjtlosollicitudin Smecondimentum 35 LAVEEN, AZ
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
