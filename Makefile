
FILES = lib/palette.sh lib/helpers.sh lib/stat.sh lib/shell.sh
MAIN = interactive.sh
TEMP = test/temp/*

.PHONY: run build clean watch
run:
	cd test/temp; bash ../../interactive.sh

create:
	@echo "Building up main file..."
	cat $(FILES) > $(MAIN)

clean:
	@echo "Cleaning up test temp folder..."
	rm -r $(TEMP)

lint:
	@echo "File linting..."
	shellcheck $(MAIN)

watch:
	@echo "Watching file..."
	while inotifywait -e close_write $(FILES); do make create && make lint; done
