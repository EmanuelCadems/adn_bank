class MutantJob < ApplicationJob
  queue_as :mutant

  def perform(dna)
    Mutant.create(dna: dna)
  end
end
