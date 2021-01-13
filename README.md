# Microverse Twitterati

> Retweeting tweets that are tagged with #microverse.

## Description
This project was done as a part of the `ruby` capstone
project. It is a command line bot that when run, iterates through the
tweets that are hash tagged with `#microverse` and retweets them in
order.

## Features
### Optimizations
- Since the twitter api does rate limiting, I had to be cautious when
requesting for the tweets. It seems that, when I request for more than
100 tweets at once, the api crashes. So a rate limiting of 50 is done in
this project, which I believe is pretty reasonable.

### Blocking users
- I wanted an app which is usable in real world scenarios, and wanted to
  build it not just for the sake of completing the project. So here we
go. Blocking users is possible.
- If the user is blocked, their tweets won't get retweeted. As simple as
  that. Unblocking the user will retweet their tweet, but will avoid
retweeting the previous tweets since the user was blocked.
- This feature had to optimized because of twitter's rate limiting. For
  example, if the block list is 5000, we cannot request the `api` 5000
times, everytime we try to run the app. So I had to store the blocked
users in a `yml` file and check if the user is blocked or not from the file
itself. By making this optimization, the bot ran within 3 seconds.

### Retweets
- Tweets that are tagged with `#microverse` are retweeted.
- Tweets are only fetched from the last retweeted tweet to optimize
  performance.

## Necessary requirements
In order to use the app, you need to sign up for the developer account
on twitter. Get all the `tokens`, `keys` and paste it as shown below:
```ruby
TWITTER_API_SETTINGS = {
  consumer_key: ENV['TWITTER_API_KEY'], # your twitter consumer key
  consumer_secret: ENV['TWITTER_SECRET_KEY'], # your consumer key
  access_token: ENV['TWITTER_ACCESS_TOKEN'], # your access token
  access_token_secret: ENV['TWITTER_TOKEN_SECRET'] # your token
}.freeze
```
Paste all the configurations in the `bin/main.rb` file.

## Usage
- Clone the repo `https://github.com/abeidahmed/microverse-twitterati.git`
- `cd` into the directory
- Run `git checkout -b feature-retweet`
- Run `git pull origin feature-retweet`
- Run `bin/main.rb`

## Test
- Run `bundle exec guard` to run the test automatically when the file
  changes.

## Author
👤 **abeidahmed**

- GitHub: [@abeidahmed](https://github.com/abeidahmed)
- Twitter: [@iamhawaabi](https://twitter.com/iamhawaabi)
- LinkedIn: [Abeid Ahmed](https://www.linkedin.com/in/abeid-ahmed-b21882172/)

## Contributing
Contributions are welcome, and any new features should be built in a
separate branch.

## Acknowledgements
To all the awesome `ruby` gems out there that have made our lives simple
and pain free.

## License
Copyright 2021 Abeid Ahmed. Licensed under MIT.

