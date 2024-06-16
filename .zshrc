# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	nvm
	vi-mode
)

source $ZSH/oh-my-zsh.sh

# miniconda
source /Users/dh014/source/miniconda3/bin/activate

# syntax highlighting and auto-completion
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# Vi mode
bindkey -v

# auto suggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="standout"

# aliases
alias make_project='source /Users/dh014/source/PythonTemplate/make_project.sh' # make new project
alias segmentator='conda activate segmentator; segmentator' # call segmentator installed in a conda environment 

alias timtam='ssh dh014@timtam.nmr.mgh.harvard.edu' # login to timtam with X11 forwarding
alias p41trd3='ssh dh014@p41trd3.nmr.mgh.harvard.edu' # login to p41trd3 with X11 forwarding 
alias timtamX='ssh -X dh014@timtam.nmr.mgh.harvard.edu' # login to timtam with X11 forwarding
alias p41trd3X='ssh -X dh014@p41trd3.nmr.mgh.harvard.edu' # login to p41trd3 with X11 forwarding 

# copy data from timtam to local
# first argument: source file on remote machine 
# second argument: destiny on local machine 
scp_timtam() {
    scp dh014@timtam.nmr.mgh.harvard.edu:$1 $2        
} 

# load VIM with enabled python virtual environment
[ "$VIMRUNTIME" ] && [ "$VIRTUAL_ENV" ] && source "$VIRTUAL_ENV/bin/activate"
vimVenAutoload() {
    if [ -e .venv/bin/activate ]; then
        . .venv/bin/activate;
        vim $*;
        deactivate;
    else
        vim $*;
    fi;
}
alias vim="vimVenAutoload"

# shows user@host in front of the prompt
PROMPT="%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%} ${PROMPT}"
