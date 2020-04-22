#!/bin/bash

zotero () {
  pdf_directory=$HOME/.zotero/zotero/yg83zi0h.default/zotero/storage
  tmp_directory=$HOME/tmp/zotero_txt
  sum=0
  count=0
  IFS=$'\n'
  for line in $(find $pdf_directory -name '*.pdf'); do
    filename="$(basename "$line" ".pdf").txt"
    text_pathname="$tmp_directory/$filename"
    if [ -f "$text_pathname" ] ; then
      if grep -c "$1" "$text_pathname" > /dev/null ; then
        count="$(grep -c "$1" "$text_pathname")"
        sum=$(( $sum + $count ))
      fi
    else
      pdftotext "$line" "$text_pathname" > /dev/null 2>&1
    fi
  done
  unset IFS
  echo "PDF count: $sum"
}

calibre () {
  calibre_directory=$HOME/Calibre
  grep --include \*.txt -lr "\<$1\>" $calibre_directory | while read line; do
    headline="$(basename "$line" .txt)"
    echo "<details>"
    count="$(grep -c "\<$1\>" "$line")"
    echo "<summary>$headline <b>$count</b></summary>"
    grep -rIh --color=no "\<$1\>" "$line" | while read line; do
      echo $line | sed "s|\b$1\b|<b>&</b>|g"
      echo "<br>"
      echo "<br>"
    done
    echo "</details>"
  done
}

oxford () {
  echo "<br>"
  grep "\b$1\b" $HOME/.goldendict/oxford5000.txt
}


cat << 'EOF'
<!DOCTYPE html>
<html>
<body>
EOF

#zotero "$1"
calibre "$1"
oxford "$1"

cat << 'EOF'
</body>
</html>
EOF
