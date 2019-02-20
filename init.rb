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
total_num_uuid = cli.options[:count]
file_path = cli.options[:path]
p total_num_uuid
p file_path
# uuid = UUID.new(total_num_uuid)
# uuid.generate
# uuid.save_to_file(file_path)