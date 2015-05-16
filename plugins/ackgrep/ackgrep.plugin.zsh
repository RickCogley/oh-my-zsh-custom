alias a='ack-grep '
alias apage='ack-grep --pager=less -r'
alias ainvert='ack-grep -v '
alias ag='which '
agg() { ack-grep -H $* $ZSH_CUSTOM }

alias f='find . |grep -v svn |grep '
alias findjar='find . -type f -name  *.jar |xargs -n1 -i -t  jar tvf {} |grep '

alias h='history'
alias hg='history|grep -v grep|grep ' 
alias hgg='history|grep '

alias pg='ps -eaf|grep -v grep|grep ' 
alias pgg='ps -eaf|grep '

alias lg='lla|grep '