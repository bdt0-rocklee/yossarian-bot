#  -*- coding: utf-8 -*-
#  hastebin.rb
#  Author: William Woodruff
#  ------------------------
#  A Cinch plugin that provides Hastebin interaction to yossarian-bot.
#  ------------------------
#  This code is licensed by William Woodruff under the MIT License.
#  http://opensource.org/licenses/MIT

require 'haste'

require_relative 'yossarian_plugin'

class Hastebin < YossarianPlugin
	include Cinch::Plugin

	def usage
		'!hb <data> - Post data to Hastebin. Aliases: !haste, !hastebin.'
	end

	def match?(cmd)
		cmd =~ /^(!)?(hb)|(haste)|(hastebin)$/
	end

	match /hb (.+)/, method: :hastebin
	match /haste(?:bin)? (.+)/, method: :hastebin

	def hastebin(m, data)
		haste = Haste::Uploader.new
		key = haste.upload_raw data
		
		m.reply "http://hastebin.com/#{key}", true
	end
end