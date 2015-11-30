alias sshumn='ssh dingx292@csel-kh1250-12.cselabs.umn.edu'
alias sshumn32='ssh dingx292@x22-04.cselabs.umn.edu'
alias sshumncs='ssh dingx292@exa.cs.umn.edu'
alias sshsolaris='ssh dingx292@caesar.cs.umn.edu'
alias sshserverram64='ssh dingx292@phi07.cselabs.umn.edu'
alias sshserverram192='ssh dingx292@maximus.cs.umn.edu'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
alias ls='ls -G'
alias la='ls -A'
alias ll='ls -l'
alias doc='cd ~/Documents'
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


alias h='history | tail'

alias week='date +%V'

alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g;'

alias 700='chmod 700'
alias reporoot='cd $(git rev-parse --show-toplevel)'
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias undopush="git push -f origin HEAD^:master"
alias v="vim"

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
shopt -s cdspell


cal | sed "s/.*/ & /;s/ $(date +%e) / [] /"
echo -e "\\[._.]/\n"


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

ip () {
  echo "--------------- Network Information ---------------"
  /sbin/ifconfig | awk /'inet addr/ {print $2}'
  /sbin/ifconfig | awk /'Bcast/ {print $3}'
  /sbin/ifconfig | awk /'inet addr/ {print $4}'
  /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
  myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
  echo "${myip}"
  echo "---------------------------------------------------"
}

md() {
	mkdir -p "$@" && cd "$_";
}

fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* *;
	fi;
}

dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# Create a git.io short URL
function gitio() {
	if [ -z "${1}" -o -z "${2}" ]; then
		echo "Usage: \`gitio slug url\`";
		return 1;
	fi;
	curl -i http://git.io/ -F "url=${2}" -F "code=${1}";
}

cdf() {
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

atomf() {
  atom "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

server() {
	local port="${1:-3000}"
	open "http://localhost:${port}/"
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

gz() {
	echo "orig size    (bytes): "
	cat "$1" | wc -c
	echo "gzipped size (bytes): "
	gzip -c "$1" | wc -c
}

export PATH="/usr/local/heroku/bin:$PATH"

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

set_prompts() {

    local black="" blue="" bold="" cyan="" green="" orange="" \
          purple="" red="" reset="" white="" yellow=""

    local dateCmd=""

    if [ -x /usr/bin/tput ] && tput setaf 1 &> /dev/null; then

        tput sgr0 # Reset colors

        bold=$(tput bold)
        reset=$(tput sgr0)

        # Solarized colors
        # (https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values)
        black=$(tput setaf 0)
        blue=$(tput setaf 33)
        cyan=$(tput setaf 37)
        green=$(tput setaf 190)
        orange=$(tput setaf 172)
        purple=$(tput setaf 141)
        red=$(tput setaf 124)
        violet=$(tput setaf 61)
        magenta=$(tput setaf 9)
        white=$(tput setaf 8)
        yellow=$(tput setaf 136)

    else

        bold=""
        reset="\e[0m"

        black="\e[1;30m"
        blue="\e[1;34m"
        cyan="\e[1;36m"
        green="\e[1;32m"
        orange="\e[1;33m"
        purple="\e[1;35m"
        red="\e[1;31m"
        magenta="\e[1;31m"
        violet="\e[1;35m"
        white="\e[1;37m"
        yellow="\e[1;33m"

    fi

    # Only show username/host if not default
    function usernamehost() {

        # Highlight the user name when logged in as root.
        if [[ "${USER}" == *"root" ]]; then
            userStyle="${red}";
        else
            userStyle="${magenta}";
        fi;

        userhost=""
        userhost+="\[${userStyle}\]$USER "
        userhost+="${white}at "
        userhost+="${orange}$HOSTNAME "
        userhost+="${white}in"

        if [ $USER != "$default_username" ]; then echo $userhost ""; fi
    }


    function prompt_git() {
        # this is >5x faster than mathias's. has to be for working in Chromium & Blink.

        # check if we're in a git repo. (fast)
        git rev-parse --is-inside-work-tree &>/dev/null || return

        # check for what branch we're on. (fast)
        #   if… HEAD isn’t a symbolic ref (typical branch),
        #   then… get a tracking remote branch or tag
        #   otherwise… get the short SHA for the latest commit
        #   lastly just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git describe --all --exact-match HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";


        ## early exit for Chromium & Blink repo, as the dirty check takes ~5s
        repoUrl=$(git config --get remote.origin.url)
        if grep -q chromium.googlesource.com <<<$repoUrl; then
            dirty=" ⁂"
        else

            # check if it's dirty (slow)
            #   technique via github.com/git/git/blob/355d4e173/contrib/completion/git-prompt.sh#L472-L475
            dirty=$(git diff --no-ext-diff --quiet --ignore-submodules --exit-code || echo -e "*")

            # mathias has a few more checks some may like:
            #    github.com/mathiasbynens/dotfiles/blob/a8bd0d4300/.bash_prompt#L30-L43
        fi


        [ -n "${s}" ] && s=" [${s}]";
        echo -e "${1}${branchName}${2}$dirty";

        return
    }



    # ------------------------------------------------------------------
    # | Prompt string                                                  |
    # ------------------------------------------------------------------

		#export PS1="\[\033[0;31m\]\w\[\033[m\] \$ "

    PS1="\[\033]0;\w\007\]"                                 # terminal title (set to the current working directory)
    PS1+="\[$red\]\w"                                     # working directory
    PS1+="\$(prompt_git \"$white $purple\" \"$cyan\")"   # git repository details
    PS1+="\n"
    PS1+="\[$reset$white\]\\$ \[$reset\]"

    export PS1

    # ------------------------------------------------------------------
    # | Subshell prompt string                                         |
    # ------------------------------------------------------------------

    export PS2="⚡ "

    # ------------------------------------------------------------------
    # | Debug prompt string  (when using `set -x`)                     |
    # ------------------------------------------------------------------

    # When debugging a shell script via `set -x` this tricked-out prompt is used.

    # The first character (+) is used and repeated for stack depth
    # Then, we log the current time, filename and line number, followed by function name, followed by actual source line

    # FWIW, I have spent hours attempting to get time-per-command in here, but it's not possible. ~paul
    export PS4='+ \011\e[1;30m\t\011\e[1;34m${BASH_SOURCE}\e[0m:\e[1;36m${LINENO}\e[0m \011 ${FUNCNAME[0]:+\e[0;35m${FUNCNAME[0]}\e[1;30m()\e[0m:\011\011 }'


}

set_prompts
