# Always require rails_helper. Otherwise you will miss auto_load_path like
# services
require 'rails_helper'
RSpec.describe Stats, '.exec' do
  context 'without mutant and human' do
    it 'returns zero mutants, humans, and ratio' do
      expect(subject.exec)
        .to eq({ count_mutant_dna: 0, count_human_dna: 0, ratio: 0 })
    end
  end
  context 'without mutant' do
    before do
      create_list(:human, 10)
    end

    it 'returns zero mutants and ratio' do
      expect(subject.exec)
        .to eq({ count_mutant_dna: 0, count_human_dna: 10, ratio: 0 })
    end
  end
  context 'without human' do
    before do
      create_list(:mutant, 10)
    end

    it 'returns zero mutants and ratio' do
      expect(subject.exec)
        .to eq({ count_mutant_dna: 10, count_human_dna: 0, ratio: 0 })
    end
  end
  context 'with human and mutant' do
    before do
      create_list(:human, 10)
      create_list(:mutant, 2)
    end

    it 'returns ratio greather than zero' do
      expect(subject.exec)
        .to eq({ count_mutant_dna: 2, count_human_dna: 10, ratio: 0.2 })
    end
  end
end

