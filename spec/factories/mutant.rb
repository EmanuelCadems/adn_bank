FactoryBot.define do
  sequence(:dna) { DnaGenerator.new(:human).exec }
  factory :mutant do
    dna
  end
end
