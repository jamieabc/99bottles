# frozen_string_literal: true

# Bottle - for exercise
class Bottles
  def initialize; end

  def song
    verses(99, 0)
  end

  def verses(first, last)
    result = ''
    idx = first

    while idx >= last
      result << verse(idx)
      result << "\n" if idx != last
      idx -= 1
    end
    result
  end

  def verse(count)
    <<~POET
      #{capital_bottle(count)} of beer on the wall, #{bottle(count)} of beer.
      #{take(count)}, #{remain_bottle(count)} of beer on the wall.
    POET
  end

  def capital_bottle(count)
    bottle(count).capitalize
  end

  def bottle(count)
    return "#{count} bottles" if count > 1
    return '1 bottle' if count == 1

    'no more bottles'
  end

  def take(count)
    return 'Take one down and pass it around' if count > 1
    return 'Take it down and pass it around' if count == 1

    'Go to the store and buy some more'
  end

  def remain_bottle(count)
    return '99 bottles' if count.zero?

    bottle(count - 1)
  end
end