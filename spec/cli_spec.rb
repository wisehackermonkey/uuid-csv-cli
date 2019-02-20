#!/usr/bin/env ruby
require 'rspec'
require_relative '../lib/cli'

describe 'My behaviour' do

  it 'given argument "-c 3" :option[:count] should be 3' do
    ARGV = ["-c", "3"]
    cli = Cli.new
    cli.parse_arguments
    expect(cli.options[:count]).to be(3)
    ARGV = []
  end

  it "given argment '-f ./file.csv' should  :option[:path] should be './file.csv' " do
    ARGV = ["-f", "./file.csv"]
    cli = Cli.new
    cli.parse_arguments
    expect(cli.options[:path]).to eq("./file.csv")
    ARGV = []
  end
end