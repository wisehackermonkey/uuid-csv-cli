# this class creates cli (command line interface) for the uuid csv program
# by oran c
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190219
require 'optparse'

class Cli
  attr_reader :options

  def initialize
    @options = {}
  end

  # parse the command line arguments example
  # '-c 23 -f text.csv' = :count = 23 and :path = text.csv
  def parse_arguments
    OptionParser.new do |parser|
      # parser.banner = "Usage: init.rb -c <integer>"
      parser.on("-c", "--count COUNT", Integer, "Specify number of uuid's to generate") do |c|
        @options[:count] = c
      end
      parser.on("-f", "--file FILE", "Specify path to save csv file example -f '/path/to/file.csv'") do |path|
        @options[:path] = path
      end
    end.parse!
  end
end