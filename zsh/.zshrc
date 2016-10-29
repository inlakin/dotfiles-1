#==============================================================================#
#                            init / general options                            #
#==============================================================================#

export EDITOR=vim
export BROWSER=firefox
export PAGER=less
export KEYTIMEOUT=1
export TERM=xterm
export GPG_TTY=$(tty)

umask 022

setopt \
    appendhistory       \
    autocd              \
    autolist            \
    autopushd           \
    autoremoveslash     \
    cdablevars          \
    completealiases     \
    correct             \
    extendedhistory     \
    globdots            \
    histignoredups      \
    histignorespace     \
    histverify          \
    incappendhistory    \
    longlistjobs        \
    notify              \
    numericglobsort     \
    promptsubst         \
    pushdignoredups     \
    pushdminus          \
    pushdsilent         \
    pushdtohome         \
    sharehistory

unsetopt \
    autoparamslash  \
    bgnice

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
DIRSTACKSIZE=20

typeset -U path cdpath fpath manpath

autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
autoload -Uz vcs_info

#==============================================================================#
#                                  completion                                  #
#==============================================================================#

zstyle ':completion:*' menu select
zstyle ':completion:*::::' completer  _expand _complete _match _ignored
zstyle ':completion:*' completions 0
zstyle ':completion:*' glob 0
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
   '+m:{a-z}={A-Z} r:|[._-]=** r:|=**' '' '' '+m:{a-z}={A-Z} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' substitute 0
zstyle ':completion:*' rehash true
zstyle ':compinstall' filename "$HOME/.zshrc"

zstyle ':completion:*:expand:*' tag-order all-expansions

zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found' '(*/)#CVS'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns \
    '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(^rm):*' ignored-patterns \
    '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

#==============================================================================#
#                                    prompt                                    #
#==============================================================================#

# git support
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*' formats \
    "$fg_bold[green]%b%m$reset_color/$fg[yellow]%12.12i %c%u$reset_color"
precmd() {
    vcs_info
}

if [ -n "$SSH_CONNECTION" ]; then
    prmptssh="%{$fg[red]%}• "
fi

PROMPT='${prmptssh}%(!.%{$fg[red]%}.%{$fg[blue]%})%n%{$fg[white]%}@%{$fg[blue]%}%M%{$reset_color%} %{$fg_bold[magenta]%}%~%{$reset_color%} ${vcs_info_msg_0_}
%{$fg[yellow]%}%L%{$reset_color%} %{$fg[green]%}%T%{$reset_color%}%(?..%{$fg[red]%} %?%{$reset_color%}) %{$fg[white]%}▶%{$reset_color%} '

#==============================================================================#
#                                  keybindings                                 #
#==============================================================================#

# vi mode
zle -N zle-line-init
zle -N zle-keymap-select
function zle-line-init zle-keymap-select {
VIM_PROMPT="%{$fg[white]%} [% NORMAL]% %{$reset_color%}"
RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
zle reset-prompt
}

bindkey -v
autoload zkbd
if [ -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]; then
    source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
fi
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
bindkey '^R' history-incremental-search-backward

#==============================================================================#
#                                    aliases                                   #
#==============================================================================#

alias al='ls -lAh'
alias cd=' cd'
alias cdusb='cd /mnt/usb'
alias cmx='chmod -x'
alias cp='cp -iv'
alias cx='chmod +x'
alias fancydate='watch -n1 "date '+%D%n%T'|figlet -k"'
alias g='git'
alias gi='git'
alias gren='grep -rn'
alias grep='grep --color=auto'
alias grepi='grep -i'
alias grin='grep -rin'
alias iftop='iftop -N -p -P'
alias la='ls -lAh'
alias ll='ls -lh'
alias ln='ln -v'
alias ls='ls --color=auto'
alias lsd='ls -ld *(-/DN)'
alias mkdir='mkdir -p -v'
alias mpdpc='mpd ~/.config/mpd/mpd.conf'
alias mv='mv -iv'
alias oports='sudo netstat -tulanp'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias psm='ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -10'
alias psns='ps xawf -eo pid,user,pidns,userns,utsns,netns,mntns,args'
alias rm='rm -Iv --one-file-system'
alias rmdir='rmdir -v'
alias savepkglist='pacman -Qqe | grep -vx "$(pacman -Qqm)" > ~.pkg.list'
alias sz="source ~/.zshrc"
alias v='vim -p'
alias vi='vim -p'
alias vim='vim -p'
alias weather="curl -s http://wttr.in | head -n -2"
alias ympv="mpv --ytdl-format=best --ytdl "

#==============================================================================#
#                                   dirstack                                   #
#==============================================================================#

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
fi
chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

#==============================================================================#
#                                   functions                                  #
#==============================================================================#

ext () {
    if [ -f $1 ] ; then
        case $1 in
            *.7z)                   7z x $1 ;;
            *.Z)                    uncompress $1 ;;
            *.rar)                  unrar x $1 ;;
            *.tar.bz2 | *.tbz2)     pv $1 | tar xj || tar xvjf $1 ;;
            *.tar.gz | *.tgz)       pv $1 | tar xz || tar xzvf $1 ;;
            *.tar.xz | *.txz)       pv $1 | tar xJ || tar xJvf $1 ;;
            *.bz2)                  bunzip2 $1 ;;
            *.deb)                  ar vx $1 ;;
            *.gz)                   gunzip $1 ;;
            *.xz)                   unxz $1 ;;
            *.tar)                  pv $1 | tar x  || tar xvf $1 ;;
            *.zip)                  unzip $1 ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

mkcd() {
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

cp_p() {
    if [ `echo "$2" | grep ".*\/$"` ]; then
        pv "$1" > "$2""$1";
    else pv "$1" > "$2"/"$1";
    fi  ;
}

mdread() {
    pandoc "$1" -f markdown -t html | w3m -T text/html
}

function = {
  echo "$@" | bc -l
}

lock() {
    BG="/tmp/lockbg.png"
    scrot "$BG"
    convert "$BG" -blur "0x5" "$BG"
    i3lock -f -e -i "$BG"
    rm "$BG"
}

quiet() {
    nohup $@ &>/dev/null &
}

# quick bin/hex/dec converter
dtb() { echo "obase=2; ${1}" | bc };
dth() { echo "obase=16; ${1}" | bc };
btd() { echo "ibase=2; ${1}" | bc };
htd() { echo "ibase=16; $(tr '[a-z]' '[A-Z]' <<< ${1})" | bc };
bth() { echo "obase=16;ibase=2; ${1}" | bc };
htb() { echo "ibase=16;obase=2; $(tr '[a-z]' '[A-Z]' <<< ${1})" | bc };

#==============================================================================#
#                                    colors                                    #
#==============================================================================#

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[default]='fg=white'
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=white'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=white'
fi

export LESS=-FIRX
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

if [ ! -f ~/.dircolors ]; then
    dircolors -p > ~/.dircolors
fi
eval $(dircolors ~/.dircolors)

#==============================================================================#
#                                 other options                                #
#==============================================================================#

if [ -f /usr/share/doc/pkgfile/command-not-found.zsh ]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# host specific configuration
if [ -f ~/.zshrc_spec ]; then
    source ~/.zshrc_spec
fi
