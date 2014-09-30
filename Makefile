SHELL = /bin/sh

SYMLINK =                                              \
    if test -e ~/$(file); then                         \
        echo "Warning: $(file) already exists";        \
    else                                               \
        /bin/ln -s `pwd`/$(file) ~;                    \
        echo "Install ~/$(file)";                      \
    fi;

REMOVE_SYMLINK =                                       \
    if test -h ~/$(file); then                         \
        rm ~/$(file);                                  \
        echo "Remove ~/$(file)";                       \
    else                                               \
        echo "Warning: $(file) is not a symlink";      \
    fi;                                                \

CANDIDATES = .bin .eixrc .gitconfig .vim .vimrc        \
             .vimrc.local .zsh .zshrc

all:
	@$(foreach file, $(CANDIDATES), $(SYMLINK))
	@echo "Done"

clean:
	rm -rf ~/.cache
	rm -rf ~/.composer
	rm -rf ~/.config
	rm -rf ~/.history
	rm -rf ~/.lesshst
	rm -rf ~/.pip
	rm -rf ~/.sqlite_history
	rm -rf ~/.viminfo
	rm -rf ~/.zcompdump

	@$(foreach file, $(CANDIDATES), $(REMOVE_SYMLINK))
	@echo "Done"

