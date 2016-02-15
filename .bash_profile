if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

export CLICOLOR=1

# Setting PATH for Python 2.7
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Grep highlight matches
export GREP_OPTIONS='--color=auto'

# Set bash tab completion to be case insensitive
bind "set completion-ignore-case on"

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;


# Custom Bash Prompt
PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \w ⨠ "

# some ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# ssh vm
alias ubu='ssh phoochka@45.55.209.90 -p 2242'

# added by Anaconda3 2.4.0 installer
export PATH="/Users/gaurav/anaconda/bin:$PATH"
