class AdnValidator
  VALID_STRINGS    = %w(A T C G)
  PATTERN_MATCHING = VALID_STRINGS.collect {|str| str * 4}

  def exec(adn=[])
    valid?(adn)
  end

  private

  def valid?(adn)
    squared_matrix?(adn) && at_least_4_characters?(adn) &&
    maximum_12_characters?(adn) && valid_characters?(adn)
  end

  def squared_matrix?(adn)
    adn.all? { |i| i.length == adn.length }
  end

  def at_least_4_characters?(adn)
    adn.all? { |i| i.length >= 4 }
  end

  def maximum_12_characters?(adn)
    adn.all? { |i| i.length <= 12 }
  end

  def valid_characters?(adn)
    adn.all? { |i| i.gsub(/[ATCG]*/, '') == '' }
  end
end
