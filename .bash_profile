# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{extra,bash_prompt,aliases}; do
	[ -r "$file" ] && source "$file"
done
unset file


# init z   https://github.com/rupa/z
. ~/code/z/z.sh

# git tab completion http://apple.stackexchange.com/questions/55875/have-git-autocomplete-branches-at-the-command-line/55886#55886
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


##
# Your previous /Users/benbrowning/.bash_profile file was backed up as /Users/benbrowning/.bash_profile.macports-saved_2013-12-20_at_11:59:12
##

export NVM_DIR="/Users/benbrowning/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# Add gradle to path
export PATH="/Applications/Developer/gradle-2.7/bin:$PATH"

eval "$(rbenv init -)"
eval "$(jenv init -)"