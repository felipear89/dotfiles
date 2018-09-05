# My dotfiles
I use stow to create symbolic links and brew to install my favorite apps

## Just do it
1. Checkout: `git clone --recurse-submodules git@github.com:felipear89/dotfiles.git ~/.dotfiles`
2. Give permission to run: `chmod +x ~/.dotfiles/bin/install.sh`
3. Run: `~/.dotfiles/bin/install.sh`

## Jump between words in iTerm2:
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

## Add vim plugins
Ex:
`git submodule add git@github.com:ctrlpvim/ctrlp.vim.git ~/.dotfiles/vim/.vim/bundle/ctrlp.vim`

## Commands
Execute git branches inside all sub folders
`find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git branches" \;`

Generate ctags
`ctags -R .`

