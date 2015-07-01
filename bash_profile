alias sshumn='ssh dingx292@lind40-26.cselabs.umn.edu'
alias sshumn32='ssh dingx292@x22-04.cselabs.umn.edu'
alias sshumncs='ssh dingx292@pulsar.cs.umn.edu'
alias sshsolaris='ssh dingx292@caesar.cs.umn.edu'
alias sshserverram64='ssh dingx292@phi07.cselabs.umn.edu'
alias sshserverram192='ssh dingx292@maximus.cs.umn.edu'
alias pythonserver8000='python -m SimpleHTTPServer 8000'
alias ls='ls -G'
alias la='ls -A'
alias ll='ls -l'
alias dfc='df -hPT | column -t'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias 700='chmod 700'
alias reporoot='cd $(git rev-parse --show-toplevel)'

HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


# opening messages
cal | sed "s/.*/ & /;s/ $(date +%e) / [] /"

# functions

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

up () {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

netinfo () {
  echo "--------------- Network Information ---------------"
  /sbin/ifconfig | awk /'inet addr/ {print $2}'
  /sbin/ifconfig | awk /'Bcast/ {print $3}'
  /sbin/ifconfig | awk /'inet addr/ {print $4}'
  /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
  myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
  echo "${myip}"
  echo "---------------------------------------------------"
}






export PS1='\w $ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
