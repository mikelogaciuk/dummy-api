# frozen_string_literal: true

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'


class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App.new
  end

  def test_root_endpoint
    get '/'
    puts last_response.body
    assert_equal 200, last_response.status
  end
end
