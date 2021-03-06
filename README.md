# Microverse Twitterati

> Retweeting tweets that are tagged with #microverse.

## Video link
[Loom video](https://www.loom.com/share/c5abb51d0fba4ee6a38114c3751dca23)

## Description
This project was done as a part of the `ruby` capstone
project. It is a command line bot that when run, iterates through the
tweets that are hash tagged with `#microverse` and retweets them in
order. The bot can be found at [twitter](https://twitter.com/MicroverseB).
Please follow the bot if possible. Cheers!

## Built with
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white)

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
- This feature had to be optimized because of twitter's rate limiting. For
  example, if the block list is 5000, we cannot request the `api` 5000
times, everytime we try to run the app. So I had to store the blocked
users in a `yml` file and check if the user is blocked or not from the file
itself. By making this optimization, the bot ran within 3 seconds.

### Retweets
- Tweets that are tagged with `#microverse` are retweeted.
- Tweets are only fetched from the last retweeted tweet to optimize
  performance.

## Usage
- Clone the repo `https://github.com/abeidahmed/microverse-twitterati.git`
- `cd` into the directory
- Run `git checkout -b feature-retweet`
- Run `git pull origin feature-retweet`
- Run `bundle install`
- Make sure you get your `.env` files configured. The app will not work
  without it.
```json
TWITTER_API_KEY=your_api_key
TWITTER_SECRET_KEY=your_secret_key
TWITTER_BEARER_TOKEN=your_bearer_token
TWITTER_ACCESS_TOKEN=your_access_token
TWITTER_TOKEN_SECRET=your_token_secret
```
The keys can be found [here](https://developer.twitter.com)

After cloning the repo and setting up, please go to your twitter account
and tweet anything that you'd like, but please make sure to hashtag the
tweet with `#microverse`.
Then you can run the bot using the step:
- Run `bin/main.rb` or run `rake bot`
After that check out the tweets retweets section, it will automatically
be retweeted.


## Test
- Run `bundle exec guard` to run the test automatically when the file
  changes or run `bundle exec rspec` to run all the tests.

## Author
👤 **abeidahmed**

- GitHub: [@abeidahmed](https://github.com/abeidahmed)
- Twitter: [@iamhawaabi](https://twitter.com/iamhawaabi)
- LinkedIn: [Abeid Ahmed](https://www.linkedin.com/in/abeid-ahmed-b21882172/)

## Contributing
Contributions are welcome, and any new features should be built in a
separate branch.

## Acknowledgements
To all the awesome `ruby` gems out there that have made our lives
easier.

## License
Copyright 2021 Abeid Ahmed. Licensed under [MIT](https://opensource.org/licenses/MIT)

