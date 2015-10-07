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

### GET requests

```curl http://localhost:5000```

=> _HTTP Basic: Access denied._

```curl -u guest@test.com:guest http://localhost:5000```

=> _{"id":1,"email":"guest@test.com","role":"guest"}_

```curl -u guest@test.com:guest http://localhost:5000/lists```

=> _[{"id":1,"name":"My List","user_id":1,"created_at":"2015-10-06T18:00:21.672Z","updated_at":"2015-10-06T18:00:21.672Z"}]_

```curl -u guest@test.com:guest http://localhost:5000/lists/1/items```

=> _[{"id":1,"content":"Lorem ipsum","list_id":1,"created_at":"2015-10-06T18:00:21.680Z","updated_at":"2015-10-06T18:00:21.680Z"},{"id":2,"content":"dolor sit amet","list_id":1,"created_at":"2015-10-06T18:00:21.683Z","updated_at":"2015-10-06T18:00:21.683Z"},{"id":3,"content":"consectur","list_id":1,"created_at":"2015-10-06T18:00:21.685Z","updated_at":"2015-10-06T18:00:21.685Z"}]_

### POST requests
