export GOPATH=/Users/rcogley/gocode
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
export HOMEBREW_GITHUB_API_TOKEN="$(cat ~/.homebrew_github_api_token)"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
source /usr/local/share/zsh/site-functions/_aws

# functions to manually backup PROdb or dbflex

function tdbackup-esolia {
    cd /Users/rcogley/Google\ Drive/\!Backups/PROdb/15331
    /usr/local/bin/mono tdbackup.exe
}

function tdbackup-cookjp {
      cd /Users/rcogley/Google\ Drive/\!Backups/PROdb/15361
    /usr/local/bin/mono tdbackup.exe
}

function tdbackup-cookap {
      cd /Users/rcogley/Google\ Drive/\!Backups/PROdb/25822
    /usr/local/bin/mono tdbackup.exe
}

function tdbackup-jrc {
      cd /Users/rcogley/Google\ Drive/\!Backups/PROdb/26644
    /usr/local/bin/mono tdbackup.exe
}

# function to deploy hugo, had --force and --progress on rsync, maybe Apple's is old?
function hugodeploy-rcc {
    cd /Users/rcogley/dev/RCC-Hugo2015
    :>| ~/dev/RCC-Hugo2015/data/postgitinfo.yaml && for f in ~/dev/RCC-Hugo2015/content/post/*.md; do echo "$(cat $f|grep slug|sed 's/slug: //'): $(git log --pretty="%h %s" -1 $f)" >> ~/dev/RCC-Hugo2015/data/postgitinfo.yaml; done
    rm -rf /tmp/rick.cogley.info
    # export RCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/RCC-Hugo2015/static/bundle/bundle.css)"
    # export TOPICSRCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/RCC-Hugo2015/static/css/topics.min.css)"
    # export PRISMRCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/RCC-Hugo2015/static/css/prism.min.css)"
    export PRISMRCCJS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/RCC-Hugo2015/static/js/prism.min.js)"
    export LIGHTRCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/RCC-Hugo2015/static/css/lightbox.min.css)"
    export LIGHTRCCJS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/RCC-Hugo2015/static/js/lightbox.min.js)"
    chmod -R 775 /Users/rcogley/dev/RCC-Hugo2015/static/
    hugo --config="/Users/rcogley/dev/RCC-Hugo2015/config.toml" -s /Users/rcogley/dev/RCC-Hugo2015/ -d /tmp/rick.cogley.info
    /usr/local/bin/rsync -avz --delete --iconv=UTF-8-MAC,UTF-8 /tmp/rick.cogley.info/ rcogley@cogley.info:/home/rcogley/webapps/rick_hugo01
}

function hugodeploy-esoliapro {
    cd /Users/rcogley/dev/eSolia.pro
    rm -rf /tmp/esolia.pro
    export STYLECSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia.pro/static/css/style.css)"
    export FEEDEKCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia.pro/static/css/FeedEk-2.0.min.css)"
    export FONTELLOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia.pro/static/css/fontello.min.css)"
    export GHPMATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia.pro/static/css/ghpages-materialize.min.css)"
    export MATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia.pro/static/css/materialize.min.css)"
    export PRISMCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia.pro/static/css/prism.min.css)"
    export TYPOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia.pro/static/css/typography.min.css)"
    export LATESTSHA="$(git rev-parse master)"
    chmod -R 775 /Users/rcogley/dev/eSolia.pro/static/
    hugo --config="/Users/rcogley/dev/eSolia.pro/config.toml" -s /Users/rcogley/dev/eSolia.pro/ -d /tmp/esolia.pro
    /usr/local/bin/rsync -avz --delete --iconv=UTF-8-MAC,UTF-8 /tmp/esolia.pro/ rcogley@cogley.info:/home/rcogley/webapps/es_hugo_esolia_pro_01
    curl -X POST "http://util-02.esolia.com/flowdock/v2/flowdock.php?action=chat&chat_name=Auto-Script&chat_content=%40team%20Copied+files+to+ESOLIA.PRO+site+via+rsync+including+commit+https%3A%2F%2Fgithub.com%2FeSolia%2FeSolia.pro%2Fcommit%2F$LATESTSHA&chat_tags=esolia.pro&flowdock_api=73d6f7%3Df83ad24ab6628fda5ca2b18fff349a5877a928O7o799"
}

function hugodeploy-esoliacom {
    cd /Users/rcogley/dev/eSolia
    rm -rf /tmp/esolia.com
    export STYLECSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/style.css)"
    export FEEDEKCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/FeedEk-2.0.min.css)"
    export FONTELLOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/fontello.min.css)"
    export GHPMATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/ghpages-materialize.min.css)"
    export MATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/materialize.min.css)"
    export PRISMCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/prism.min.css)"
    export TYPOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/typography.min.css)"
    export LATESTSHA="$(git rev-parse master)"
    chmod -R 775 /Users/rcogley/dev/eSolia/static/
    hugo --config="/Users/rcogley/dev/eSolia/config_en.toml" -s /Users/rcogley/dev/eSolia/ -d /tmp/esolia.com
    /usr/local/bin/rsync -avz --delete --iconv=UTF-8-MAC,UTF-8 /tmp/esolia.com/ rcogley@cogley.info:/home/rcogley/webapps/es_hugo_esolia_com_01
    curl -X POST "http://util-02.esolia.com/flowdock/v2/flowdock.php?action=chat&chat_name=Auto-Script&chat_content=%40team%20Copied+files+to+ESOLIA.COM+site+via+rsync+including+commit+https%3A%2F%2Fgithub.com%2FeSolia%2FeSolia%2Fcommit%2F$LATESTSHA&chat_tags=esolia.com&flowdock_api=73d6f7%3Df83ad24ab6628fda5ca2b18fff349a5877a928O7o799"
}

function hugodeploy-esoliacojp {
    cd /Users/rcogley/dev/eSolia
    rm -rf /tmp/esolia.co.jp
    export STYLECSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/style.css)"
    export FEEDEKCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/FeedEk-2.0.min.css)"
    export FONTELLOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/fontello.min.css)"
    export GHPMATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/ghpages-materialize.min.css)"
    export MATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/materialize.min.css)"
    export PRISMCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/prism.min.css)"
    export TYPOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/dev/eSolia/static/css/typography.min.css)"
    export LATESTSHA="$(git rev-parse master)"
    chmod -R 775 /Users/rcogley/dev/eSolia/static/
    hugo --config="/Users/rcogley/dev/eSolia/config_ja.toml" -s /Users/rcogley/dev/eSolia/ -d /tmp/esolia.co.jp
    /usr/local/bin/rsync -avz --delete --iconv=UTF-8-MAC,UTF-8 /tmp/esolia.co.jp/ rcogley@cogley.info:/home/rcogley/webapps/es_hugo_esolia_co_jp_01
    curl -X POST "http://util-02.esolia.com/flowdock/v2/flowdock.php?action=chat&chat_name=Auto-Script&chat_content=%40team%20Copied+files+to+ESOLIA.CO.JP+site+via+rsync+including+commit+https%3A%2F%2Fgithub.com%2FeSolia%2FeSolia%2Fcommit%2F$LATESTSHA&chat_tags=esolia.co.jp&flowdock_api=73d6f7%3Df83ad24ab6628fda5ca2b18fff349a5877a928O7o799"
}

# function to run hugo server

function hugoserver-esoliacom {
    cd /Users/rcogley/dev/eSolia
    hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/dev/eSolia" --config="/Users/rcogley/dev/eSolia/config_en.toml" --port=1377
}

function hugoserver-stable-esoliacom {
    cd /Users/rcogley/dev/eSolia
    /usr/local/Cellar/hugo/0.14/bin/hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/dev/eSolia" --config="/Users/rcogley/dev/eSolia/config_en.toml" --port=1377
}

function hugoserver-esoliacojp {
    cd /Users/rcogley/dev/eSolia
    hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/dev/eSolia" --config="/Users/rcogley/dev/eSolia/config_ja.toml" --port=1399
}

function hugoserver-stable-esoliacojp {
    cd /Users/rcogley/dev/eSolia
    /usr/local/Cellar/hugo/0.14/bin/hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/dev/eSolia" --config="/Users/rcogley/dev/eSolia/config_ja.toml" --port=1399
}

function hugoserver-esoliapro {
    cd /Users/rcogley/dev/eSolia.pro
    hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/dev/eSolia.pro" --config="/Users/rcogley/dev/eSolia.pro/config.toml" --port=1388
}

function hugoserver-rcc {
    cd /Users/rcogley/dev/RCC-Hugo2015
    hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/dev/RCC-Hugo2015" --config="/Users/rcogley/dev/RCC-Hugo2015/config.toml" --port=1313
}

# function to output hugo config

function hugoconfig-esoliacom {
	cd /Users/rcogley/dev/eSolia
	hugo config --config="/Users/rcogley/dev/eSolia/config_en.toml" > /Users/rcogley/dev/eSolia/config_en.txt
}

function hugoconfig-esoliacojp {
	cd /Users/rcogley/dev/eSolia
	hugo config --config="/Users/rcogley/dev/eSolia/config_ja.toml" > /Users/rcogley/dev/eSolia/config_ja.txt
}

function hugoconfig-rcc {
	cd /Users/rcogley/dev/RCC-Hugo2015
	hugo config --config="/Users/rcogley/dev/RCC-Hugo2015/config.toml" > /Users/rcogley/dev/RCC-Hugo2015/config.txt
}

function hugowatchesolias {
    chrome http://localhost:1399
    chrome http://localhost:1377
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

# put pgp on clipboard

function pgp2clipboard {
  gpg --armor --export 3346F03F | pbcopy
}

### TaskWarrior ###
# Alias for quick add to inbox 

alias in='task add +inbox'

# Tickle task into inbox

tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}

# tw research and dev alias

alias rnd='task add +rnd +next +computer +online'

# tw read and review some URL

webpage_title (){
    wget -qO- "$*" | hxselect -s '\n' -c  'title' 2>/dev/null
}

read_and_review (){
    link="$1"
    title=$(webpage_title $link)
    echo $title
    descr="\"Read and review: $title\""
    id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}

alias rnr=read_and_review

# tw context 

alias tc="task context"
alias tt="task rc.context=none"
alias twork="task rc.context=work"
alias thome="task rc.context=home"
alias tgoto="task rc.context=goto"

open_by_browser(){ open -a $1 $2}
alias firefox='open_by_browser firefox'
alias chrome='open_by_browser "Google Chrome"'
alias esolia='chrome http://www.esolia.com'
alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
