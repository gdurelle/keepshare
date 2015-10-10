[![Build Status](https://travis-ci.org/gdurelle/keepshare.svg)](https://travis-ci.org/gdurelle/keepshare)

Simple API to CRUD Lists and Items in a list.

## Config

* Ruby version 2.2.0
* Rails version 4.2.1
* Run the app locally: <code>foreman start</code>
* Configuration: <code>bundle install</code>
* Database creation: <code>rake db:create</code>
* Database initialization: <code>rake db:migrate</code>
* Database seed: <code>rake db:seed</code>
* How to run the test suite: <code>guard</code>

## Usage

You need a an account with email/password, checked through Basic Auth.
Everyone can read anything.
Users with user role can create, update and destroy its own lists.
User with admin role can CRUD everything.

### GET requests

#### Profile / Root URL

* ```curl http://localhost:5000```

```zsh
HTTP Basic: Access denied.
```

* ```curl -u guest@test.com:guest http://localhost:5000```

```zsh
{"data":{"user":{"id":2,"email":"user@test.com","role":"user"}},"links":{"lists":"http://0.0.0.0:5000/lists"}}
```

#### Lists

* ```curl -u guest@test.com:guest http://localhost:5000/lists```

```zsh
[{"id":1,"name":"My List","user_id":1,"created_at":"2015-10-06T18:00:21.672Z","updated_at":"2015-10-06T18:00:21.672Z"}]
```

#### Items in a list

* ```curl -u guest@test.com:guest http://localhost:5000/lists/1/items```

```zsh
[{"id":1,"content":"Lorem ipsum","list_id":1,"created_at":"2015-10-06T18:00:21.680Z","updated_at":"2015-10-06T18:00:21.680Z"},{"id":2,"content":"dolor sit amet","list_id":1,"created_at":"2015-10-06T18:00:21.683Z","updated_at":"2015-10-06T18:00:21.683Z"},{"id":3,"content":"consectur","list_id":1,"created_at":"2015-10-06T18:00:21.685Z","updated_at":"2015-10-06T18:00:21.685Z"}]
```

### POST requests

#### Create an item

* ```curl -u guest@test.com:guest http://localhost:5000/lists/1/items -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"item": {"content": "bacon ipsum dolor sit amet"}}'```

```zsh
{"id":4,"content":"bacon ipsum dolor sit amet","list_id":1,"created_at":"2015-10-08T21:26:11.828Z","updated_at":"2015-10-08T21:26:11.828Z"}
```
### PATCH requests

#### Update an item

### DELETE requests

#### Destroy an item

