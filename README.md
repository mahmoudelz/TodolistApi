# Todolist-api

## Todo:
- [X] Initial Setup
- [X] Add gems
- [X] Setup testing
- [X] Add User
  - [X] Model
    - [X] Association
    - [X] Tests
  - [X] Migrations
  - [X] Routes
  - [X] Serializer
    - [X] Association
  - [X] Controller
    - [X] Tests
- [ ] Add Todolist
  - [X] Model
    - [X] Associations
    - [X] Tests
  - [X] Migrations
  - [X] Routes
  - [X] Serializer
    - [X] Association
  - [ ] Controller
    - [ ] Tests
- [] Add Tasks
  - [ ] Model
    - [ ] Associations
    - [ ] Tests
  - [ ] Migrations
  - [ ] Routes
  - [ ] Serializer
    - [ ] Association
  - [ ] Controller
    - [ ] Tests

## Commands

### Setup
```
$ rails new todolist-api --api --skip-action-mailer --skip-action-mailbox --skip-action-text --database=mysql
```

Add these gems to `Gemfile`
```rb
group :development, :test do
  # other gems
  gem 'rspec-rails'
  gem "factory_bot_rails"
end

# ... other gems

gem 'active_model_serializers', '~> 0.10.0'
gem 'ransack'
gem 'paranoia'
```
Install 
```
$ bundle install
$ rails generate rspec:install
$ rails db:create 
```

### Generate modesl, serializers & controllers

#### User
```
$ rails g Model user username:string
$ rails db:migrate
$ rails g serializer user
$ rails g controller Users
```

#### Todolist
```
$ rails g model Todolist title:string user:references
$ rails db:migrate
$ rails g serializer todolist
$ rails g controller Todolists
```