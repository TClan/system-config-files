function bash_settings
{
  export PS1='\w$ '
  export PS1='\w$(__git_ps1 "(%s)")$ '
  export EDITOR="vim"
  export HISTSIZE=1000
  export HISTFILESIZE=1000
  export HISTCONTROL=ignoredups
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWDIRTYSTATE=true	
  export GIT_PS1_SHOWUPSTREAM=true
}
function system_command_aliases 
{
  alias ls='ls -G'
  alias mkdir='mkdir -p'
  alias df='df -h'
  alias du='du -h -c'
  alias ln='ln -s'
  alias rf='rm -rf'
  alias sniff_lo='sudo tcpdump -i lo0 -A'
}

function package_aliases
{
  alias mysql_start="mysqld --skip-grant &disown"
  alias mysqlc="mysql -uroot -pruebe"
  alias mongo_start="sudo rm /data/db/mongod.lock && nohup mongod >/dev/null 2>&1"
  alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
  alias redis_start="nohup redis-server /usr/local/etc/redis.conf >/dev/null 2>&1"
  alias be="bundle exec"
  alias g="git"
  alias gdi="git di"
  alias git_cleanup="git branch | grep -v 'master\|develop' | xargs git branch -D"
  alias git=hub
  alias mdiff="git di | mate"
  alias dim="sips -g pixelWidth -g pixelHeight"
  alias e="subl -n ."
}

function gca
{
  git add -A .
  git commit -m "$@"
}

source .git-prompt.sh
[ -z "$PS1" ] && return

bash_settings
system_command_aliases
package_aliases

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
