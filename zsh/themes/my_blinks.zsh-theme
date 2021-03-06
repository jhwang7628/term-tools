# This theme is adapted from blinks by Douglas Creager:
# https://github.com/blinks zsh theme

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Detect whether ssh is enabled, if yes then change directory colors
# Ref: http://unix.stackexchange.com/questions/9605/how-can-i-detect-if-the-shell-is-controlled-from-ssh
# To get more colors, use spectrum_ls to list all color code
if [ "${THIS_IS_A_REMOTE_SESSION}" = 1 ]; then
    eval my_dir_color='$FG[034]'
else
    eval my_dir_color='$FG[166]'
fi
PROMPT='%{%f%k%b%} 
%{%K{${bkg}}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} ${my_dir_color}%~%{$reset_color%} $(git_prompt_info)%E%{%f%k%b%}
%F{blue}→%{%f%k%b%} '

RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
