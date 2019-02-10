[![Gem Version](https://badge.fury.io/rb/rubocop-inflector.svg)](https://badge.fury.io/rb/rubocop-inflector)
[![Build Status](https://travis-ci.com/aeroastro/rubocop-inflector.svg?branch=master)](https://travis-ci.com/aeroastro/rubocop-inflector)

# RuboCop::Inflector

RuboCop extension to integrate ActiveSupport::Inflector and your custom rule.

This saves you from writing redundant `CustomTransform` and keep the concise and consistent rule over your project.

## Before Rubocop::Inflector

For example, `CustomTransform` config is exact-match, which results in redundant definitions.

```yaml
RSpec/FilePath:
  CustomTransform:
    PvP: pvp
    SyncPvP: sync_pvp
    AsyncPvP: async_pvp
    PvPOverPvP: pvp_over_pvp
    PvPController: pvp_controller
```

## After Rubocop::Inflector

All you have to do is define 1 concise rule. You can also share this rule with your application itself. (e.g. Rails)

```ruby
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'PvP'
end
```

## Installation

Just install the `rubocop-inflector` gem

```ruby
gem 'rubocop-inflector'
```

## Usage

You need to tell RuboCop to load the Inflector extension and your custom ActiveSupport::Inflector rule.
Custom rule file would be the followings. If you are using Rails, you can find it under `config` directory.

### Custom ActiveSupport::Inflector rule

```ruby
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'criterion', 'criteria'
  inflect.acronym 'RuboCop'
end
```

https://api.rubyonrails.org/classes/ActiveSupport/Inflector/Inflections.html

There are three ways (configuration, command, and rake) to load these, but we recommend configuration file.

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```yaml
require:
  - rubocop-rspec # If you are using rubocop-rspec, this should come first.
  - rubocop-inflector
  - ./config/initializers/inflections # Your custom rule file
```

Now you can run `rubocop` and it will automatically integrate ActiveSupport Integration

## Supported Cops and Logics

Following cops and logics are now supported.

* `RSpec/FilePath`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aeroastro/rubocop-inflector. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RuboCop::Inflector project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aeroastro/rubocop-inflector/blob/master/CODE_OF_CONDUCT.md).
