if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

export CLICOLOR=1

# Setting PATH for Python 2.7
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

###### JAVA STUFF ###### 
# Setting JAVA HOME
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
# Setting Maven
export M2_HOME=/usr/local/apache-maven/apache-maven-3.3.9
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
####################

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
alias ssh='TERM=xterm-256color ssh'
alias ubu='ssh phoochka@45.55.209.90 -p 2242'

# twitch csgo
alias esl='livestreamer twitch.tv/ESL_CSGO high'

# added by Anaconda3 2.4.0 installer
export PATH="/Users/gaurav/anaconda/bin:$PATH"
