require_relative './microverse_twitterati/retweet'

module MicroverseTwitterati
  def self.run!
    Retweet.new
  end
end
