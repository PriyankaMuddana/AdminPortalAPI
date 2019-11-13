# README

Steps necessary to get the application up and running.

Things you may want to cover:

* Ruby version - **2.5.1**, Rails Version - **5.1.7**

* Database - Mangodb(Make sure mongodb is install on your machine)

* System dependencies
  * **run:** `bundle install`

* Database creation
  * **Seed:** `rake db:seed` populate the database tables.

#### _Once server is started type below curl command into the terminal to login._
```curl
curl -H "Content-Type: application/json" -X POST -d '{"email":"test@user.com","password":"password"}' http://localhost:3000/authenticate
```
#### This will respond with a auth_token then to access the admin portal use the auth Token in the Headers to call API

eg:
```curl
curl -H "Authorization: <auth_token_from_login response>" http://localhost:3000/users
```

To Create a new user
```curl
curl -H "Authorization: <auth_token_from_login response>" -X POST -d '{"user": {"first_name": "John", "last_name": "Degree", "password": "password", "email": "johndegree@gmail.com"} }' http://localhost:3000/users
```

* All User & Tag model sorting & filtering fields can be done via index action of users & tags controllers  params to be used:

User index action params:

sort_by(for ordering fields): Valid values first_name, last_name, gender.

Filters:
	last_name: value
	first_name: value
	gender: male/female

Tag index action params:

order_by: Valid values are asc & desc

* Please run rake routes to know all the routes defination


