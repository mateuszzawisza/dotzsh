autoload colors; colors

autoload -U select-word-style
WORDCHARS='?_-.[]~=&;!#$%^(){}<>'
select-word-style normal

# should I load compinit? will this slow things down?
#autoload -U compinit
#compinit -i
#compinit -d ~/.mattzsh/dumpfile
