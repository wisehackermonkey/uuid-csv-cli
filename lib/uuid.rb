# this class generates and saves uuid's
# by oran c
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190219
#
require 'securerandom'
require 'csv'

class UUID
  attr_reader :total
  attr_accessor :uuids

  def initialize(options = {})
    @total = options[:total] || 1
    @uuids = []
  end

# generates a array with number of uuids specified by :total
  def generate
    self.total.times do
      self.uuids << SecureRandom.uuid
    end
  end

# save generated uuid's to a csv file
  def save_to_file(options = {})
    file_name = options[:file_name] || 'output.csv'
    CSV.open(file_name, "wb") do |csv|
      self.uuids.each do |uuid|
        csv << [uuid]
      end
    end
  end

# print all uuid's generated to the console
# TODO
  def show
    self.uuids.inject do |memo, item|
      memo + "\n#{item}"
    end
  end

end