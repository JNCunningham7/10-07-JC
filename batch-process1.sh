#! /bin/sh 

for f in "$1"/*; do
  if [ -f "$f" ]; then
    SIZE="$(du -sh "${f}" | cut -f1)"
    echo "Processing $f file..."
    echo "$SIZE"
  fi
done

walk() {
	# if it's a file, do process
	for entry in "$1"/*; do
		[[ -f "$entry" ]] && do_process_file;
	done

	# if it's a directory, call walk() recursively
	for entry in "$1"/*; do
		[[ -d "$entry" ]] && walk "$entry";
	done
}

