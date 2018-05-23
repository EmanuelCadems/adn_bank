class AdnChecker
  VALID_STRINGS    = %w(A T C G)
  PATTERN_MATCHING = VALID_STRINGS.collect {|str| str * 4}

  def is_mutant?(adn=[])
    horizontal_matching(adn) || vertical_matching(adn) || diagonal_matching(adn)
  end

  private

  def horizontal_matching(adn)
    return true if adn.find {|x| match_word?(x) }

    return false
  end

  def vertical_matching(adn)
    adn.length.times.each do |i|
      return true if match_word?(adn.map { |row| row[i] }.join)
    end
    return false
  end

  def diagonal_matching(adn)
    arr_of_letters = adn.collect { |e| e.split('') }
    arr = arr_of_letters.diagonals.collect{ |i| i.join }
    horizontal_matching(arr)
  end


  def match_word?(word)
    PATTERN_MATCHING.each do |pattern|
      return true if word.include?(pattern)
    end

    false
  end
end
