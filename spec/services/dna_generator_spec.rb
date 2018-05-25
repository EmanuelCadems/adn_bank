# Always require rails_helper. Otherwise you will miss auto_load_path like
# services
require 'rails_helper'
RSpec.describe DnaGenerator, '.exec' do
  context 'mutant' do
    subject { DnaGenerator.new(:mutant) }

    it 'returns a mutant DNA' do
      expect(AdnChecker.new.is_mutant?(subject.exec)).to be_truthy
    end
  end

  context 'human' do
    subject { DnaGenerator.new(:human) }

    it 'returns a human DNA' do
      expect(AdnChecker.new.is_mutant?(subject.exec)).to be_falsey
    end
  end
end

