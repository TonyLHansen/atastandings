test:
	./atastandings --help # > /dev/null
	./atastandings -v -l
	./atastandings -v -I -l -S nj
	./atastandings -v -S nj


parlin:
	./atastandings --worlds -s parlin
	./atastandings --state nj -s parlin --maximum-place 1
	./atastandings --state nj -s parlin

run-black:
	black -l 120 atastandings

run-pylint:
	pylint atastandings

