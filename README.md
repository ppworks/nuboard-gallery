# genuineblue tempate application for rails4

## Setup for development

rename Guardfile.example to Guardfile

```
$ cp Guardfile.example Guardfile
```

## External API Credential

```
cp config/application.yml.example config/application.yml
```

Fill in api credential

## Start foreman

```
$ foreman start -f Procfile.development
```

## heroku

```
heroku create genuineblue
git remote rename heroku genuineblue
git push genuineblue master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
rake figaro:heroku\[genuineblue\]
```

### staging

```
heroku create genuineblue-stg
git remote set-url genuineblue-stg git@heroku.com:genuineblue-stg.git
git push genuineblue master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
heroku addons:add mailtrap
heroku config:set RACK_ENV=staging RAILS_ENV=staging
rake figaro:heroku\[genuineblue-stg\]
```
