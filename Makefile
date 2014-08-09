SHELL = /bin/sh

SYMLINK =                                              \
    if test -e ~/$(file); then                         \
        echo "Warning: $(file) already exists";        \
    else                                               \
        ln -s `pwd`/$(file) ~;                         \
        echo "Install ~/$(file)";                      \
    fi;

REMOVE_SYMLINK =                                       \
    if test -h ~/$(file); then                         \
        rm ~/$(file);                                  \
        echo "Remove ~/$(file)";                       \
    else                                               \
        echo "Warning: $(file) is not a symlink";      \
    fi;                                                \

CANDIDATES = .bin .gitconfig .mostrc .tmux.conf        \
             .vim .vimrc .vimrc.local                  \
             .zsh .zshrc build

all:
	@$(foreach file, $(CANDIDATES), $(SYMLINK))
	@echo "Done"

clean:
	rm -rf ~/.cache
	rm -rf ~/.history
	rm -rf ~/.lesshst
	rm -rf ~/.viminfo
	rm -rf ~/.zcompdump*
	@$(foreach file, $(CANDIDATES), $(REMOVE_SYMLINK))
	@echo "Done"

