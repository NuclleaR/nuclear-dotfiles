# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export JAVA_HOME=/home/nuclear/Applications/java
export ANDROID_HOME=/home/nuclear/Applications/android
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$JAVA_HOME/bin
export PATH=${PATH}:/home/nuclear/Applications/node-js/bin

source ~/.git-completion.bash

alias iobuild='ionic build android'
alias iorun='ionic run android'
alias adev='adb devices'
alias akill='adb kill-server'
alias apres='sudo service apache2 restart'
alias siteslinks='sudo cp -sR /etc/apache2/sites-available/* /etc/apache2/sites-enabled/'
alias confcopy='sudo cp -R /home/nuclear/repo/web/videe/apache/sites-available/* /etc/apache2/sites-available'
alias videe='cd /home/nuclear/repo/web/videe'
alias bashreload='source ~/.bashrc'
alias ap-install='sudo apt-get install -y'

#guake config
#color: #ffffffffffff
#gconftool --get /apps/guake/style/font/palette
#palette: #4e4e4e4e4e4e:#ffff6b6b6060:#ffffc3e10000:#ffffffffb6b6:#56569696eded:#ffff7373fdfd:#8e8ee4e47878:#eeeeeeeeeeee:#4f4f4f4f4f4f:#f9f968686060:#fafab0b03636:#fdfdffffb8b8:#6b6b9f9feded:#fcfc6e6ef9f9:#8e8ee4e47878:#ffffffffffff:#f8f8f8f8f2f2:#000000000000

export CDB_POST_PREFIX=lm0-post
export CDB_API_KEY=athesedistembeessiderste
export CRISP_API_KEY=a82dc2e3-0ab0-4194-bea2-459d4a94e583
export FROM_EMAIL_DOMAIN=likeminder.net
export PARSE_MASTER_KEY=O8KwjxjvyJw5H8YpCJTnUEmSx3PDjasBk5VdDl5y
export CRISP_HOST=http://stage.rmf.crispthinking.com
export MANDRILL_API_KEY=vBML-kS3RFw46ABAufz6iA
export CDB_API_PASS=gYxV7MCENpbcLPNfjcopeQxT
export CDB_USER_PROFILE=lm0-user_profile-dev
export CDB_KEY=lm0-key-dev
export HEROKU_POSTGRESQL_BLACK_URL=postgres://gqsmzezcsnstcs:51dUZfQVjxbnwAJbkxKc1XCux_@ec2-54-227-239-195.compute-1.amazonaws.com:5432/ddacmo1b32sjf6
export MEMCACHEDCLOUD_SERVERS=pub-memcache-10429.us-east-1-4.1.ec2.garantiadata.com:10429
export MEMCACHEDCLOUD_USERNAME=memcached-app18257596
export LOG_LEVEL=DEBUG
export CDB_GROUP=lm0-group-dev
export EMAIL_TEMPLATE_REQUEST_KEY=likeminder-request-accepted
export CDB_ORG=lm0-org-dev
export CRISP_SENDER_SUFFIX=_END_TO_END_TEST
export PARSE_APP_ID=304RjayPnS0uZOcZi8clI2VdWM80gQVYW1Vxd2PD
export PAYMENT_API_URL=https://www.sandbox.paypal.com/cgi-bin/webscr
export EMAIL_TEMPLATE_PREFIX_USER=user
export CDB_PUBLIC_USER_PROFILE=lm0-public_user_profile-dev
export COMMUNITY_N_SEATS=3
export SUBSCRIPTION_MAIL_LM_METER_MIN=0.6
export CRISP_CONTENT_TYPE=TheLockers.LikeMinder.English.Forum.Black
export MEMCACHEDCLOUD_PASSWORD=T1NVV5VACBD4rYoS
export WEB_CONCURRENCY=20
export CDB_NOTIFICATION=lm0-notification-dev
export PARSE_REST_API_KEY=9firQM2x44gKH3vTCYsRSf9yIejlnaOYSG81D6Vm
export CDB_SERVER=likeminder-dev.cloudant.com
export CRISP_DEFAULT_POLICY=TheLockers.LikeMinder.English.Forum.Black.Stage
export HEROKU_API_KEY=OmY1ZjhkMTIyLWY1ZTQtNDAzMy05NTJmLWIxZDJlZDM1MTg4ZQ
export URL_PREFIX=http://likeminder0-dev.herokuapp.com/
export CDB_MAIN_USER=likeminder-dev
export ENV_NAME=dev
export PP_SIGNATURE=????
export ANALYTICS_KEY=UA-41729932-4
export EMAIL_TEMPLATE_VERIFICATION=likeminder-email-verification
export HOME_URL=http://likeminder0-dev.herokuapp.com/
export DATABASE_URL=postgres://gqsmzezcsnstcs:51dUZfQVjxbnwAJbkxKc1XCux_@ec2-54-227-239-195.compute-1.amazonaws.com:5432/ddacmo1b32sjf6
export EMAIL_TEMPLATE_PREFIX_ADMIN=admin
export CDB_MAIN_PWD=a1s2d3f4
export CDB_PROFILE_PROPERTY=lm0-profile_property-dev
export WP_URL=/register
export EMAIL_TEMPLATE_PASSWORD_RESET=likeminder-password-reset
export PP_ACCOUNT_EMAIL=lmppbus1@likeminder.net
export EMAIL_TEMPLATE_RESET_PASSWORD=likeminder-reset-password
export PGBACKUPS_URL=https://504292:9w1jk0al8q8l8bs4h1c18bqe7@pgbackups.herokuapp.com/client
export CDB_ENUM=lm0-enum-dev
export DJANGO_SETTINGS_MODULE=likeminder.settings
export COMMUNITY_MANAGER_EMAIL=communitymanager@likeminder.net
export PYTHONUNBUFFERED=1
export CDB_MINDSPACE=lm0-mindspace-dev
export CDB_THREAD_PREFIX=lm0-thread
export MANDRILL_USERNAME=admin@likeminder.net
export DEF_GROUP=????
export MAX_COMMUNITIES=50
