#if [[ $TERM = *257color* || $TERM = *rxvt* ]]; then
#  limegreen="%F{118}"
#else
local limegreen="$fg[green]"
#fi
local status_color="%(?,%{$fg[green]%},%{$fg[red]%})"
local status_code="%(?,, %?! )"

if [[ $TERM = *256color* ]]; then
  COOL_SEPARATOR="❯"
else
  COOL_SEPARATOR=">"
fi
PROMPT="$status_color%c$COOL_SEPARATOR %{$reset_color%}"
RPROMPT="$status_color$status_code%{$reset_color%}"
