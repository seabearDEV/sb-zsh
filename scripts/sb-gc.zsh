#!/bin/zsh

## Git Commit
gc () {
	echo "$1" > .check-spelling && aspell -c .check-spelling --dont-backup
	MESSAGE=$(cat .check-spelling)
	rm .check-spelling
	echo ""
	echo "Corrected message:"
	echo "\033[32m$MESSAGE\033[0m"
	echo ""
	echo "Do you want to proceed with the commit? (y/n)"
	read response

if [[ "$response" == "y" ]]; then
  echo "Commiting changes..."
	git commit -m  "$MESSAGE"
	echo "Commit to local repository complete."
else
  echo "Commit has been cancelled."
fi
}