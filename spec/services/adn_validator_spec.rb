# Always require rails_helper. Otherwise you will miss auto_load_path like
# services
require 'rails_helper'
RSpec.describe AdnValidator, '#exec' do
  describe 'Validations' do
    describe '#square_matrix?' do
      context 'valid' do
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']
        end

        it 'returns true' do
          expect(subject.exec(adn)).to be_truthy
        end
      end

      context 'invalid' do
        # last elemente has 5 characters instead of 6
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACT']
        end

        it 'returns false' do
          expect(subject.exec(adn)).to be_falsey
        end
      end
    end

    describe '#at_least_4_characters?' do
      context 'valid' do
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']
        end

        it 'returns true' do
          expect(subject.exec(adn)).to be_truthy
        end
      end

      context 'invalid' do
        # last elemente has 5 characters instead of 6
        let(:adn) do
          ['AAA','CAG']
        end

        it 'returns false' do
          expect(subject.exec(adn)).to be_falsey
        end
      end
    end

    describe '#maximum_12_characters?' do
      context 'valid' do
        # 12 x 12
        let(:adn) do
          [
            'ATGCGAATGCGA',
            'CAGTGCCAGTGC',
            'TTATGTTTATGT',
            'AGAAGGAGAAGG',
            'CCCCTACCCCTA',
            'TCACTGTCACTG',
            'ATGCGAATGCGA',
            'CAGTGCCAGTGC',
            'TTATGTTTATGT',
            'AGAAGGAGAAGG',
            'CCCCTACCCCTA',
            'TCACTGTCACTG'
           ]
        end

        it 'returns true' do
          expect(subject.exec(adn)).to be_truthy
        end
      end

      context 'invalid' do
        # 13 x 13
        let(:adn) do
          [
            'ATGCGAATGCGAA',
            'CAGTGCCAGTGCA',
            'TTATGTTTATGTA',
            'AGAAGGAGAAGGA',
            'CCCCTACCCCTAA',
            'TCACTGTCACTGA',
            'ATGCGAATGCGAA',
            'CAGTGCCAGTGCA',
            'TTATGTTTATGTA',
            'AGAAGGAGAAGGA',
            'CCCCTACCCCTAA',
            'TCACTGTCACTGA',
            'TCACTGTCACTGA'
           ]
        end

        it 'returns false' do
          expect(subject.exec(adn)).to be_falsey
        end
      end
    end

    describe '#valid_characters?' do
      context 'valid (A,T,C,G)' do
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']
        end

        it 'returns true' do
          expect(subject.exec(adn)).to be_truthy
        end
      end

      context 'invalid (some character different than A,T,C,G)' do
        # The last element cointains Z which is invalid
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTZ']
        end

        it 'returns false' do
          expect(subject.exec(adn)).to be_falsey
        end
      end
    end
  end
end
