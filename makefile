none:
	@echo make test - run a series of tests
	@echo make readme - regenerate the README.md file
	@echo make run-black run-pylint - run black and pylint

test:
	./atastandings --help # > /dev/null
	./atastandings -l
	if grep '^offline:' .atastandings.ini > /dev/null; then ./atastandings -l -S nj; else ./atastandings -I -l -S nj; fi
	./atastandings -S nj
	./atastandings -S nj -p 3
	./atastandings -B -W -S nj -s parlin -p 10
	./atastandings -b -W -S nj -s parlin -p 10
	./atastandings -b -W -O location
	./atastandings -B -W -S nj -p 10
	./atastandings -B -W -S nj -p 10 -O points -O region -O location
	./atastandings -B -W -S nj -p 10 -O points -O region -O location -s parlin
	./atastandings -b -W -S nj -p 10 -O points -O location -O region
	./atastandings -B -W -S nj -s parlin -p 10 -O points -O location -O region
	./atastandings -b -W -S nj -s parlin -p 10 -O points -O location -O region
	./atastandings -B -W -S nj -s parlin -p 1 -O points -O location -O region
	./atastandings -b -W -S nj -s parlin -p 1 -O points -O location -O region
	./atastandings -W -S nj -s parlin -p 10
	./atastandings -S nj -s parlin -p 10
	./atastandings -S nj -s parlin -p 1
	./atastandings -m division -S nj -s parlin -p 1
	./atastandings -m division -d northeast -s parlin -p 1
	./atastandings -m division -d northeast,mid-america -s parlin -p 1


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
	./atastandings --print-readme-heading --output new-readme

readme-school-in-world:
	@echo readme-school-in-world
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show School's Students in the World Standings" \
		-2 "Show all students from Aurora, Colorado in the world standings." \
		--worlds --search "aurora, co"

readme-school-in-worlds-or-state:
	@echo readme-school-in-worlds-or-state
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show School's Students in Either Worlds or State Standings" \
		-2 "Show all students from Aurora, Colorado in either the worlds or Colorado state standings." \
		--worlds --state co --search aurora

readme-leading-in-worlds-state:
	@echo readme-leading-in-worlds-state
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Students Leading Competition in Worlds or States" \
		-2 "Show all students from Aurora, Colorado leading the competition in either the worlds or state standings." \
		--worlds --state co --search aurora --maximum-place 1

readme-state-champions:
	@echo readme-state-champions
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show State Champions (after final results)" \
		-2 "After the results are finalized, show all state champions from Aurora, Colorado." \
		--state co --search aurora --maximum-place 1

readme-state-champions-with-divisions:
	@echo readme-state-champions-with-divisions
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show State Champion Names with Divisions (after final results)" \
		-2 "After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. \
Include with each name the divisions they are state champions in. \
Do not print the location, points or region values." \
		--by-person-with-divisions --state co --search aurora --maximum-place 1 \
		--omit points --omit location --omit region

readme-state-champion-names:
	@echo readme-state-champion-names
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Print State Champion Names (after final results)" \
		-2 "After the results are finalized, show all state champions from Aurora, Colorado, sorted by name. \
Print *ONLY* their names, without their location." \
		--by-person --state co --search aurora --maximum-place 1 --omit location

readme-leading-20-in-district:
	@echo readme-leading-20-in-district
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Top 20 Students Leading Competition in a District" \
		-2 "Show the top 20 students in the Rockies district plus Nevada." \
		--top --district rockies --state nv --maximum-place 20

readme-district-eligible-by-division:
	@echo readme-district-eligible-by-division
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show District Championship Eligible Students by Division (after final results)" \
		-2 "After the results are finalized, show all students from Aurora, Colorado \
who are eligible to compete in the District Champoionships." \
		--state co --search aurora --maximum-place 10

readme-district-eligible-by-name:
	@echo readme-district-eligible-by-name
	./atastandings -N lorem.words -M 10 \
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
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Names of District Championship Eligible Students (after final results)" \
		-2 "After the results are finalized, show all students from Aurora, Colorado, sorted by name, \
who are eligible to compete in the District Champoionships. \
Print *ONLY* their names, without their location." \
		--by-person --state co --search aurora --maximum-place 10 --omit location

readme-competitors-in-division:
	@echo readme-competitors-in-division
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Competitors of a Division" \
		-2 "Show who are competing in the \`BOYS 1st Degree Black Belt 9 - 10 YEARS OLD\` (\`B01B\`) division at Worlds." \
		--worlds --division-code B01B

readme-competitors-multiple-divisions:
	@echo readme-competitors-multiple-divisions
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Competitors of Multiple Divisions at Worlds" \
		-2 "Show all of the competitors in the top 10 for both the \`WOMENS 2nd, 3rd Degree Black Belt Age 18 - 29\` (\`W23A\`) \
and \`MENS 2nd, 3rd Degree Black Belt Age 18 - 29\` (\`M23A\`) divisions." \
		--division-code W23A --division-code M23A

readme-district-divisions-from-school:
	@echo readme-district-divisions-from-school
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Rockies Districts Students from Aurora" \
		-2 "Show all divisions in the Rockies district that have a student from Aurora in the division." \
		--district Rockies --keep-division-if aurora

readme-district-forms-divisions-from-school:
	@echo readme-district-forms-divisions-from-school
	./atastandings -N lorem.words -M 10 \
		 --output new-readme \
		-G "Show Rockies Districts Forms Competition with Students from Aurora" \
		-2 "Show all forms divisions in the Rockies district that have a student from Aurora in the division." \
		--district Rockies --keep-division-if aurora --competition forms

readme-print-readme-trailer:
	@echo readme-print-readme-trailer
	./atastandings --print-readme-trailer --output new-readme

new-readme: atastandings makefile
	: > new-readme
	$(MAKE) readme


parlin:
	./atastandings -B --worlds -s parlin
	@echo
	@echo State Champions
	./atastandings -b --state nj -s parlin --maximum-place 1 --omit location
	@echo
	@echo Advancing to Districts
	./atastandings -b --state nj -s parlin --maximum-place 10 --omit location
	@echo
	@echo Districts Rings
	./atastandings --district northeast -k parlin

parlin-T:
	./atastandings -T -B --worlds -s parlin
	@echo
	@echo State Champions
	./atastandings -T -b --state nj -s parlin --maximum-place 1 --omit location
	@echo
	@echo Advancing to Districts
	./atastandings -T -b --state nj -s parlin --maximum-place 10 --omit location
	@echo
	@echo Districts Rings
	./atastandings --district northeast -k parlin

save:
	./atastandings -b -W -S nj -S pa -S ca -O location

run-black:
	black -l 120 atastandings

run-pylint:
	pylint3 atastandings
