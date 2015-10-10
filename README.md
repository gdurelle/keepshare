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

You need a an account with email/password. (created through the ```db:seed``` task)

You need to pass Basic Auth credentials on each requests.

* Everyone can read anything.
* Users with user role can create, update and destroy its own lists.
* User with admin role can CRUD everything.

### GET requests

#### Profile / Root URL

* ```curl http://localhost:5000```

```zsh
HTTP Basic: Access denied.
```

* ```curl -u user@test.com:user http://localhost:5000```

```zsh
{"data":{"user":{"id":2,"email":"user@test.com","role":"user"}},"links":{"self":"http://localhost:5000/","lists":"http://localhost:5000/lists"},"meta":{"author":"Gregory Durelle"},"jsonapi":{"version":0.1,"links":{"specification":"http://jsonapi.org"},"description":"Each URI returns a JSON object. Each JSON object contains data and links to related resources.","usage":"To update or destroy an object, call its \"self\" URI with proper HTTP VERBS: PATCH or DELETE."}}
```

#### Lists

* ```curl -u user@test.com:user http://localhost:5000/lists```

```zsh
[{"data":{"id":1,"name":"My List","user_id":2,"created_at":"2015-10-06T18:00:21.672Z","updated_at":"2015-10-06T18:00:21.672Z"},"links":{"self":"http://127.0.0.1:3000/lists/1","items":"http://127.0.0.1:3000/lists/1/items"}}]
```
####

* ```curl -u user@test.com:guest http://localhost:5000/lists/1```

```zsh
{"data":{"list":{"data":{"id":1,"name":"My List","user_id":2,"created_at":"2015-10-06T18:00:21.672Z","updated_at":"2015-10-06T18:00:21.672Z"},"links":{"self":"http://127.0.0.1:3000/lists/1","items":"http://127.0.0.1:3000/lists/1/items"}},"items":[{"data":{"id":1,"content":"Lorem ipsum","list_id":1,"created_at":"2015-10-06T18:00:21.680Z","updated_at":"2015-10-06T18:00:21.680Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/1"}},{"data":{"id":2,"content":"dolor sit amet","list_id":1,"created_at":"2015-10-06T18:00:21.683Z","updated_at":"2015-10-06T18:00:21.683Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/2"}},{"data":{"id":3,"content":"consectur","list_id":1,"created_at":"2015-10-06T18:00:21.685Z","updated_at":"2015-10-06T18:00:21.685Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/3"}},{"data":{"id":4,"content":"bacon ipsum dolor sit amet","list_id":1,"created_at":"2015-10-08T21:26:11.828Z","updated_at":"2015-10-08T21:26:11.828Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/4"}}]}}
```

#### Items in a list

* ```curl -u user@test.com:user http://localhost:5000/lists/1/items```

```zsh
[{"data":{"id":1,"content":"Lorem ipsum","list_id":1,"created_at":"2015-10-06T18:00:21.680Z","updated_at":"2015-10-06T18:00:21.680Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/1"}},{"data":{"id":2,"content":"dolor sit amet","list_id":1,"created_at":"2015-10-06T18:00:21.683Z","updated_at":"2015-10-06T18:00:21.683Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/2"}},{"data":{"id":3,"content":"consectur","list_id":1,"created_at":"2015-10-06T18:00:21.685Z","updated_at":"2015-10-06T18:00:21.685Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/3"}},{"data":{"id":4,"content":"bacon ipsum dolor sit amet","list_id":1,"created_at":"2015-10-08T21:26:11.828Z","updated_at":"2015-10-08T21:26:11.828Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/4"}}]
```

#### Item

* ```curl -u user@test.com:user http://localhost:5000/lists/1/items/1```

```zsh
{"data":{"id":1,"content":"Lorem ipsum","list_id":1,"created_at":"2015-10-06T18:00:21.680Z","updated_at":"2015-10-06T18:00:21.680Z"},"links":{"self":"http://127.0.0.1:3000/lists/1/items/1"}}
```

### POST requests

#### Create an item

* ```curl -u user@test.com:user http://localhost:5000/lists/1/items -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"item": {"content": "bacon ipsum dolor sit amet"}}'```

```zsh
{"id":4,"content":"bacon ipsum dolor sit amet","list_id":1,"created_at":"2015-10-08T21:26:11.828Z","updated_at":"2015-10-08T21:26:11.828Z"}
```
### PATCH requests

#### Update an item

* ```curl -u user@test.com:user http://localhost:5000/lists/1/items/1 -H "Accept: application/json" -H "Content-type: application/json" -X PATCH -d '{"item": {"content": "zombie ipsum brain brain brain"}}'```

Should return a HTTP success code _(200)_

### DELETE requests

#### Destroy an item

* ```curl -u user@test.com:user http://localhost:5000/lists/1/items/1 -H "Accept: application/json" -H "Content-type: application/json" -X DELETE```

Should return an HTTP no_content code _(204)_
