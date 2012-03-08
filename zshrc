# setup PATH variables
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

#export DISPLAYHOST=true
#export LOCALNAME="home"
for config_file in $HOME/.zsh/config/*.zsh
do
  source $config_file
done;

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER != sudo\ * ]]; then
        BUFFER="sudo $BUFFER"
        CURSOR=$(( CURSOR+5 ))
    fi
}
zle -N sudo-command-line

bindkey "^os" sudo-command-line
