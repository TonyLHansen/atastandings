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


parlin:
	./atastandings --worlds -s parlin
	./atastandings --state nj -s parlin --maximum-place 1
	./atastandings --state nj -s parlin --maximum-place 10

run-black:
	black -l 120 atastandings

run-pylint:
	pylint3 atastandings
