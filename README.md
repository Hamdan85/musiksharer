# README

## Badges 

[![Build Status](https://semaphoreci.com/api/v1/hamdan/musiksharer/branches/master/shields_badge.svg)](https://semaphoreci.com/hamdan/musiksharer) [![codebeat badge](https://codebeat.co/badges/d454bc9b-bbe8-4b06-99f9-d768419e0910)](https://codebeat.co/projects/github-com-hamdan85-musiksharer-master)

## About

### MusikSharer

This app makes possible to people to search and to favoritate musics.
Musics are added from spotify platform.

## Requirements

* Ruby 2.3.1
* Rails 5.02
* Elasticsearch (Searchkick)
* Sidekiq (Opcional)

## Installation

Install Gems:
```
$ bundle install
```

## Migrate Database
```
$ rake db:create && rake db:migrate && rake db:seed
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

### Current Code Coverage
Coverage report generated for RSpec:
170 / 213 LOC (79.81%) covered.

