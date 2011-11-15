# -*- encoding: utf-8 -*-

require_relative 'test_helper'

class TestUser < TestModel
  validates :name, blacklist: true
end

class TestUserWithMessage < TestModel
  validates :name, blacklist: { message: 'is not part of the whitelist' }
end

class TestBlacklistValidator < MiniTest::Unit::TestCase

  def test_some_blacklisted_words
    names_that_should_be_blacklisted.each do |name|
      test_user = TestUser.new(name: name)
      refute test_user.valid?
      assert test_user.errors[:name]
    end
  end

  def test_some_whitelisted_words
    names_that_should_be_whitelisted.each { |name| assert TestUser.new(name: name).valid? }
  end

  def test_default_message_on_error
    test_user = TestUser.new(name: "Get up, fuck up")
    refute test_user.valid?
    assert test_user.errors[:name].include?("is blacklisted")
  end

  def test_custom_message_on_error
    test_user = TestUserWithMessage.new(name: "Fuck it up")
    refute test_user.valid?
    assert test_user.errors[:name].include?("is not part of the whitelist")
  end

  #######################
  ### Private methods ###
  #######################

  private

  def names_that_should_be_blacklisted
    ["Fucking gay", "I have a boner", "Show me your ass"]
  end

  def names_that_should_be_whitelisted
    ["Alice in wonderland", "The Doors", "This is a simple name"]
  end

end
