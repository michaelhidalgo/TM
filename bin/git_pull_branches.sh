#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo -e "\nError: You must provide the name of the branch to pull, for example: git_pull_branches Dev\n"
  exit 1
fi

cd code
git fetch origin

function pull_Repo() {
  echo -------------------------------------------------
  echo Fetching branch $1 on repo $2
  cd $2
  git checkout $1
  git pull origin $1:$1
  cd ..
}
pull_Repo $1 TM_Flare
pull_Repo $1 TM_GraphDB
pull_Repo $1 TM_Jade
pull_Repo $1 TM_Shared
pull_Repo $1 TM_Static
pull_Repo $1 TM_Website

cd ../config
pull_Repo $1 SiteData_TM