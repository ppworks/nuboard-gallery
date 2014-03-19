# Nuboard Gallery

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

```
rake secret
```

Fill in SECRET_TOKEN by the key above result.

## Start guard

```
$ guard
```

## heroku

```
heroku create nuboard-gallery
git remote rename heroku nuboard-gallery
git push nuboard-gallery master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
rake figaro:heroku\[nuboard-gallery\]
```

### staging

```
heroku create nuboard-gallery-stg
git remote set-url nuboard-gallery-stg git@heroku.com:nuboard-gallery-stg.git
git push nuboard-gallery master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
heroku addons:add mailtrap
heroku config:set RACK_ENV=staging RAILS_ENV=staging
rake figaro:heroku\[nuboard-gallery-stg\]
```
