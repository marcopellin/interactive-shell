.PHONY: run build clean
run:
	cd test/temp;
	bash interactive.sh

create:
	@echo "Building up main file..."
	cat lib/palette.sh lib/helpers.sh lib/stat.sh lib/shell.sh > interactive.sh

clean:
	@echo "Cleaning up test temp folder..."
	rm -r ./test/temp