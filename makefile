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
	./atastandings --randomize-names lorem.words --worlds --search aurora | sed 10q
	./atastandings --randomize-names lorem.words --worlds --state co --search aurora | sed 10q
	./atastandings --randomize-names lorem.words --worlds --state co --search aurora --maximum-place 1 | sed 10q
	./atastandings --randomize-names lorem.words --state co --search aurora --maximum-place 1 | sed 10q
	./atastandings --randomize-names lorem.words --by-person-with-divisions --state co --search aurora --maximum-place 1 --omit points --omit location --omit region | sed 10q
	./atastandings --randomize-names lorem.words --by-person --state co --search aurora --maximum-place 1 --omit location | sed 10q
	./atastandings --randomize-names lorem.words --state co --search aurora --maximum-place 10 | sed 10q
	./atastandings --randomize-names lorem.words --by-person-with-divisions --state co --search aurora --maximum-place 10 --omit points --omit location --omit region | sed 10q
	./atastandings --randomize-names lorem.words --by-person --state co --search aurora --maximum-place 10 --omit location | sed 10q
	./atastandings --randomize-names lorem.words --worlds --division-code B01B | sed 10q
	./atastandings --randomize-names lorem.words --division-code W23A --division-code M23A | sed 10q

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
