require 'rails_helper'

RSpec.describe HumanJob, type: :job do
  describe '.perform' do
    let(:dna) { ['ATGCGA', 'CAGTGC', 'TTATTT', 'AGACGG', 'GCGTCA', 'TCACTG'] }

    it 'persists the human' do
      subject.perform(dna)
      expect(Human.last.dna).to eq(dna)
    end
  end
end
