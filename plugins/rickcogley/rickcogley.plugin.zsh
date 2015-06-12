export GOPATH=/Users/rcogley/gocode
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
export HOMEBREW_GITHUB_API_TOKEN="$(cat ~/.homebrew_github_api_token)"


# function to deploy hugo, had --force and --progress on rsync, maybe Apple's is old?
function hugodeploy-rcc {
    cd /Users/rcogley/Repositories/RCC-Hugo2015
    rm -rf /tmp/rick.cogley.info
    export RCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/RCC-Hugo2015/static/css/rickcogleyinfo.css)"
    export TOPICSRCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/RCC-Hugo2015/static/css/topics.min.css)"
    export PRISMRCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/RCC-Hugo2015/static/css/prism.min.css)"
    export LIGHTRCCCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/RCC-Hugo2015/static/css/lightbox.min.css)"
    chmod -R 775 /Users/rcogley/Repositories/RCC-Hugo2015/static/
    hugo --config="/Users/rcogley/Repositories/RCC-Hugo2015/config.toml" -s /Users/rcogley/Repositories/RCC-Hugo2015/ -d /tmp/rick.cogley.info
    rsync -avze "ssh -p 22" --delete /tmp/rick.cogley.info/ rcogley@cogley.info:/home/rcogley/webapps/rick_hugo01
}

function hugodeploy-esoliacom {
    cd /Users/rcogley/Repositories/eSolia
    rm -rf /tmp/esolia.com
    export STYLECSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/style.css)"
    export FEEDEKCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/FeedEk-2.0.min.css)"
    export FONTELLOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/fontello.min.css)"
    export GHPMATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/ghpages-materialize.min.css)"
    export MATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/materialize.min.css)"
    export PRISMCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/prism.min.css)"
    export TYPOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/typography.min.css)"
    export LATESTSHA="$(git rev-parse master)"
    chmod -R 775 /Users/rcogley/Repositories/eSolia/static/
    hugo --config="/Users/rcogley/Repositories/eSolia/config_en.toml" -s /Users/rcogley/Repositories/eSolia/ -d /tmp/esolia.com
    rsync -avze "ssh -p 22" --delete /tmp/esolia.com/ rcogley@cogley.info:/home/rcogley/webapps/es_hugo_esolia_com_01
    curl -X POST "http://util-02.esolia.com/flowdock/v2/flowdock.php?action=chat&chat_name=Auto-Script&chat_content=%40team%20Copied+files+to+ESOLIA.COM+site+via+rsync+including+commit+https%3A%2F%2Fgithub.com%2FeSolia%2FeSolia%2Fcommit%2F$LATESTSHA&chat_tags=esolia.com&flowdock_api=73d6f7%3Df83ad24ab6628fda5ca2b18fff349a5877a928O7o799"
}

function hugodeploy-esoliacojp {
    cd /Users/rcogley/Repositories/eSolia
    rm -rf /tmp/esolia.co.jp
    export STYLECSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/style.css)"
    export FEEDEKCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/FeedEk-2.0.min.css)"
    export FONTELLOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/fontello.min.css)"
    export GHPMATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/ghpages-materialize.min.css)"
    export MATCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/materialize.min.css)"
    export PRISMCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/prism.min.css)"
    export TYPOCSS_HASH="$(git log -1 --format='%h' /Users/rcogley/Repositories/eSolia/static/css/typography.min.css)"
    export LATESTSHA="$(git rev-parse master)"
    chmod -R 775 /Users/rcogley/Repositories/eSolia/static/
    hugo --config="/Users/rcogley/Repositories/eSolia/config_ja.toml" -s /Users/rcogley/Repositories/eSolia/ -d /tmp/esolia.co.jp
    rsync -avze "ssh -p 22" --delete /tmp/esolia.co.jp/ rcogley@cogley.info:/home/rcogley/webapps/es_hugo_esolia_co_jp_01
    curl -X POST "http://util-02.esolia.com/flowdock/v2/flowdock.php?action=chat&chat_name=Auto-Script&chat_content=%40team%20Copied+files+to+ESOLIA.CO.JP+site+via+rsync+including+commit+https%3A%2F%2Fgithub.com%2FeSolia%2FeSolia%2Fcommit%2F$LATESTSHA&chat_tags=esolia.co.jp&flowdock_api=73d6f7%3Df83ad24ab6628fda5ca2b18fff349a5877a928O7o799"
}

# function to run hugo server

function hugoserver-esoliacom {
    cd /Users/rcogley/Repositories/eSolia
    hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/Repositories/eSolia" --config="/Users/rcogley/Repositories/eSolia/config_en.toml" --port=1377
}

function hugoserver-esoliacojp {
    cd /Users/rcogley/Repositories/eSolia
    hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/Repositories/eSolia" --config="/Users/rcogley/Repositories/eSolia/config_ja.toml" --port=1399
}

function hugoserver-rcc {
    cd /Users/rcogley/Repositories/RCC-Hugo2015
    hugo server --buildDrafts --watch --verbose --editor="atom" --source="/Users/rcogley/Repositories/RCC-Hugo2015" --config="/Users/rcogley/Repositories/RCC-Hugo2015/config.toml" --port=1313
}

# function to output hugo config

function hugoconfig-esoliacom {
	cd /Users/rcogley/Repositories/eSolia
	hugo config --config="/Users/rcogley/Repositories/eSolia/config_en.toml" > /Users/rcogley/Repositories/eSolia/config_en.txt
}

function hugoconfig-esoliacojp {
	cd /Users/rcogley/Repositories/eSolia
	hugo config --config="/Users/rcogley/Repositories/eSolia/config_ja.toml" > /Users/rcogley/Repositories/eSolia/config_ja.txt
}

function hugoconfig-rcc {
	cd /Users/rcogley/Repositories/RCC-Hugo2015
	hugo config --config="/Users/rcogley/Repositories/RCC-Hugo2015/config.toml" > /Users/rcogley/Repositories/RCC-Hugo2015/config.txt
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

open_by_browser(){ open -a $1 $2}
alias firefox='open_by_browser firefox'
alias chrome='open_by_browser "Google Chrome"'
alias esolia='chrome http://www.esolia.com'

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
