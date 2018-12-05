require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test

  def test_it_exists
    sal = User.new("Sal")
    assert_instance_of User, sal
    # => #<User:0x00007fb71e1eb8d8...>
  end

  def test_it_has_attributes
    sal = User.new("Sal")
    assert_equal "Sal", sal.name
  # => "Sal"
  end

  def test_has_jokes
    sal = User.new("Sal")
    assert_equal [], sal.jokes
  end

  def test_it_can_learnm_jokes
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    # => #<Joke:0x00007fb71da169f0...>
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    # => #<Joke:0x00007fb71d8e0bd0...>
    sal.learn(joke_1)
    sal.learn(joke_2)
    assert_equal [joke_1, joke_2], sal.jokes
    # => [#<Joke:0x00007fb71da169f0...>, #<Joke:0x00007fb71d8e0bd0...>]
  end

end
