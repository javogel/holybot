

desc 'This task is called by the Heroku scheduler add-on'
task update_feed: :environment do
  puts 'tweting holyness...'
  Bot.tweet_random_holy
  puts 'done.'
end

# task send_reminders: :environment do
#   User.send_reminders
# end
