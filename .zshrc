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

# syntax highlighting and auto-completion
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# Vi mode
bindkey -v

# auto suggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="standout"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dh014/source/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dh014/source/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dh014/source/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dh014/source/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# freesurfer
export FREESURFER_HOME=/Applications/freesurfer/7.4.1
source $FREESURFER_HOME/SetUpFreesurfer.sh &>/dev/null

# aliases
alias make_project='source /Users/dh014/source/PythonTemplate/make_project.sh' # make new project
alias timtam='ssh -X dh014@timtam.nmr.mgh.harvard.edu' # login to timtam with X11 forwarding
alias p41trd3='ssh -X dh014@p41trd3.nmr.mgh.harvard.edu' # login to p41trd3 with X11 forwarding 

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
