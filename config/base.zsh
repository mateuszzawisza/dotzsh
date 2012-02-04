autoload colors; colors

autoload -U select-word-style
WORDCHARS='?_-.[]~=&;!#$%^(){}<>'
select-word-style normal

# should I load compinit? will this slow things down?
autoload -U compinit
compinit -i
compinit -d ~/.zsh/dumpfile

zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
