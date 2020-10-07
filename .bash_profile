export PS1="\u@\h:\w$ "

export RUBOCOP_DAEMON_USE_BUNDLER=true
export BASH_SILENCE_DEPRECATION_WARNING=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

alias git-branch-name='git rev-parse --abbrev-ref HEAD'
alias git-push-new='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias git-show-head='git show $(git rev-parse HEAD)'
alias git-co-branch='git checkout $(git branch | fzf)'
alias git-rebase-on='git rebase $(git branch | fzf)'
alias git-log='git log $(fzf)'
alias vi=vim
alias bunlde=bundle
alias spec='bundle exec rspec'
alias headless_spec='CAPYBARA_DRIVER=selenium_chrome_headless bundle exec rspec'
alias be='bundle exec'
alias mycoach="RBENV_VERSION=$(cat $HOME/src/coach/coach_cli/.ruby-version) BUNDLE_GEMFILE=$HOME/src/coach/coach_cli/Gemfile bundle exec $HOME/src/coach/coach_cli/exe/coach"

[ -f ~/.bashrc ] && source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
