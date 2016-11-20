[![Version](https://img.shields.io/badge/gem-v0.1.3-blue.svg)](https://rubygems.org/gems/paradigm)
[![Rating ](https://img.shields.io/badge/rating-100%2F5-brightgreen.svg)](https://rubygems.org/gems/paradigm)

# Paradigm: abstractions so good you'll cry

Easily add Service abstractions into your Rails app with template generators

## Getting Started

Add the gem to your application Gemfile:

```ruby
gem 'paradigm'
```

Run `bundle install`

Next, you need to run the generator:

```
rails generate paradigm:install
```

## Generators

### Services

#### Top level services

```
rails generate paradigm:service user_creation
```

Sets up a `app/services` directory with a `user_creation_service.rb` file. Also adds a `user_creation_service_test.rb` file in the `test/services` directory.

#### Nested services

```
rails generate paradigm:service account::user_creation
```

Sets up a `app/services/account` directory with a `user_creation_service.rb` file. Also adds a `user_creation_service_test.rb` file in the `test/services/account` directory.

## Copyright and Licenses

Paradigm is copyright © 2016 Glenn Espinosa and released under the MIT license.
