
linkemacsfiles: init.el
	mkdir -p ~/.emacs.d/
	ln -sf ~/.dotfiles/init.el ~/.emacs.d/init.el

linkzathurafiles: zathura/zathurarc
	mkdir -p ~/.config/zathura/
	ln -sf ~/.dotfiles/zathura/zathurarc ~/.config/zathura/zathurarc 


