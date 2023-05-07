test:
	./atastandings --help # > /dev/null
	./atastandings -v -l
	./atastandings -v -I -l -S nj
	./atastandings -v -S nj
	./atastandings -v -S nj -p 3
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
	./atastandings -v -W -S nj -s parlin -p 10
	./atastandings -v -S nj -s parlin -p 10
	./atastandings -v -S nj -s parlin -p 1

readme:
	./atastandings -R lorem.words -M 10 \
		-G "Show School's Students in the World Standings" \
		--worlds --search aurora
	./atastandings -R lorem.words -M 10 \
		-G "Show School's Students in Either Worlds or State Standings" \
		--worlds --state co --search aurora
	./atastandings -R lorem.words -M 10 \
		-G "Show Students leading Competition in Worlds or States" \
		--worlds --state co --search aurora --maximum-place 1
	./atastandings -R lorem.words -M 10 \
		-G "Show State Champions (after final results)" \
		--state co --search aurora --maximum-place 1
	./atastandings -R lorem.words -M 10 \
		-G "Show State Champion Names with Divisions (after final results)" \
		--by-person-with-divisions --state co --search aurora --maximum-place 1 \
		--omit points --omit location --omit region
	./atastandings -R lorem.words -M 10 \
		-G "Print State Champion Names (after final results)" \
		--by-person --state co --search aurora --maximum-place 1 --omit location
	./atastandings -R lorem.words -M 10 \
		-G "Show District Championship Eligible Students by Division (after final results)" \
		--state co --search aurora --maximum-place 10
	./atastandings -R lorem.words -M 10 \
		-G "Show District Championship Eligible Students by Name (after final results)" \
		--by-person-with-divisions --state co --search aurora --maximum-place 10 \
		--omit points --omit location --omit region
	./atastandings -R lorem.words -M 10 \
		-G "Show Names of District Championship Eligible Students (after final results)" \
		--by-person --state co --search aurora --maximum-place 10 --omit location
	./atastandings -R lorem.words -M 10 \
		-G "Show Competitors of a Division" \
		--worlds --division-code B01B
	./atastandings -R lorem.words -M 10 \
		-G "Show Competitors of Multiple Divisions" \
		--division-code W23A --division-code M23A

parlin:
	./atastandings --worlds -s parlin
	./atastandings --state nj -s parlin --maximum-place 1
	./atastandings --state nj -s parlin --maximum-place 10

save:
	./atastandings -b -W -S nj -S pa -S ca -O location

run-black:
	black -l 120 atastandings

run-pylint:
	pylint3 atastandings
