# uuid csv geneartor 
# by oran c
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190219

require_relative 'lib/uuid'
require_relative 'lib/cli'
# p ARGV.inspect
cli = Cli.new
cli.parse_arguments
p cli.options