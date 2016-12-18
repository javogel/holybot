
config = {
  consumer_key: ENV['consumer_key'],
  consumer_secret: ENV['consumer_secret'],
  access_token: ENV['access_token'],
  access_token_secret: ENV['access_secret'],
}

CLIENT = Twitter::REST::Client.new(config)
#
# STREAMING_CLIENT = Twitter::Streaming::Client.new do |config|
#   config.consumer_key = ENV['consumer_key']
#   config.consumer_secret = ENV['consumer_secret']
#   config.access_token = ENV['access_token']
#   config.access_token_secret = ENV['access_secret']
# end


Thread.new do
  loop do
    begin

      rClient = CLIENT
      sClient = Twitter::Streaming::Client.new(config)
      sClient.user do |object|
        if object.is_a? Twitter::Streaming::Event and object.name==:follow
          user = object.source
            rClient.create_direct_message user, "You, #{user.name}, are also holy! Holy @#{user.name}!"
            # rClient.update "You, #{user.name}, are also Holy! Holy @#{user.screen_name}!"
            puts "New follower : #{user.name}"
        end
      end

    rescue
      puts 'error occurred, sleeping for 5 seconds'
      sleep 5
    end
  end
end
