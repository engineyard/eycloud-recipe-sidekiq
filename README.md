# Sidekiq recipe for EY Cloud

Sidekiq is a Redis-backed Ruby library for creating background jobs, placing those jobs on multiple queues, and processing them later.

## Installation

Add the following to `main/recipes/default.rb` in your cookbooks:

```ruby
require_recipe "sidekiq"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT LICENSE