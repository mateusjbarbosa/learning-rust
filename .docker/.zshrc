# ZSH Variables
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="spaceship"

# ZSH Plugins
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# ZSH Config
ENABLE_CORRECTION="true"