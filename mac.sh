# install iTerm
if [ `ls /Applications/ | grep iTerm.app` ]
then
  curl https://iterm2.com/downloads/stable/iTerm2-2_1_4.zip | tar -x > iTerm.app
fi

# install homebrew
# check if homebrew is installed
if [ ! command -v brew > /dev/null 2>&1 ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh

# install homebrew packages
while read -r line
do
 brew install $line
done <<< `curl "https://raw.githubusercontent.com/duykhoa/dotfiles/master/brew.list"`

# install nvm
if [ ! command -v nvm >/dev/null 2>&1 ]
then
  curl -o- "https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh" | bash
  echo "Finish install nvm, not sure nvm is load correctly, load zsh again"
  source ~/.zshrc
  nvm install iojs
  curl -L "https://www.npmjs.com/install.sh" | sh
fi

# install rvm
if [ ! command -v rvm >/dev/null 2>&1 ]
then
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# install image-magick
open | curl "http://www.imagemagick.org/download/linux/CentOS/i386/ImageMagick-6.9.2-8.i386.rpm"

# install tmate
if [ ! command -v tmate >/dev/null 2>&1 ]
then
 brew update             && \
 brew tap nviennot/tmate && \
 brew install tmate
fi

# install caffeine
curl "http://gsf-cf.softonic.com/d2f/bda/d1619934313026fc831e6c6e3dd97ac030/file?SD_used=0&channel=WEB&fdh=no&id_file=61611&instance=softonic_en&type=PROGRAM&Expires=1450012321&Signature=NgMs0e6~WNfs1IeV2CxiB6c6RQbJBXOLMnHynd7BalzI9qGx8t22KC9quxhiqw--fiBwekdv1dAvlSVm90PMjVwD8cXhtbh9tsdpaYvo2m~cArBCvbnIbXBVcYZmiYTlM0EPrexUl3LwoyRiZ7XpaLM-fm71TuyJ4r4FngWnMO8_&Key-Pair-Id=APKAJUA62FNWTI37JTGQ&filename=Caffeine1.1.1.zip" | tar -x > Caffeine.app

# install spectacles
curl https://s3.amazonaws.com/spectacle/downloads/Spectacle+1.0.1.zip | tar -x > Spectacle.app

# install afred2
curl https://cachefly.alfredapp.com/Alfred_2.8.1_425.zip | tar -x > Alfred.app

# Generate ssh-key
#ssh-keygen

# wait to ask key to github
read -p "Press any key after adding your keygen to github"

# install dot-files
git clone http://github.com/duykhoa/dotfiles

# restore mackup
open /Applications/Dropbox.app/
read -p "Make sure Dropbox has sync all settings. Press any key to continue......"
mackup restore

# install new vim (7.4)
brew install vim --override-system-vi

# linked apps
brew linkapps

# Remind to install
echo "These are some apps you may need"
echo "VLC, Memory Clean ...what else"

echo "Check this one https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/El_Capitan_and_Homebrew.md if you have some problem with El Capitan"
