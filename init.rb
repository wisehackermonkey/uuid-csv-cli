# uuid csv geneartor 
# by oran c
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190219


require 'optparse'

# This will hold the options we parse
options = {}

OptionParser.new do |parser|

  # Whenever we see -n or --name, with an
  # argument, save the argument.
  parser.on("-n", "--name NAME", "The name of the person to greet.") do |v|
    options[:name] = v
  end
end.parse!

# Now we can use the options hash however we like.
puts "Hello #{ options[:name] }" if options[:name]