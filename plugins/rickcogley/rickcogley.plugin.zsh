export GOPATH=/Users/rcogley/gocode
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

# function to deploy hugo, had --force and --progress on rsync, maybe Apple's is old?
function hugorccdeploy {
    rm -rf /tmp/rick.cogley.info
    chmod -R 775 /Users/rcogley/Repositories/RCC-Hugo2015/static/
    hugo -s /Users/rcogley/Repositories/RCC-Hugo2015/ -d /tmp/rick.cogley.info
    rsync -avze "ssh -p 22" --delete /tmp/rick.cogley.info/ rcogley@cogley.info:/home/rcogley/webapps/rick_hugo01
}

function whatsomz {
    ls -la ~/.oh-my-zsh
}

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# reload oh-my-zsh

function reloadomz {
    source $ZSH/oh-my-zsh.sh
}

open_by_browser(){ open -a $1 $2}
alias firefox='open_by_browser firefox'
alias chrome='open_by_browser "Google Chrome"'
alias esolia='chrome http://www.esolia.com'
