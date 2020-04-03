[![Build Status](https://travis-ci.org/xenos-ra/demomap.svg?branch=master)](https://travis-ci.org/xenos-ra/demomap)

# Readme

DemoMap is an app that enables organizers of demonstrations to share live information during a demonstration, e.g. route information, medics locations, live comments and so on. Demonstrators can access this information anonymously or with log in to write comments and vote on comments.

## Setup
DemoMap runs on ruby 2.6.5, Rails 6.0.2, Postgresql

- clone repository
- `bundle install`
- `yarn install`
- `db:create`
- `db:migrate`

## Run
Provides app at localhost:3000

```rails s```

## External services
Create en .ENV file and insert keys for
- mapbox
- cloudinary
- twitter
- mail
