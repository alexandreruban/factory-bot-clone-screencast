# frozen_string_literal: true

require "test_helper"

class TestTinyFactory < Minitest::Test
  def setup
    TinyFactory.define :user do
      first_name { "Alexandre" }
      last_name { "Ruban" }
      email { "#{first_name}.#{last_name}@email.com".downcase }
    end
  end

  def test_attributes_for
    attributes = attributes_for :user

    assert_equal "Alexandre", attributes[:first_name]
    assert_equal "Ruban", attributes[:last_name]
    assert_equal "alexandre.ruban@email.com", attributes[:email]

    assert_kind_of Hash, attributes
  end

  def test_build
    user = build :user

    assert_equal "Alexandre", user.first_name
    assert_equal "Ruban", user.last_name
    assert_equal "alexandre.ruban@email.com", user.email

    assert_kind_of User, user
    assert user.new_record?
  end

  def test_create
    user = create :user

    assert_equal "Alexandre", user.first_name
    assert_equal "Ruban", user.last_name
    assert_equal "alexandre.ruban@email.com", user.email

    assert_kind_of User, user
    assert user.persisted?
  end
end
