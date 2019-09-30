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
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " \
    "#{quantity(number)} #{container(number)} of beer.\n" \
    "#{action(number)}, " \
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  def quantity(number)
    return 'no more' if number.zero?

    number.to_s
  end

  def container(number)
    return 'bottle' if number == 1

    'bottles'
  end

  def pronoun(number)
    return 'it' if number == 1

    'one'
  end

  def action(number)
    return 'Go to the store and buy some more' if number.zero?

    "Take #{pronoun(number)} down and pass it around"
  end

  def successor(number)
    return 99 if number.zero?

    number - 1
  end
end