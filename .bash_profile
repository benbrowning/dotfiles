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

##
# Your previous /Users/benbrowning/.bash_profile file was backed up as /Users/benbrowning/.bash_profile.macports-saved_2016-12-21_at_12:34:25
##

# MacPorts Installer addition on 2016-12-21_at_12:34:25: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Add postgres comman line utilities to path
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Add my ssh key to make ssh forwarding work
ssh-add

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Find what server an asset bank is on
# Example usage: ab trial17-8
function ab(){
     dig $1.assetbank-server.com | grep -m1 bright-server.net | rev | cut -f1 | rev | cut -d\. -f1
}

# SSH into an asset bank server
function abgo(){
     SERVER=`ab $1`
     go $SERVER
}

# SSH into any server
function go(){
     ssh ben@$1.bright-server.net
}