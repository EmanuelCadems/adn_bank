# README

[![Build Status](https://travis-ci.org/EmanuelCadems/adn_bank.svg?branch=master)](https://travis-ci.org/EmanuelCadems/adn_bank)
[![Maintainability](https://api.codeclimate.com/v1/badges/cbe58f58c5b9514c68da/maintainability)](https://codeclimate.com/github/EmanuelCadems/adn_bank/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/EmanuelCadems/adn_bank/badge.svg?branch=master)](https://coveralls.io/github/EmanuelCadems/adn_bank?branch=master)

This is an API which allows you to check a DNA an save it into a database. It also has an endpoint for statistics.

The version 2 only allows you to detect what kind of DNA are you sending on.

The version 3 attach a Database to the DNA Checker and includes an enpoint for statistics.

This is an scalable API with Google App Engine flexible environment.


## Ruby version


  2.5.1
    Are you using rvm?
    run:
```bash
  $ cd .
```

## Configuration


Install bundler with:
```bash
  $ gem install bundler -v='1.16.2' --no-rdoc --no-ri
```
Then install all dependencies with
```bash
  $ bundle install
```

## Database creation
```bash
  $ rake db:create
```

## Database initialization
```bash
  $ rake db:migrate
```

## How to run the test suite
This project use rspec. You can run the tests with:
```bash
  $ rake
```
You can see the coverage with:
```bash
  $ open coverage/index.html
```

## Check code
This project check the quality of the code using rubucop, rails_best_practices, flay, brakeman, and rspec.

You can run all this tools with the following task:
```bash
  $ rake code:check
```

## Start the server
```bash
  $ rails s
```

## How to use:
Check de documentation here:
  https://dna-bank-205308.appspot.com/docs/

You can use curl or even import the requests to Postman using the curl command which is supplied by the documentation

## Deployment instructions
To deploy run:
```bash
  $ gcloud app deploy --project dna-bank-205308
```
You can stream logs from the command line by running:
```bash
  $ gcloud app logs tail -s default
```
To view your application in the web browser run:
```bash
  $ gcloud app browse
 ```
