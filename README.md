# Rails on docker-compose and Kubernetes (GKE)

`docker-compose up`

This is a demo app for showcasing a Rails 5 application running on docker-compose in development and Kubernetes on GKE in production.


Read Part I: Rails on docker-compose [here](https://medium.com/@jbielick/rails-on-docker-compose-7e2cf235fa0e).

Read Part II: Rails on Kubernetes [here](https://medium.com/@jbielick/rails-on-kubernetes-8cd4940eacbe)

---

# 変更点

## 解説
[GKEに Rails \+ nginx\(\+Phusion Passenger \) \+ CloudSQL を利用したアプリをデプロイする \- Qiita](http://qiita.com/NaokiIshimura/items/e05a32f79ed202c21ba4)

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
url: postgres://<%= ENV['MYSQL_USER'] %>:<%= ENV['MYSQL_PASSWORD'] %>@<%= ENV['MYSQL_SERVICE_HOST'] %>/test_db
```

## Userモデルを追加

```
$ rails g scaffold User name:string age:integer
$ rake db:migrate
```

## ルーティングを修正

config/routing.rb

```
get 'application/home'
root 'users#index'
```

## Gemfileを書き換え

Gemfile

```
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'tzinfo-data'
```

```
$ rm Gemfile.lock
$ bundle install
```

## yamlファイルを追加

- kube/all.yml
- kube/deploy+service.yml
