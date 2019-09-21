# frozen_string_literal: true

# Bottles - 99 bottles lyrics
class Bottles
  def verse(number)
    "#{number} bottles of beer on the wall, " \
      "#{number} bottles of beer.\n" \
      'Take one down and pass it around, ' \
      "#{number - 1} #{pluralize(number)} of beer on the wall.\n"
  end

  def pluralize(number)
    "bottle#{'s' unless (number - 1) == 1}"
  end
end