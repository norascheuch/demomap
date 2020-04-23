var Twitter = require('twitter');

const twitterFeed = () => {
  const twitterButton = document.getElementById('pills-twitter')
  if (twitterButton) {
  console.log(process.env.CLOUDINARY_URL)
  }
  // if (twitterButton) {
  //   var twitterClient = new Twitter({
  //     consumer_key: process.env.TWITTER_CONSUMER_KEY,
  //     consumer_secret: process.env.TWITTER_CONSUMER_SECRET,
  //     access_token_key: process.env.TWITTER_ACCESS_TOKEN_KEY,
  //     access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET
  //   });



  //   twitterButton.addEventListener('click', () => {

  //   } )
}

export { twitterFeed };
