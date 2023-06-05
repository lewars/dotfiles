tags = $(subst roles/,,$(wildcard roles/*))
.PHONY: all $(tags)

all:
	ansible-playbook dotfiles.yml --tags all

$(tags):
	ansible-playbook -t $@ dotfiles.yml

save-emacs:
	cp -v ~/.emacs roles/emacs/files/emacs
