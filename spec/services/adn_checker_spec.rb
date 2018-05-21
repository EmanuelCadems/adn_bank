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
end
