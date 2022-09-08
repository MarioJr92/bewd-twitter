json.tweets do
    json.username   @tweet.user.username
    json.message    @tweet.message
end