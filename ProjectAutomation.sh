# Make executable with chmod +x <<filename.sh>>

CURRENTDIR=${pwd}

# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
echo "What name do you want to give your remote repo?"
read REPO_NAME

echo "Enter a repo description: "
read DESCRIPTION

echo "Enter a folder name: "
read FOLDER_NAME

PROJ_PATH="/Users/liamwebster/Documents/Projects"
cd "$PROJ_PATH"
mkdir $FOLDER_NAME

PROJECT_PATH="/Users/liamwebster/Documents/Projects/$FOLDER_NAME"
cd "$PROJECT_PATH"

# step 4: initialise the repo locally, create blank README, add and commit
git init
touch README.MD
git add README.MD
git commit -m 'initial commit -setup with .sh script'


# step 5 use github API to log the user in
curl -u liamwebster2001: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 -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}" https://api.github.com/user/repos

#  step 6 add the remote github repo to local repo and push
git remote add origin https://github.com/liamwebster2001/${REPO_NAME}.git
git push --set-upstream origin master

# step 7 change to your project's root directory.
cd "$PROJECT_PATH"

echo "Done. Go to https://github.com/$USERNAME/$REPO_NAME to see." 
echo " *** You're now in your project root. ***"