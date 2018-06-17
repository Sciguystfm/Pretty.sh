#!/bin/bash
#test

echo "PrettyScript"
sudo apt-get install -y unity-tweak-tool
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'

echo "Adding Repos"
sudo add-apt-repository -y ppa:noobslab/themes >/dev/null
sudo add-apt-repository -y ppa:daniruiz/flat-remix >/dev/null
echo "Running apt update"
sudo apt-get update

echo "Installing everything"
sudo apt-get install flatabulous-theme flat-remix curl git zsh fonts-powerline dconf-cli  -y




echo "OMZ install"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"

echo "OMZ Configuring"

sed -i 's/robbyrussell/agnoster/g' ~/.zshrc

sed -i 's/    prompt_segment blue black "(`basename $virtualenv_path`)"/    prompt_segment red magenta "(`basename $virtualenv_path`)"/g' ~/.oh-my-zsh/themes/agnoster.zsh-theme

echo "export VIRTUAL_ENV_DISABLE_PROMPT=1" >> ~/.zshrc


echo "--------------------------------------------------------------------------------------------------"
echo "So here's the dealio. We're installing a color scheme for the terminal now. I need ya to open terminal preferences and create a profile called \"default\". Feel free to set it as a your default too."


read -p "Press enter when you're done."
echo "--------------------------------------------------------------------------------------------------"

wget -qO- https://raw.githubusercontent.com/DarthWound/smyck-gnome-terminal/master/smyck-terminal.sh | sh


chsh -s $(which zsh)


echo "--------------------------------------------------------------------------------------------------"
echo "Last thing to do is open unity tweak tool and change the theme to 'Flatabulous' and the icons to 'Flat-Remix-Dark'"

read -p "Press enter when you've finished that and i'll reboot"
reboot
echo "--------------------------------------------------------------------------------------------------"
