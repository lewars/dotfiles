tags = $(subst roles/,,$(wildcard roles/*))
.PHONY: all $(tags)

all:
	ansible-playbook dotfiles.yml --tags all

$(tags):
	ansible-playbook -vvv -t $@ dotfiles.yml

diff-emacs:
	diff roles/emacs/files/emacs ~/.emacs

save-emacs:
	cp -v ~/.emacs roles/emacs/files/emacs

diff-git:
	diff roles/git/files/git ~/.git

save-git:
	cp -v ~/.git roles/git/files/git

diff-bash:
	diff roles/bash/files/bashrc ~/.bashrc
	diff roles/bash/templates/bash_profile.j2 ~/.bash_profile

save-bash:
	@echo "WARNING: Can't import bash configs!!"
	@echo "WARNING: .bashrc should be a symoblic link"
	@echo "WARNING: Hand edit roles/bash/template/bash_profiles.j2"
