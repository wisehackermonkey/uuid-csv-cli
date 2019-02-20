#!/usr/bin/env ruby
# uuid csv generator
# by oran c
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190219
# learn how to create cli programs
# https://blog.honeybadger.io/writing-command-line-apps-in-ruby/

require_relative 'lib/uuid'
require_relative 'lib/cli'

# allow for copying output to the clipboard
# https://www.rubydoc.info/gems/clipboard/1.3.3#Usage
require 'clipboard'

puts "UUID Generator By Oran C"
puts "-"*40
puts
# setup cli to get command line arguments
# example '-c 5 -f name_file.csv'
# and assign total_num_uuid = 5 and file = ame_file.csv

cli = Cli.new
cli.parse_arguments
total_num_uuid = cli.options[:count]
file = cli.options[:path]

# Specify the number of uuid's to be generated
uuid = UUID.new(:total => total_num_uuid )
# Create uuid's and save them to a csv file
uuid.generate
uuid.save_to_file(:file_name => file)

# Only print uuids to console if
# the user hasn't specified a filename
unless file
  # puts uuid.show
  Clipboard.copy(uuid.show)
end
puts "Copied UUID's to your clipboard"
puts "successfully generated ##{total_num_uuid} uuid's"
puts "Saved uuid's to file : #{file || 'output.csv'}"

# return 0 means success in linux
exit 0