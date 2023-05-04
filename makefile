test:
	./atastandings --help # > /dev/null
	./atastandings -v -l
	./atastandings -v -I -l -S nj
	./atastandings -v -S nj


run-black:
	black -l 120 atastandings

run-pylint:
	pylint atastandings

