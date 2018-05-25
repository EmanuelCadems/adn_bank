class DnaGenerator
  def initialize(kind=:random)
    @kind = kind
  end

  def exec
    case @kind
    when :mutant
      generate_mutant_dna
    when :human
      generate_human_dna
    when :random
      generate_random_dna
    end

    @dna
  end

  private

  def generate_mutant_dna
    generate_random_dna
    @dna.sample[0..3] = AdnChecker::PATTERN_MATCHING.sample
  end

  def generate_human_dna
    generate_random_dna
    if AdnChecker.new.is_mutant?(@dna)
      @dna = ['ATGCGA', 'CAGTGC', 'TTATTT', 'AGACGG', 'GCGTCA', 'TCACTG']
    else
      @dna
    end
  end

  def generate_random_dna
    @size = (4..12).to_a.sample
    @dna = []
    @size.times do
      @dna << sequence
    end
  end

  def sequence
    valid_sequence = ''
    @size.times { valid_sequence += AdnChecker::VALID_STRINGS.sample }
    valid_sequence
  end
end
