# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
# ------------------------------------------------------------
export BLOCKSIZE=1k

# Add color to terminal
# (this is all commented out as I use Mac Terminal Profiles)
# from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Infinite history for Bash
# http://stackoverflow.com/questions/10374019/how-to-get-infinite-command-history-in-bash
export HISTSIZE="GOTCHA"

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation

# extract:  Extract most know archives with one command
# ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# findPid: find out the pid of a specified process
# -----------------------------------------------------
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
# -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }

# memHogsTop, memHogsPs:  Find memory hogs
# -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

# cpuHogs:  Find CPU hogs
# -----------------------------------------------------
alias cpuHogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# topForever:  Continual 'top' listing (every 10 seconds)
# -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

# ttop:  Recommended 'top' invocation to minimize resources
# ------------------------------------------------------------
# Taken from this macosxhints article
# http://www.macosxhints.com/article.php?story=20060816123853639
# ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

# my_ps: List processes owned by my user:
# ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections

# ii:  display useful host related informaton
# -------------------------------------------------------------------
ii() {
    echo -e "\nYou are logged on ${RED}$HOSTNAME"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    echo
}

# cleanupDS:  Recursively delete .DS_Store files
# -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# finderShowHidden:   Show hidden files in Finder
# finderHideHidden:   Hide hidden files in Finder
# -------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

alias mc='/usr/local/opt/midnight-commander/bin/mc -d'

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
