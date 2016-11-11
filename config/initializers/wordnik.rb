Wordnik.configure do |config|
  config.api_key = ENV['wordnik_api_key']              # required
  config.username = ENV['wordnik_username']                   # optional, but needed for user-related functions
  config.password = ENV['wordnik_password']               # optional, but needed for user-related functions
  config.response_format = 'json'             # defaults to json, but xml is also supported
  config.logger = Logger.new('/dev/null')     # defaults to Rails.logger or Logger.new(STDOUT). Set to Logger.new('/dev/null') to disable logging.
end
