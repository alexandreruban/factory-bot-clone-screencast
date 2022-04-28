# Rebuilding `FactoryBot` screencast

In this screencast, we will build a `FactoryBot` clone. It won't have all the features, but it will look like early versions of `FactoryBot`!

The purpose of this screencast is to learn about:

- How to create a Ruby gem
- How to use Ruby `blocks` and `procs`
- How to use Ruby `instance_eval` and `method_missing` methods

## What we will build

In this video, we will build a `TinyFactory` gem that will pass those tests:

```rb
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
```

## Credits

This tutorial is inspired by the [factory_bot][] open-source gem developed by Thoughtbot. Check the code to see how the real `factory_bot` works!

[factory_bot]: https://github.com/thoughtbot/factory_bot
