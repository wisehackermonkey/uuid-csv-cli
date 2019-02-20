# this class generates and saves uuid's
# by oran c
# oranbusiness@gmail.com
# github.com/wisehackermonkey
# 20190219
#
require 'SecureRandom'
require 'csv'

class UUID
  attr_reader :total
  attr_accessor :uuids

  def initialize(total)
    @total = total
    @uuids = []
  end

  # generates a array with number of uuids specified by :total
  def generate
    self.total.times do
      self.uuids << SecureRandom.uuid
    end
    self.uuids
  end

  # save generated uuid's to a csv file
  def save_to_file(file_name)
    CSV.open(file_name, "wb") do |csv|
      self.uuids.each do |uuid|
        csv << [uuid]
      end
    end
  end
end