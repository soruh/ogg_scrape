
link="$1"

name="$(cut -d "/" -f5 <<< "$link")"

echo "$name"
