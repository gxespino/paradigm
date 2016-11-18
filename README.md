# Paradigm

Easily add Service abstractions into your Rails app with template generators

## Getting Started

Add the gem to your application Gemfile:

```ruby
gem 'paradigm'
```

Run `bundle install`

## Generators

### Services

```
rails g paradigm:service user_creation
```

Sets up a `app/services` directory with a `user_creation_service.rb` file. Also adds a `user_creation_service_test.rb` file in your test directory.


## Copyright and Licenses

Paradigm is copyright © 2016 Glenn Espinosa and released under the MIT license.
