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

