#!/usr/bin/env ruby

require 'telegram/bot'
require_relative 'lib/slack.rb'
require_relative 'lib/telegram.rb'

slack_url = ENV["SLACK_URL"] 
telegram_apikey = ENV["TELEGRAM_APIKEY"]

raise ArgumentError if slack_url.nil? or telegram_apikey.nil?

relay = TelegramRelay.new(telegram_apikey, slack_url)
relay.start
