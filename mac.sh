# install homebrew
# check if homebrew is installed
if [ ! command -v brew > /dev/null 2>&1 ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/bundle
brew bundle install --verbose

# Xcode agreement
xcode-select --install

# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh

# install rvm
if [ ! command -v rvm >/dev/null 2>&1 ]
then
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# install tmate
if [ ! command -v tmate >/dev/null 2>&1 ]
then
 brew update             && \
 brew tap nviennot/tmate && \
 brew install tmate
fi

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

# linked apps
brew linkapps

# Remind to install
echo "**Memory Clean** ...what else"

echo "Check this one https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/El_Capitan_and_Homebrew.md if you have some problem with El Capitan"
