require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "V2::Mutant", prefix: '/v2' do
  header "Content-Type", "application/json"

  explanation "Level 2: This will check if the adn is mutant or human"

  parameter :dna, 'DNA it is a square matrix from 4x4 to 12x12. Each element
                   can only contain zero or more of the valid characters:
                   (A,T,C,G)', required: true, 'Type': Array

  post "/v2/mutant" do
    let(:raw_post) { params.to_json }

    context 'when it is a mutant' do
      let(:dna) { ['ATGCGA','CAGTGC','TTATGT','AGAAGG','CCCCTA','TCACTG'] }

      example_request "Check if adn is mutant" do
        explanation "When the adn is mutant it will return 200"
        expect(response_status).to eq(200)
      end
    end

    context 'when it is human' do
      let(:dna) { ['ATGCGA', 'CAGTGC', 'TTATTT', 'AGACGG', 'GCGTCA', 'TCACTG'] }

      example_request "Check if adn is human" do
        explanation "When the adn is human it will return 403"
        expect(response_status).to eq(403)
      end
    end
  end
end
