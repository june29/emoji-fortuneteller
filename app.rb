Bundler.require(:default)

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
end

today = Date.today
stars = %w[おひつじ おうし ふたご かに しし おとめ てんびん さそり いて やぎ みずがめ うお]

fortune = stars.map { |star| "%s : %s座" % [Unicode::Emoji.list.values.map(&:values).flatten.sample, star] }.join("\n")
text = "📅%d年%d月%d日のEmoji十二星座占い🔮\n\n%s" % [today.year, today.month, today.day, fortune]

puts text
client.update(text)
