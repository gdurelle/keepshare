[![Build Status](https://travis-ci.org/gdurelle/keepshare.svg)](https://travis-ci.org/gdurelle/keepshare)

## Config

* Ruby version 2.2.0
* Rails version 4.2.1

* Run the app locally: <code>foreman start</code>
* Configuration: <code>bundle install</code>
* Database creation: <code>rake db:create</code>
* Database initialization: <code>rake db:migrate</code>
* Database seed: <code>rake db:seed</code>

* How to run the test suite: <code>guard</code>

* System dependencies
  * Postgres

## Usage

```curl http://localhost:5000```
=> _HTTP Basic: Access denied._

```curl -u guest@test.com:guest http://localhost:5000```
=> __

```curl -u guest@test.com:guest http://localhost:5000/lists```
