#!/usr/bin/env ruby
require 'rspec'
require_relative '../lib/uuid'

# helper function
def validate_uuid_format(uuid)
  uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
  return true if uuid_regex.match?(uuid.to_s.downcase)

  raise("Given argument is not a valid UUID: '#{uuid}'")
end

describe 'UUID behavior' do

  it 'when intilized :total eql 5' do
    uuid = UUID.new(:total=>5)
    expect(uuid.total).to eq(5)
  end
  it 'should :uuids should be array' do
    uuid = UUID.new(:total=>5)
    uuid.generate
    expect(uuid.uuids).to be_an(Array)
  end
  it 'should :uuids should be array of 10000' do
    uuid = UUID.new(:total=>10000)
    uuid.generate
    expect(uuid.uuids).to be_an(Array)
  end
  it 'should :uuids should be array of 100000' do
    uuid = UUID.new(:total=>100000)
    uuid.generate
    expect(uuid.uuids).to be_an(Array)
  end

  it 'should :uuids should be array of 1000000' do
    uuid = UUID.new(:total=>1000000)
    uuid.generate
    expect(uuid.uuids).to be_an(Array)
  end
  it "should return array off uuid's" do
    uuid = UUID.new(:total=>5)
    uuid.generate
    expect(validate_uuid_format(uuid.uuids[0])).to be true
  end

  it "should #save_to_file create csv file" do
    file = "./test.csv"
    uuid = UUID.new(:total=>3)
    uuid.generate
    uuid.save_to_file( :file_name => file )
    expect(File.exist?(file)).to be(true)
    if File.exist?(file)
      File.delete(file)
    end
  end
  it "should #save_to_file first line to be a UUID" do
    file = "./test.csv"
    uuid = UUID.new(:total=>3)
    uuid.generate
    uuid.save_to_file(:file_name => file)
    if File.exist?(file)
      CSV.foreach(file) do |row|
        puts row
        expect(validate_uuid_format(row[0])).to eq(true)
        break
      end
    end
  end
end