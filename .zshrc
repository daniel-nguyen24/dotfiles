## Personal folders
DOTFILES=$HOME/dotfiles
PROJECTS=$HOME/Dev

## Homebrew completion
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

## Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#if command -v pyenv 1>/dev/null 2>&1; then
#    eval "$(pyenv init --path)"
#    eval "$(pyenv init -)"
#fi

## Pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"
#if which pyenv-virtualenv-init >/dev/null; then
#    eval "$(pyenv virtualenv-init -)"
#fi

## NVM stuffs
NVM_AUTOLOAD=1
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

## Starship init
eval "$(starship init zsh)"

## iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## Personal aliases
alias dotfiles="cd $DOTFILES"
alias reloadsh="eval $SHELL && clear"
alias rmrf="rm -rf"
alias cl="clear"
alias la="ls -la"
alias ll="ls -l"
