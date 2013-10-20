# web_search from terminal

function web_search() {

  # get the open command
  local open_cmd
  open_cmd='xdg-open'

  # check whether the search engine is supported
  if [[ ! $1 =~ '(google|bing)' ]];
  then
    echo "Search engine $1 not supported."
    return 1
  fi

  local url="http://www.$1.com"

  # no keyword provided, simply open the search engine homepage
  if [[ $# -le 1 ]]; then
    $open_cmd "$url"
    return
  fi

  url="${url}/search?q="
  shift   # shift out $1

  while [[ $# -gt 0 ]]; do
    url="${url}$1+"
    shift
  done

  url="${url%?}" # remove the last '+'

  $open_cmd "$url"
}

alias bing='web_search bing'
alias google='web_search google'
