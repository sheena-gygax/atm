# ATM

## Local Setup

## Prerequisites

| Description | Version |
|-----------|---------------|
|Ruby|2.7.2|
|Mysql|latest|

### Backend
```
bundle
rake db:create
rake db:migrate
rake db:migrate RAILS_ENV=test
```

### Frontend
```
npm install
```

## Run dev servers

### Rails server
```
bundle exec rails s
```

## Running Tests
```
For the rails tests run `rspec`
```
