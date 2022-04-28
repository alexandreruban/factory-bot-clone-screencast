require "test_helper"

class FactoryTest < Minitest::Test
  def setup
    @factory = TinyFactory.define :user do
      first_name { "Alexandre" }
      last_name { "Ruban" }
      email { "#{first_name}.#{last_name}@email.com".downcase }
    end
  end

  def test_has_attributes
    assert_equal 3, @factory.attributes.length
  end

  def test_has_name
    assert_equal :user, @factory.name
  end
end
