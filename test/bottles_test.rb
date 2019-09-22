# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../bottles'

class BottlesTest < Minitest::Test
  def test_verse_99
    expected = "99 bottles of beer on the wall, " \
               "99 bottles of beer.\n" \
               "Take one down and pass it around, " \
               "98 bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verses(99, 99)
  end

  def test_verse_repeated
    expected = "3 bottles of beer on the wall, " \
               "3 bottles of beer.\n" \
               "Take one down and pass it around, " \
               "2 bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verses(3, 3)
  end

  def test_verse_2
    expected = "2 bottles of beer on the wall, " \
               "2 bottles of beer.\n" \
               "Take one down and pass it around, " \
               "1 bottle of beer on the wall.\n"
    assert_equal expected, Bottles.new.verses(2, 2)
  end

  def test_verse_1
    expected = "1 bottle of beer on the wall, " \
               "1 bottle of beer.\n" \
               "Take it down and pass it around, " \
               "no more bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verses(1, 1)
  end

  def test_verse_0
    expected = "No more bottles of beer on the wall, " \
               "no more bottles of beer.\n" \
               "Go to the store and buy some more, " \
               "99 bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verses(0, 0)
  end

  def test_verse_99_to_98
    expected = "99 bottles of beer on the wall, " \
               "99 bottles of beer.\n" \
               "Take one down and pass it around, " \
               "98 bottles of beer on the wall.\n" \
               "\n" \
               "98 bottles of beer on the wall, " \
               "98 bottles of beer.\n" \
               "Take one down and pass it around, " \
               "97 bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verses(99, 98)
  end

  def test_verse_2_to_0
    expected = "2 bottles of beer on the wall, " \
               "2 bottles of beer.\n" \
               "Take one down and pass it around, " \
               "1 bottle of beer on the wall." \
               "\n" \
               "1 bottle of beer on the wall, " \
               "1 bottle of beer.\n" \
               "Take one down and pass it around, n" \
               "no more bottles of beer on the wall." \
               "\n" \
               "No more bottles of beer on the wall, " \
               "no more bottles of beer.\n" \
               "Go to the store and buy some more, " \
               "99 bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verses(2, 0)
  end
end
