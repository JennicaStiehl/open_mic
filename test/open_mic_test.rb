require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/joke'
require './lib/user'
require './lib/open_mic'

class OpenMicTest < Minitest::Test

  def test_it_exits
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_instance_of OpenMic, open_mic
    # => #<OpenMic:0x00007fe8fd9f5e00...>
  end

  def test_it_has_attributes
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_equal "Comedy Works", open_mic.location
    assert_equal "11-20-18", open_mic.date
  end

  def test_it_can_have_performers
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_equal [], open_mic.performers
  end

  def test_it_can_welcome_performers
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    assert_equal [sal, ali], open_mic.performers
    # => [#<User:0x00007fe8fda12a00...>, #<User:0x00007fe8ff0dddc0...>]
  end

  def test_it_can_check_for_repeated_jokes
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    ali.learn(joke_1)
    ali.learn(joke_2)
    assert_equal false, open_mic.repeated_jokes?
    # => false
  end

  def test_it
    skip

    ali.tell(sal, joke_1)

    open_mic.repeated_jokes?
    # => true
  end
end
