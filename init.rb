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

  parser.on("-h", "--help", "Show this help message") do ||
    puts parser
  end

  parser.on("-c","--count COUNT", Integer, "Repeat the message COUNT times") do |c|
    options[:count] = c
  end
end.parse!

# Now we can use the options hash however we like.
puts "Hello #{ options[:name] }" if options[:name]

if options[:name]
  options.fetch(:count, 1).times do
    puts "Hello #{options[:name]}"
  end
end