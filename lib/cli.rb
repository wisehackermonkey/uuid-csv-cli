# this class creates cli (comman line interface) for the uuid csv program
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

  def parse_arguments
    OptionParser.new do |parser|
      # parser.banner = "Usage: init.rb -c <integer>"
      parser.on("-c", "--count COUNT", Integer, "Specify number of uuid's to generate") do |c|
        @options[:count] = c
      end
    end.parse!
  end
end