
link-emacs: init.el
	mkdir -p ~/.emacs.d/
	ln -sf ~/.dotfiles/init.el ~/.emacs.d/init.el

link-zathura: zathura/zathurarc
	mkdir -p ~/.config/zathura/
	ln -sf ~/.dotfiles/zathura/zathurarc ~/.config/zathura/zathurarc 

link-waybar: waybar/config.jsonc 
	ln -sf ~/.dotfiles/waybar ~/.config/waybar 

link-hyprland: hypr/hyprland.conf 
	ln -sf ~/.dotfiles/hypr ~/.config/hypr 

link-ranger: ranger/rc.conf
	ln -sf ~/.dotfiles/ranger ~/.config/ranger

link-dircolors: dircolors/.dircolors
	ln -sf ~/.dotfiles/dircolors/.dircolors ~/.dircolors

link-zsh: zsh/.zshrc
	ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
