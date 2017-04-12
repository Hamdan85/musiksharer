# README

[![Build Status](https://semaphoreci.com/api/v1/hamdan/musiksharer/branches/master/shields_badge.svg)](https://semaphoreci.com/hamdan/musiksharer) [![codebeat badge](https://codebeat.co/badges/d454bc9b-bbe8-4b06-99f9-d768419e0910)](https://codebeat.co/projects/github-com-hamdan85-musiksharer-master) [![Coverage Status](https://coveralls.io/repos/github/Hamdan85/musiksharer/badge.svg?branch=master)](https://coveralls.io/github/Hamdan85/musiksharer?branch=master)

## About MusikSharer

This app makes possible to people to search and to favoritate musics.
Musics are added from spotify platform.

THe platform can be accessed in:
https://musiksharer.herokuapp.com

## Requirements

* Ruby 2.3.1
* Rails 5.02
* Elasticsearch (Searchkick)
* DelayedJobs

## Installation

Install Gems:
```
$ bundle install
```
Set Env Variables
```
$ cp example.env .env
```

Set correct DOMAIN_NAME and other parameters in .env

## Migrate Database
```
$ rake db:create db:migrate db:seed
```

Start Server
```
$ rails s
```
or, for local testing with heroku:
```
$ heroku local
```

On console, Index models to ElasticSearch
```
$ rake searchkick:reindex:all
```

## Testing
For testing, please run:
```
$ rspec
```

## Deploy

The application is prepared for deploying on heroku without no further alterations.

Necessary addons on Heroku:

* Bonsai Elasticsearch (Or another Elasticsearch)
* Postgres
* Heroku Redis
* Semaphore (deployment)
* Rollbar (BugCatching)
* SendGrid

Don't forget to turn on at least one workier for cron jobs and mailers (sidekiq).

## Admin Address
Access '/admin' in order to access admin dashboard
Username: admin@musiksharer.com
Password: password

ps: You should have run rake db:seed

