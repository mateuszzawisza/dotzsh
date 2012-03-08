local status_color="%(?,%{$fg[green]%},%{$fg[red]%})"
local status_code="%(?,, %?! )"

if [[ $TERM = *256color* ]]; then
  COOL_SEPARATOR="❯"
else
  COOL_SEPARATOR=">"
fi

if [ $DISPLAYHOST ]; then
  local localname="%{$fg[blue]%}@%m %{$reset_color%}"
elif [ -z "$LOCALNAME" ]; then
  local localname=""
else
  local localname="%{$fg[blue]%}@$LOCALNAME %{$reset_color%}"
fi
PROMPT="$localname$status_color% %c$COOL_SEPARATOR %{$reset_color%}"
RPROMPT="$status_color$status_code%{$reset_color%}"
