function add_ext() {
  local new_ext=$1
  for file in *(N); do
    echo "${file} --> $file.$new_ext"
    mv -i "$file" "$file.$new_ext"
  done
}

function change_ext() {
  local curr_ext=$1
  local new_ext=$2

  for file (*."$curr_ext"(N)); do
    mv -i "$file" "${file%%.$curr_ext}.$new_ext"
  done
}