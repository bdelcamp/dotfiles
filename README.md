#dotfiles
This is just a spot for me to upload all of my config files.

The ones here include my i3 config files, my Xdefaults, compton.conf, and a few more.

make sure you have artwiz-fonts, as well as tewi(for the Xresources and powerline), and siji(bitmap icon font) installed.

# instructions

clone the repository with "git clone https://github.com/hexadecimal-rainbow/dotfiles.git .dotfiles" (without the quotes, of course) and either copy the config files or create symlinks. whichever you prefer.
Make sure you have airblader's i3-gaps installed, as well as i3blocks.

installing the latest version of rofi is also recommended, though if you prefer you can use dmenu. Just edit the i3/config file if that's the case.

for the dwm stuff, copy the config.h and dwm.c into your dwm folder. make sure you install these patchesusing "patch < patchname.diff":

fibonacci, gapless grid, pertag, and uselessgap

Once you apply the patches, use "make && sudo make install"
do the same for dwmstatus, and uncomment dwmstatus in the xinitrc
