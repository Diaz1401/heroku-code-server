#!/usr/bin/env bash

# SIZE=:Standard-2X
if [[ -z $1 ]]; then
  echo "⬢⬢⬢  Apps name not specified"
  echo "⬢⬢⬢  Usage: ./push.sh appname-example"
  exit 0
else
  PACKS=heroku-community/apt
  APP=$1-$(shuf -n 1 -i 1000-9999)
  rm -rf .git
  git init >/dev/null 2>&1
  git config --local user.email heroku@gmail.com
  git config --local user.name heroku
  git add .
  git commit -m upload
  heroku create -a $APP -b $PACKS --region eu -s heroku-22
  heroku git:remote -a $APP
  git push heroku master
  heroku ps:scale web=0${SIZE} -a $APP
  heroku ps:scale web=1${SIZE} -a $APP
  echo "⬢⬢⬢  Visit https://${APP}.herokuapp.com"
fi
