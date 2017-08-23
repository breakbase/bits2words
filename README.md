# Bits2words

Reversibly convert an integer ID to a set of words.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bits2words'
```

And then execute:

```
$ bundle
```

## Usage

```ruby
# Initialize an instance
b2w = Bits2words.new('secret')

# Convert the integer 1234567890 to a set of words. This would return
# "6-jumpy-bandicoots-explode-rapidly"
b2w.encode(1234567890)

# Convert the set of words back to an integer. This would return
# 1234567890
b2w.decode "6-jumpy-bandicoots-explode-rapidly"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will create
a git tag for the version, push git commits and tags, and push the
`.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/breakbase/bits2words. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected
to adhere to the [Contributor Covenant](http://contributor-covenant.org)
code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bits2words project’s codebases, issue
trackers, chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/[USERNAME]/bits2words/blob/master/CODE_OF_CONDUCT.md).
