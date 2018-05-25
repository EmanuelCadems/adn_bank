class Stats
  def initialize
    @mutants = Mutant.count
    @humans  = Human.count
  end

  def exec
    {
      count_mutant_dna: @mutants,
      count_human_dna: @humans,
      ratio: ratio
    }
  end

  private

  def ratio
    if (@humans.zero? || @humans.zero?)
      0
    else
      @mutants / @humans.to_f
    end
  end
end
