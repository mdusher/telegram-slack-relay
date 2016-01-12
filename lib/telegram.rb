#!/usr/bin/env ruby

require 'json'

class TelegramRelay
  attr_accessor :apikey, :slack, :running

  def initialize(apikey, slack_url)
    self.apikey = apikey
    self.slack = Slack.new(slack_url)
    self.running = false
  end

  def start
    raise StandardError "Telegram Relay already running" if self.running == true
    Telegram::Bot::Client.run(self.apikey) do |bot|
      bot.listen do |message|
        if (Time.now.to_i - message.date) < 120
          if !message.text.nil?
            payload = { 
              username: message.from.username + (message.chat.title.nil? ? "" : "@#{message.chat.title}") ,
              text: message.text
            }
            slack.send(payload.to_json)
          end
        end
      end
    end
  end
end

