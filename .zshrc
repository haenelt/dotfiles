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
ENABLE_CORRECTION="false"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	nvm
	vi-mode
        zsh-autosuggestions
        zsh-completions 
        zsh-history-substring-search 
        zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# syntax highlighting and auto-completion
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# miniconda
source $HOME/source/miniconda3/bin/activate

# User configuration

# Vi mode
bindkey -v

# auto suggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="standout"

# aliases
alias make_project="source $HOME/source/PythonTemplate/make_project.sh" # make new project
alias segmentator='conda activate segmentator; segmentator' # call segmentator installed in a conda environment 

# login to clusters with and without X11 forwarding
alias mlsc='ssh dh014@mlsc.nmr.mgh.harvard.edu' 
alias timtam='ssh dh014@timtam.nmr.mgh.harvard.edu' 
alias p41trd3='ssh dh014@p41trd3.nmr.mgh.harvard.edu' 
alias tonkotsu='ssh dh014@tonkotsu.nmr.mgh.harvard.edu'
alias fugue='ssh dh014@fugue.nmr.mgh.harvard.edu'
alias raijin='ssh dh014@raijin.nmr.mgh.harvard.edu'
alias marduk='ssh dh014@marduk.nmr.mgh.harvard.edu'
alias baldur='ssh dh014@baldur.nmr.mgh.harvard.edu'
alias ardebil='ssh dh014@ardebil.nmr.mgh.harvard.edu'
alias sherlock='ssh dhaenelt@login.sherlock.stanford.edu'

# activate python environment
alias activate='source $(poetry env info --path)/bin/activate'

# open vim as ide
alias code='~/.start/start_vim_tmux.sh'

# copy data from timtam to local
# first argument: source file on remote machine 
# second argument: destiny on local machine 
scp_from_timtam() {
    scp dh014@timtam.nmr.mgh.harvard.edu:$1 $2        
} 

scpr_from_timtam() {
    scp -r dh014@timtam.nmr.mgh.harvard.edu:$1 $2   
}

scp_to_timtam() {
    scp $1 dh014@timtam.nmr.mgh.harvard.edu:$2
}

scpr_to_timtam() {
    scp -r $1 dh014@timtam.nmr.mgh.harvard.edu:$2
}


# load VIM with enabled python virtual environment
[ "$VIMRUNTIME" ] && [ "$VIRTUAL_ENV" ] && source "$VIRTUAL_ENV/bin/activate"
vimVenAutoload() {
    if [ -e .venv/bin/activate ]; then
        . .venv/bin/activate;
        vim $*;
        conda deactivate;
    else
        vim $*;
    fi;
}
alias vim="vimVenAutoload"

# shows user@host in front of the prompt
PROMPT="%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%} ${PROMPT}"
