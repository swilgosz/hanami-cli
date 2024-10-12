# frozen_string_literal: true

RSpec.describe Hanami::CLI::Configuration do
  module DummyConfigTest
    extend Hanami::CLI::Configuration
  end

  let(:config) { Hanami::CLI.config }

  it 'is correct class' do
    expect(config).to eq(DummyConfigTest.config)
  end

  describe ".template_dir" do
    it 'returns correct default' do
      path = __dir__.gsub('/spec/unit/hanami/cli', '/lib/hanami/cli/generators')
      expect(config.template_dir).to eq(path)
    end
  end
end
