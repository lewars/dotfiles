tags = $(subst roles/,,$(wildcard roles/*))
.PHONY: all $(tags)

setup:
	[ -L ~/.dotfiles ] || ln -s $(PWD) ~/.dotfiles

all: setup
	ansible-playbook dotfiles.yml --tags all

$(tags): setup
	ansible-playbook -vvv -t $@ dotfiles.yml

diff-emacs:
	diff --color=always roles/emacs/files/emacs ~/.emacs

save-emacs:
	cp -v ~/.emacs roles/emacs/files/emacs

diff-git:
	diff --color=always roles/git/templates/gitconfig.j2 ~/.gitconfig

save-git:
	@echo "WARNING: Can't import gitignore_global config!!"
	@echo "WARNING: It is a symoblic link"
	@echo "WARNING: Hand edit roles/bash/template/gitconfig.j2"

diff-bash:
	diff --color=always roles/bash/files/bashrc ~/.bashrc
	diff --color=always roles/bash/templates/bash_profile.j2 ~/.bash_profile

save-bash:
	@echo "WARNING: Can't import bash configs!!"
	@echo "WARNING: .bashrc should be a symoblic link"
	@echo "WARNING: Hand edit roles/bash/template/bash_profiles.j2"
