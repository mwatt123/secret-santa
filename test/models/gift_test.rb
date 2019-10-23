require 'test_helper'

class GiftTest < ActiveSupport::TestCase
  test 'validates presence of secret santa, recipient, and year' do
    refute Gift.new.valid?
    assert Gift.new(secret_santa: Santa.new, recipient: Santa.new, year: 2020).valid?
  end
end
