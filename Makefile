help:
	@echo "Please read the Makefile"

gen:
	@echo 'Updating dapptrace source'
	python gen-dapptrace.py > src/dapptrace.sol
	git diff


