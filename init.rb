# uuid csv geneartor 
# by oran c
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190219

require_relative 'lib/uuid'
# Testing uuid class

uuids = UUID.new(3)
p uuids.total

p UUID.new(1).generate
p UUID.new(10000).generate
uuids.generate
uuids.save_to_file("tester.csv")

large = UUID.new(10000)
large.generate
large.save_to_file("./test.csv")
