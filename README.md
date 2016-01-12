# Telegram to Slack One-way Relay

So, I needed (see "didn't need") a way of checking my Telegram group messages without opening up Telegram as we tried to shift my friend group to Slack. So I whipped up this to relay messages via a Telegram Bot to a Slack web hook.

You'll need to setup a Telegram bot using BotFather, disable privacy (/setprivacy to BotFather) and add it to your group chat. There is no safety switch for others talking to or adding this bot to their own group chat - but it will relay any messages sent to it to the default channel you specify for the webhook in Slack.

### Usage
```
git clone git@github.com:mdusher/telegram-slack-relay.git
cd telegram-slack-relay
bundle install
SLACK_URL="https://url.to.slack/webhook" TELEGRAM_APIKEY="telegram-bot-api-key" ruby relay.rb
```
