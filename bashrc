# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

EMAIL_ADDR="pete.winterscheidt@readytalk.com"
EBELL_TIMEOUT=1000*60*3         # 3 minutes in milliseconds

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
export HISTTIMEFORMAT=""
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ignore exit commands
HISTIGNORE="fg:bg:git pull:git log:git diff:ls:ls -l:ls -ls:&:[ ]*:exit"

# enable cmdhist
shopt -s cmdhist

# Set the default editor to vim.
export EDITOR=vim
 
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

## Make things as colorful as possible
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
## setup ls colors
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 2>/dev/null) \$' 
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h: \w\a\]$PS1"

if [[ "$(uname)" == "Linux" ]]; then
    export JAVA_HOME=/usr/lib/jvm/java-6-sun/
    # add the __git_ps1 command to PS1 
    man $(ls /usr/bin | shuf -n 1)| sed -n "/^NAME/ { n;p;q }"
else
    # brew bash completion:
    if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
    fi
    if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
        . `brew --prefix`/etc/bash_completion.d/git-completion.bash
    fi

    # Initialize FINK if needed

    if [[ ! -x $(which fink) && -d /sw/bin ]];then
      source /sw/bin/init.sh
    fi


    # Set the DISPLAY variable ONLY for OS X earlier than 10.5
    # Do not set it for 10.5, or it will create problems.


    if [[ -z $DISPLAY && $(sw_vers -productVersion) < 10.5  && -z $SSH_CONNECTION ]]; then
      # -- works for Apple X11 with Fast User Switching
      disp_no=($( ps -awx | grep -F X11.app | awk '{print $NF}' | grep -e ":[0-9]"  ))
      if [[ -n $disp_no ]];then
        export DISPLAY=${disp_no}.0
      else
        export DISPLAY=:0.0
      fi
      echo "DISPLAY has been set to $DISPLAY"
    fi
fi

## bell and email functions
function ebell { 
  echo -ne "\a";
  OLD=`sed -e '1{$d;}' -e '$!{h;d;}' -e x -e 's/#//' ~/.bash_history`;
  NEW=`date +%s`;
  # This tests if $OLD is a number, our methods are not perfect..
  if [ $OLD -eq $OLD 2> /dev/null ]; then
    if [[ $((NEW-OLD)) -gt $EBELL_TIMEOUT ]]; then
      history | tail -n 10 | mail -s "Command finished with status: $? in $((NEW-OLD)) milliseconds" $EMAIL_ADDR;
    fi
  fi
}

## This is intended to check the state of the vc server
function vc_stat { psql -U tomcat readytalk -c "SELECT * from external_services;"; ps aux | grep red5; }
      
### tail logs
function ttvc { tail -F -n 100 /usr/local/red5/log/red5*; }

function tt {
    (
        cd /usr/local/tomcat/logs
        if [[ $# -eq 0 ]]; then
          tail -F -n0 cc.out cc_core.out palomar_latest.out catalina.out
        else
          tail -F -n0 $@
        fi
    )
}

function _complete_tt {
    local log_dir=/usr/local/tomcat/logs/
    local logs=$(cd $log_dir; ls)
    COMPREPLY=($(compgen -W "$logs" -- [))
}
complete -F _complete_tt tt]

## add deploy to path
export PATH=$PATH:/home/pwinters/workspace/deploy
