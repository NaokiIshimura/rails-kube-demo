# Rails on docker-compose and Kubernetes (GKE)

`docker-compose up`

This is a demo app for showcasing a Rails 5 application running on docker-compose in development and Kubernetes on GKE in production.


Read Part I: Rails on docker-compose [here](https://medium.com/@jbielick/rails-on-docker-compose-7e2cf235fa0e).

Read Part II: Rails on Kubernetes [here](https://medium.com/@jbielick/rails-on-kubernetes-8cd4940eacbe)

---

# 変更点

## SQLite, PostgreSQLを利用するように修正

config/database.yml

```
default: &default
  adapter: sqlite3
  pool: 5
  timeout: 5000

development:
 <<: *default
 database: db/development.sqlite3

test:
  <<: *default
  database: db/test.sqlite3

production:
  adapter: postgresql
  encoding: utf8
  database: test_db
  pool: 5
  host: <%= ENV['MYSQL_SERVICE_HOST'] %>
  username: <%= ENV['MYSQL_USER'] %>
  password: <%= ENV['MYSQL_PASSWORD'] %>
```

## Userモデルを追加

```
$ rails g scaffold User name:string age:integer
$ rake db:migrate
```

## ルーティングを修正

config/routing.rb

```
# root to: 'application#home'
root to: 'users#index'
```
