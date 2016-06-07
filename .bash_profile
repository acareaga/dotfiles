# Load rvm so you can access Ruby

# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
  cd "$(dirname $(gem which $1))"
}

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gc="git checkout"
alias gb="git branch"
alias ga="git add"
alias gh="git hist"

# Regis Commands
alias procreate="RAILS_ENV=production rake db:create"
alias prowomp="RAILS_ENV=production rake db:migrate db:seed"
alias proserve="RAILS_ENV=production rails s -b "
alias ngstart="sudo service nginx start"
alias ngstop="sudo service nginx stop"
alias clob="rake assets:clobber RAILS_ENV=production"
alias precomp="rake assets:precompile RAILS_ENV=production"
alias heropm="git push heroku master"
alias heronew="heroku create"
alias heroconnect="herkou git:remote -a"
alias heropg="heroku pg:reset DATABASE_URL --confirm"
alias herowomp="heroku run rake db:migrate db:seed"
alias womp="rake db:migrate db:seed"
alias bam="rake db:reset"
alias boom="rake db:drop"
alias yolo="rake db:drop db:create db:migrate db:seed"
alias gs="git status"
alias ga="git add -A"
alias gc="git commit -m"
alias oops="git reset --hard"
alias gk="git checkout"
alias gkm="git checkout master"
alias gkb="git checkout -b"
alias gp="git pull"
alias gpp="git push"
alias gpo="git push origin"
alias brewu="brew update"
alias brewup="brew upgrade --all"
alias brewcu="brew cleanup"
alias brewdoc="brew doctor"
alias bpro="vim .bash_profile"
alias bgo=". .bash_profile"
alias dbstart="postgres -D /usr/local/var/postgres"

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias l="ls -lFGgohq"

# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
  ruby -e '
    $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
    ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
  ' "$@"
}

# Enable git's tab-completion library
source /usr/local/etc/bash_completion.d/git-completion.bash

# Shortcut for bundle exec
alias be="bundle exec"

# Prompt
  function parse_git_branch {
    branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ "HEAD" = "$branch" ]; then
      echo "(no branch)"
    else
      echo "$branch"
    fi
  }

  function prompt_segment {
    # for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
    # change the 37 to change the foreground
    # change the 45 to change the background
    if [[ ! -z "$1" ]]; then
      echo "\[\033[${2:-37};45m\]${1}\[\033[0m\]"
    fi
  }

  function build_mah_prompt {
    # time
    ps1="$(prompt_segment " \@ ")"

    # cwd
    ps1="${ps1} $(prompt_segment " \w ")"

    # git branch
    git_branch=`parse_git_branch`
    if [[ ! -z "$git_branch" ]]
    then
      ps1="${ps1} $(prompt_segment " $git_branch " 32)"
    fi

    # next line
    ps1="${ps1}\n\$ "

    # set prompt output
    PS1="$ps1"
  }

  PROMPT_COMMAND='build_mah_prompt'
  # export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
