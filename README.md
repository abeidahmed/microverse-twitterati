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

## Necessary requirements
In order to use the app, you need to sign up for the developer account
on twitter. Get all the `tokens`, `keys` and paste it as shown below:


Create a `.env` file on the root directory and paste the keys as shown
below:
```json
TWITTER_API_KEY=YOUR_KEY
TWITTER_SECRET_KEY=YOUR_SECRET
TWITTER_ACCESS_TOKEN=YOUR_ACCESS_TOKEN
TWITTER_TOKEN_SECRET=YOUR_TOKEN_SECRET
```

Please obtain all the above keys from
[here](https://developer.twitter.com). If you are a TSE reviewing the
project, please message me on Slack(Abeid Ahmed) to obtain the keys.

## Usage
- Clone the repo `https://github.com/abeidahmed/microverse-twitterati.git`
- `cd` into the directory
- Run `git checkout -b feature-retweet`
- Run `git pull origin feature-retweet`
- Run `bundle install`
- Make sure you add the keys before running the bot.
- Run `bin/main.rb` or run `rake bot`

## Test
- Run `bundle exec guard` to run the test automatically when the file
  changes.
- Make sure you add the keys with the help of the above instructions
  before you run the test. Otherwise it will fail.

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
Copyright 2021 Abeid Ahmed. Licensed under [MIT](https://opensource.org/licenses/MIT)

