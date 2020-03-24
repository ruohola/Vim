if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS specific settings

    # solarized colors for coloring the prompt
    tput sgr0;                BASE03=$(tput setaf 234);  BASE02=$(tput setaf 235)
    BASE01=$(tput setaf 240); BASE00=$(tput setaf 241);  BASE0=$(tput setaf 244);  BASE1=$(tput setaf 245)
    BASE2=$(tput setaf 254);  BASE3=$(tput setaf 230);   YELLOW=$(tput setaf 136); ORANGE=$(tput setaf 166)
    RED=$(tput setaf 160);    MAGENTA=$(tput setaf 125); VIOLET=$(tput setaf 61);  BLUE=$(tput setaf 33)
    CYAN=$(tput setaf 37);    GREEN=$(tput setaf 64);    BOLD=$(tput bold);        RESET=$(tput sgr0)

    # autocompletion settings
    source $(brew --prefix)/etc/bash_completion 2> /dev/null

    # fzf config
    fzf_exclude='.git,Library,Applications,Qt,.DS_Store,.Trash,.temp,__pycache__,venv,.pyenv,node_modules'

    [ -f ~/.fzf.bash ] && source ~/.fzf.bash

    # remap cd to dir from ALT-C to CTRL-F
    bind '"\C-f": "c"'

    # open file from fzf in vim
    bind '"\C-v": "vim \C-t\C-m"'

    # -g is the opposite of --exclude, that's why the ! on the first one
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore -g "!{$fzf_exclude}" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd -t d --hidden --no-ignore --exclude "{$fzf_exclude}" .'

    export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"

    source /Users/eero/Library/Preferences/org.dystroy.broot/launcher/bash/br
fi

# function to show git branch on the prompt
parse_git_branch () {
    git branch --show-current 2> /dev/null | sed -e 's/\(.*\)/(\1) /'
}

# solarized colored prompt that looks like: path/to/dir (branch_if_on_git_repo) $
export PS1="\[$CYAN\]\w \[$MAGENTA\]\$(parse_git_branch)\[$CYAN\]\$ \[$RESET\]"
PROMPT_DIRTRIM=3  # show only last 3 dirs in prompt

export EDITOR=vim

export CLICOLOR=1  # enable syntax highlighting

# needed for something to not break, don't remove
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# bash history gets written immediately
shopt -s histappend
PROMPT_COMMAND='history -a;history -n'

# unlimited bash history
export HISTSIZE=
export HISTFILESIZE=

# ** expands to any number of directories
shopt -s globstar

bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

alias vbrc='vim ~/.bash_profile && source ~/.bash_profile'
alias sbrc='source ~/.bash_profile'
alias virc='vim ~/.vim/.ideavimrc'
alias vvrc='vim ~/.vim/vimrc'
alias vset='vim ~/dotfiles/setup.sh'

alias lsa='ls -a'
alias lsla='ls -la'
alias ls1='ls -1'
alias lsa1='ls -a1'

alias F='open .'
alias preview='open -a Preview'

alias act='source venv/bin/activate'
alias lg='lazygit'

alias clamshell='sudo pmset -a disablesleep 1'
alias noclamshell='sudo pmset -a disablesleep 0'

alias gs='git status'
alias gf='git fetch --all --tags'
alias ga='git add'
alias gaa='git add .'
alias gcl='git clone'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gcae='git commit --allow-empty'
alias gcaem='git commit --allow-empty -m'
alias gpl='git pull --rebase'
alias gps='git push'
alias gpsf='git push -f'
alias gpsu='git push -u origin `git branch --show-current`'
alias gds='git diff --staged'
alias gdh='git diff HEAD'
alias gl='git log --graph --date-order'
alias glf='git log --graph --date-order --name-status'
alias gls='git log --graph --date-order --numstat'
alias gb='git branch'
alias gba='git branch -a'
gbd () { git branch --delete "$1" && git push --delete origin "$1"; }
gch () {
    if [[ "$@" == "dev" ]]; then
        git checkout develop
    else
        git checkout "$@"
    fi
}
gchb () { git checkout -b "$1" || git checkout "$1"; }

alias dcu='docker-compose up'
alias dcb='docker-compose build'
alias dcub='docker-compose up --build'


alias allskole='
docker-compose run --rm backend sh -c "
    mypy .
    pytest --cov-report html --cov=. tests
"
'
alias mypyskole='docker-compose run --no-deps --rm backend sh -c "mypy ."'
alias testskole='docker-compose run --rm backend pytest --cov-report html --cov=. tests'
alias runskole='docker-compose run --rm backend'
alias manageskole='docker-compose run --rm backend python manage.py'


export PATH="$HOME/.cargo/bin:${PATH}"
export PATH="$HOME/dotfiles/bash/exported:${PATH}"
