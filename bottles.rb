# frozen_string_literal: true

class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, finish)
    start.downto(finish).map { |number| verse(number) }.join("\n")
  end

  private

  def verse(number)
    bottle_number = BottleNumber.new(number)
    next_bottle_number = BottleNumber.new(bottle_number.successor)

    "#{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall, " \
    "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" \
    "#{bottle_number.action}, " \
    "#{next_bottle_number.quantity} #{next_bottle_number.container} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def quantity
    return 'no more' if number.zero?

    number.to_s
  end

  def container
    return 'bottle' if number == 1

    'bottles'
  end

  def pronoun
    return 'it' if number == 1

    'one'
  end

  def action
    return 'Go to the store and buy some more' if number.zero?

    "Take #{pronoun} down and pass it around"
  end

  def successor
    return 99 if number.zero?

    number - 1
  end
end
