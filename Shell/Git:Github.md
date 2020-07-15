# Git/Github


## Command Line

### Unix

- cd

	- cd ..

	- Drag the file into the terminal

- open

	- open .

- pwd

- ls

	- ls -all

		- Also show the hidden files

- clear

### Git

- git

	- commit

		- -a

			- Add all to staging area

		- -m

			- “Here is the message”

		- Make sure your Mac has got your credential

			- git config --global user.name “Username”  
			  git config --global user.email some@exam.com

				- git needs to know who is committing!

	- init

		- Initialize the repo

	- clone

		- Copy to local file

	- status

		- See if there are any changes between local repo and the one on the server

	- log

		- To see the history of commits

	- repo

	- branch

	- merge

		- If we want to merge from a pull request

			- git remote add aName URL  
			  git branch aBranch  
			  git checkout aBranch  
			  git pull aName aBranch  
			  git status -v  
			  git commit -m “Merging changes from @user1”  
			  git checkout master  
			  git merge aBranch  
			  git push origin master

	- fork

	- pull request

	- push

		- origin

			Check the name from remote command

			- master

				Branch name

				- Push to github

					- If there is no remote or repo on github

						- git remote add origin [https://....URL](https://....URL)
						  git push origin

	- pull

		- Pull from github

			- git pull origin master

	- remote

		- -v

	- add

		- This is required if it’s a new file

			- git add dance.txt  
			  git commit -m “adding a new txt file”

			- git add .  
			  git commit -m “adding all the new and changed files”

		- Add files to the staging area

		- *.html

			- Add all html files to the staging area

	- rm

		- --cached

			- Index.html

				- Remove files from staging area

	- ignore

		- touch .gitignore

			- 把想要无视的文件 或者目录加入这个文件  
			  即使git add . 也不会add log.txt

## GitHub

### gh pages

### Merge conflicts

