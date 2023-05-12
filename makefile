test:
	./atastandings --help # > /dev/null
	./atastandings -l
	./atastandings -I -l -S nj
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

readme: \
	readme-school-in-world \
	readme-school-in-worlds-or-state \
	readme-leading-in-worlds-state \
	readme-state-champions \
	readme-state-champions-with-divisions \
	readme-state-champion-names \
	readme-district-eligible-by-division \
	readme-district-eligible-by-name \
	readme-district-elibigle-students \
	readme-competitors-in-division \
	readme-competitors-multiple-divisions \
	readme-district-divisions-from-school \
	readme-district-forms-divisions-from-school

readme-school-in-world:
	./atastandings -R lorem.words -M 10 \
		-G "Show School's Students in the World Standings" \
		--worlds --search aurora
readme-school-in-worlds-or-state:
	./atastandings -R lorem.words -M 10 \
		-G "Show School's Students in Either Worlds or State Standings" \
		--worlds --state co --search aurora
readme-leading-in-worlds-state:
	./atastandings -R lorem.words -M 10 \
		-G "Show Students Leading Competition in Worlds or States" \
		--worlds --state co --search aurora --maximum-place 1
readme-state-champions:
	./atastandings -R lorem.words -M 10 \
		-G "Show State Champions (after final results)" \
		--state co --search aurora --maximum-place 1
readme-state-champions-with-divisions:
	./atastandings -R lorem.words -M 10 \
		-G "Show State Champion Names with Divisions (after final results)" \
		--by-person-with-divisions --state co --search aurora --maximum-place 1 \
		--omit points --omit location --omit region
readme-state-champion-names:
	./atastandings -R lorem.words -M 10 \
		-G "Print State Champion Names (after final results)" \
		--by-person --state co --search aurora --maximum-place 1 --omit location
readme-district-eligible-by-division:
	./atastandings -R lorem.words -M 10 \
		-G "Show District Championship Eligible Students by Division (after final results)" \
		--state co --search aurora --maximum-place 10
readme-district-eligible-by-name:
	./atastandings -R lorem.words -M 10 \
		-G "Show District Championship Eligible Students by Name (after final results)" \
		--by-person-with-divisions --state co --search aurora --maximum-place 10 \
		--omit points --omit location --omit region
readme-district-elibigle-students:
	./atastandings -R lorem.words -M 10 \
		-G "Show Names of District Championship Eligible Students (after final results)" \
		--by-person --state co --search aurora --maximum-place 10 --omit location
readme-competitors-in-division:
	./atastandings -R lorem.words -M 10 \
		-G "Show Competitors of a Division" \
		--worlds --division-code B01B
readme-competitors-multiple-divisions:
	./atastandings -R lorem.words -M 10 \
		-G "Show Competitors of Multiple Divisions" \
		--division-code W23A --division-code M23A
readme-district-divisions-from-school:
	./atastandings -R lorem.words -M 10 \
		-G "Show Rockies Districts Students from Aurora" \
		--district Rockies --keep-division-if aurora
readme-district-forms-divisions-from-school:
	./atastandings -R lorem.words -M 10 \
		-G "Show Rockies Districts Forms Competition with Students from Aurora" \
		--district Rockies --keep-division-if aurora --competition forms

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

save:
	./atastandings -b -W -S nj -S pa -S ca -O location

run-black:
	black -l 120 atastandings

run-pylint:
	pylint3 atastandings
