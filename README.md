# My dotfiles
I use stow to create symbolic links and brew to install my favorite apps

# Just do it
1. Install HomeBrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

2. Checkout: `git clone git@github.com:felipear89/dotfiles.git ~/.dotfiles`
3. Give permission to run: `chmod +x ~/.dotfiles/bin/install.sh`

# Jump between words in iTerm2:
1. Go to iTerm2 Preferences (⌘,)
2. Open the “Keys” tab
3. Add the following Global Shortcut Keys
4. Jump to beginning of word `Keyboard Combination: ⌥←
Action: Send Escape Sequence
Escape: b`
5. Jump to end of word `Keyboard Combination: ⌥→
Action: Send Escape Sequence
Escape: f`
6. Open the “Profiles” tab
7. Click the sub-tab ”Keys”
8. Remove the mappings for key combinations ⌥← and ⌥→