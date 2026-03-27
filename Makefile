.PHONY: install brew link

install: brew link

brew:
	brew bundle --file=Brewfile

link:
	bash setup.sh
