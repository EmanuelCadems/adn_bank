require 'rails_helper'

RSpec.describe MutantJob, type: :job do
  describe '.perform' do
    let(:dna) { ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG'] }

    it 'persist the mutant' do
      subject.perform(dna)
      expect(Mutant.last.dna).to eq(dna)
    end
  end
end
