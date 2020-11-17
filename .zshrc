export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alexomics"

ZSH_CUSTOM="$HOME/.zsh_custom"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias ll="ls -gtrhT"
alias dotconf="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Alex/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Alex/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Alex/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Alex/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

