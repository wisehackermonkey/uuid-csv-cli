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
end