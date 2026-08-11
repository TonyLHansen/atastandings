none:
	@echo make test - run a series of tests
	@echo make readme - regenerate the README.md file
	@echo make run-black run-pylint - run black and pylint

ATA_STANDINGS = ./atastandings
OFFLINE=

test:
	$(ATA_STANDINGS) $(OFFLINE) --help # > /dev/null
	$(ATA_STANDINGS) $(OFFLINE) -l
	if grep '^offline:' .atastandings.ini > /dev/null \
	|| echo $$ATA_STANDINGS | grep offline: > /dev/null; \
	then $(ATA_STANDINGS) $(OFFLINE) -l -S nj; else $(ATA_STANDINGS) -I -l -S nj; fi
	$(ATA_STANDINGS) $(OFFLINE) -S nj
	$(ATA_STANDINGS) $(OFFLINE) -S nj -p 3
	$(ATA_STANDINGS) $(OFFLINE) -B -W -S nj -s parlin -p 10
	$(ATA_STANDINGS) $(OFFLINE) -b -W -S nj -s parlin -p 10
	$(ATA_STANDINGS) $(OFFLINE) -b -W -O location
	$(ATA_STANDINGS) $(OFFLINE) -B -W -S nj -p 10
	$(ATA_STANDINGS) $(OFFLINE) -B -W -S nj -p 10 -O points -O region -O location
	$(ATA_STANDINGS) $(OFFLINE) -B -W -S nj -p 10 -O points -O region -O location -s parlin
	$(ATA_STANDINGS) $(OFFLINE) -b -W -S nj -p 10 -O points -O location -O region
	$(ATA_STANDINGS) $(OFFLINE) -B -W -S nj -s parlin -p 10 -O points -O location -O region
	$(ATA_STANDINGS) $(OFFLINE) -b -W -S nj -s parlin -p 10 -O points -O location -O region
	$(ATA_STANDINGS) $(OFFLINE) -B -W -S nj -s parlin -p 1 -O points -O location -O region
	$(ATA_STANDINGS) $(OFFLINE) -b -W -S nj -s parlin -p 1 -O points -O location -O region
	$(ATA_STANDINGS) $(OFFLINE) -W -S nj -s parlin -p 10
	$(ATA_STANDINGS) $(OFFLINE) -S nj -s parlin -p 10
	$(ATA_STANDINGS) $(OFFLINE) -S nj -s parlin -p 1
	$(ATA_STANDINGS) $(OFFLINE) -m division -S nj -s parlin -p 1
	$(ATA_STANDINGS) $(OFFLINE) -m division -d northeast -s parlin -p 1
	$(ATA_STANDINGS) $(OFFLINE) -m division -d northeast,mid-america -s parlin -p 1


readme: \
	readme-clear \
	readme-print-readme-heading \
	readme-school-in-world \
	readme-school-in-worlds-or-state \
	readme-leading-in-worlds-state \
	readme-state-champions \
	readme-state-champions-with-divisions \
	readme-state-champion-names \
	readme-leading-20-in-district \
	readme-district-eligible-by-division \
	readme-district-eligible-by-name \
	readme-district-elibigle-students \
	readme-competitors-in-division \
	readme-competitors-multiple-divisions \
	readme-district-divisions-from-school \
	readme-district-forms-divisions-from-school \
	readme-print-readme-trailer

readme-clear:
	rm -f new-readme

readme-print-readme-heading:
	@echo readme-print-readme-heading
	$(ATA_STANDINGS) $(OFFLINE) --print-readme-heading --output new-readme

readme-school-in-world:
	@echo readme-school-in-world
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show School's Students in the World Standings" \
		-2 "Show all students from Aurora, Colorado in the world standings." \
		--worlds --search "aurora, co"

readme-school-in-worlds-or-state:
	@echo readme-school-in-worlds-or-state
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show School's Students in Either Worlds or State Standings" \
		-2 "Show all students from Aurora, Colorado in either the worlds or Colorado state standings." \
		--worlds --state co --search aurora

readme-leading-in-worlds-state:
	@echo readme-leading-in-worlds-state
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Students Leading Competition in Worlds or States" \
		-2 "Show all students from Aurora, Colorado leading the competition in either the worlds or state standings." \
		--worlds --state co --search aurora --maximum-place 1

readme-state-champions:
	@echo readme-state-champions
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show State Champions (after final results)" \
		-2 "After the results are finalized, show all state champions from Aurora, Colorado." \
		--state co --search aurora --maximum-place 1

readme-state-champions-with-divisions:
	@echo readme-state-champions-with-divisions
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show State Champion Names with Divisions (after final results)" \
		-2 "After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. \
Include with each name the divisions they are state champions in. \
Do not print the location, points or region values." \
		--by-person-with-divisions --state co --search aurora --maximum-place 1 \
		--omit points --omit location --omit region

readme-state-champion-names:
	@echo readme-state-champion-names
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Print State Champion Names (after final results)" \
		-2 "After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. \
Print *ONLY* their names, without their location." \
		--by-person --state co --search aurora --maximum-place 1 --omit location

readme-leading-20-in-district:
	@echo readme-leading-20-in-district
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Top 20 Students Leading Competition in a District" \
		-2 "Show the top 20 students in the Rockies district plus Nevada." \
		--top --district rockies --state nv --maximum-place 20

readme-district-eligible-by-division:
	@echo readme-district-eligible-by-division
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show District Championship Eligible Students by Division (after final results)" \
		-2 "After the results are finalized, show all students from Aurora, Colorado \
who are eligible to compete in the District Champoionships." \
		--state co --search aurora --maximum-place 10

readme-district-eligible-by-name:
	@echo readme-district-eligible-by-name
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show District Championship Eligible Students by Name (after final results)" \
		-2 "After the results are finalized, show all students from Aurora, Colorado, sorted by name, \
who are eligible to compete in the District Champoionships. \
Include with each name the divisions they are state champions in. \
Do not print the location, points or region values." \
		--by-person-with-divisions --state co --search aurora --maximum-place 10 \
		--omit points --omit location --omit region

readme-district-elibigle-students:
	@echo readme-district-elibigle-students
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Names of District Championship Eligible Students (after final results)" \
		-2 "After the results are finalized, show all students from Aurora, Colorado, sorted by name, \
who are eligible to compete in the District Champoionships. \
Print *ONLY* their names, without their location." \
		--by-person --state co --search aurora --maximum-place 10 --omit location

readme-competitors-in-division:
	@echo readme-competitors-in-division
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Competitors of a Division" \
		-2 "Show who are competing in the \`BOYS 1st Degree Black Belt 9 - 10 YEARS OLD\` (\`B01B\`) division at Worlds." \
		--worlds --division-code B01B

readme-competitors-multiple-divisions:
	@echo readme-competitors-multiple-divisions
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Competitors of Multiple Divisions at Worlds" \
		-2 "Show all of the competitors in the top 10 for both the \`WOMENS 2nd, 3rd Degree Black Belt Age 18 - 29\` (\`W23A\`) \
and \`MENS 2nd, 3rd Degree Black Belt Age 18 - 29\` (\`M23A\`) divisions." \
		--division-code W23A --division-code M23A

readme-district-divisions-from-school:
	@echo readme-district-divisions-from-school
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Rockies Districts Students from Aurora" \
		-2 "Show all divisions in the Rockies district that have a student from Aurora in the division." \
		--district Rockies --keep-division-if aurora

readme-district-forms-divisions-from-school:
	@echo readme-district-forms-divisions-from-school
	$(ATA_STANDINGS) $(OFFLINE) -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Rockies Districts Forms Competition with Students from Aurora" \
		-2 "Show all forms divisions in the Rockies district that have a student from Aurora in the division." \
		--district Rockies --keep-division-if aurora --competition forms

readme-print-readme-trailer:
	@echo readme-print-readme-trailer
	$(ATA_STANDINGS) $(OFFLINE) --print-readme-trailer --output new-readme

new-readme: atastandings makefile
	: > new-readme
	$(MAKE) readme


parlin:
	$(ATA_STANDINGS) $(OFFLINE) -B --worlds -s parlin
	@echo
	@echo State Champions
	$(ATA_STANDINGS) $(OFFLINE) -b --state nj -s parlin --maximum-place 1 --omit location
	@echo
	@echo Advancing to Districts
	$(ATA_STANDINGS) $(OFFLINE) -b --state nj -s parlin --maximum-place 10 --omit location
	@echo
	@echo Districts Rings
	$(ATA_STANDINGS) $(OFFLINE) --district northeast -k parlin

parlin-T:
	$(ATA_STANDINGS) $(OFFLINE) -T -B --worlds -s parlin
	@echo
	@echo State Champions
	$(ATA_STANDINGS) $(OFFLINE) -T -b --state nj -s parlin --maximum-place 1 --omit location
	@echo
	@echo Advancing to Districts
	$(ATA_STANDINGS) $(OFFLINE) -T -b --state nj -s parlin --maximum-place 10 --omit location
	@echo
	@echo Districts Rings
	$(ATA_STANDINGS) $(OFFLINE) --district northeast -k parlin

save:
	$(ATA_STANDINGS) $(OFFLINE) -b -W -S nj -S pa -S ca -O location

run-black:
	black -l 120 atastandings

run-pylint:
	pylint --rc .pylintrc atastandings
