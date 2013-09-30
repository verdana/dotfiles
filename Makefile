SHELL   = /bin/sh

SYMLINK =                                           		\
    if test -e ~/$(file); then                               	\
        echo "Warning: $(file) already exists";           	\
    else                                            		\
        ln -s -r $(file) ~;                                	\
		echo "Install ~/$(file)";			\
    fi;

REMOVE_SYMLINK =                                            	\
    if test -e ~/$(file); then                                	\
        if test -h ~/$(file); then                            	\
            rm ~/$(file);                                    	\
			echo "Remove ~/$(file)";		\
        else                                                	\
            echo "Warning: $(file) is not a symlink";     	\
        fi;                                                    	\
    fi;

CANDIDATES = .bin .gitconfig .hgrc .tmux.conf 			\
			 .vim .vimrc .vimrc.local 		\
			 .zsh .zshenv .zshrc			\

all:
	@$(foreach file, $(CANDIDATES), $(SYMLINK))
	@echo "Done"

clean:
	rm -rf ~/.cache
	rm -rf ~/.history
	rm -rf ~/.mysql_history
	rm -rf ~/.viminfo
	rm -rf ~/.zcompdump*
	rm -rf ~/.subversion
	@$(foreach file, $(CANDIDATES), $(REMOVE_SYMLINK))
	@echo "Done"


