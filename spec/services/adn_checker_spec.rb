# Always require rails_helper. Otherwise you will miss auto_load_path like
# services
require 'rails_helper'
RSpec.describe AdnChecker, '#is_mutant?' do
  context 'when it is mutant' do
    context 'horizontal, diagonal, and vertical matching' do
      #  ATGCGA
      #  CAGTGC
      #  TTATGT
      #  AGAAGG
      #  CCCCTA
      #  TCACTG
      let(:adn) do
        ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']
      end

      it 'returns true' do
        expect(subject.is_mutant?(adn)).to be_truthy
      end
    end
    context 'horizontal matching' do
      #  ATGCGA
      #  CCGTCC
      #  TTATGT
      #  AGAAGG
      #  CCCCTA
      #  TCACTG
      let(:adn) do
        ['ATGCGA','CCGTCC','TTATGT','AGAAGG','CCCCTA','TCACTG']
      end

      it 'returns true' do
        expect(subject.is_mutant?(adn)).to be_truthy
      end
    end
    context 'vertical matching' do
      #  ATGCGA
      #  CCGTGC
      #  TTATGT
      #  AGAAGG
      #  CGCCTA
      #  TCACTG
      let(:adn) do
        ['ATGCGA','CCGTGC','TTATGT','AGAAGG','CGCCTA','TCACTG']
      end

      it 'returns true' do
        expect(subject.is_mutant?(adn)).to be_truthy
      end
    end

    context 'diagonal matching' do
      #  ATGCGA
      #  CAGTGC
      #  TTATGT
      #  AGAACG
      #  ACCCTA
      #  TCACTG
      let(:adn) do
        ['ATGCGA','CAGTGC','TTATGT','AGAACG','ACCCTA','TCACTG']
      end

      it 'returns true' do
        expect(subject.is_mutant?(adn)).to be_truthy
      end
    end
  end

  context 'when it is human' do
    let(:adn) do
      ['ATGCGA', 'CAGTGC', 'TTATTT', 'AGACGG', 'GCGTCA', 'TCACTG']
    end

    it 'returns false' do
      expect(subject.is_mutant?(adn)).to be_falsey
    end
  end

  describe 'Validations' do
    describe '#square_matrix?' do
      context 'valid' do
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']
        end

        it 'returns true' do
          expect(subject.is_mutant?(adn)).to be_truthy
        end
      end

      context 'invalid' do
        # last elemente has 5 characters instead of 6
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACT']
        end

        it 'returns false' do
          expect(subject.is_mutant?(adn)).to be_falsey
        end
      end
    end

    describe '#at_least_4_characters?' do
      context 'valid' do
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']
        end

        it 'returns true' do
          expect(subject.is_mutant?(adn)).to be_truthy
        end
      end

      context 'invalid' do
        # last elemente has 5 characters instead of 6
        let(:adn) do
          ['AAA','CAG']
        end

        it 'returns false' do
          expect(subject.is_mutant?(adn)).to be_falsey
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
          expect(subject.is_mutant?(adn)).to be_truthy
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
          expect(subject.is_mutant?(adn)).to be_falsey
        end
      end
    end

    describe '#valid_characters?' do
      context 'valid (A,T,C,G)' do
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG']
        end

        it 'returns true' do
          expect(subject.is_mutant?(adn)).to be_truthy
        end
      end

      context 'invalid (some character different than A,T,C,G)' do
        # The last element cointains Z which is invalid
        let(:adn) do
          ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTZ']
        end

        it 'returns false' do
          expect(subject.is_mutant?(adn)).to be_falsey
        end
      end
    end
  end
end
