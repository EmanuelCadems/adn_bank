require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "V3::Stats", prefix: '/v3' do
  header "Content-Type", "application/json"

  explanation 'Level 3: Statistics DNAs. Counts of human and mutant DNA and
               ratio'
  before do
    create_list(:human, 10)
    create_list(:mutant, 2)
  end

  get '/v3/stats' do
    example_request 'get stats' do
      expect(response_status).to eq(200)
      # expect(json(response_body))
      #   .to eq({ count_mutant_dna: 2, count_human_dna: 10, ratio: 0.2 })
    end
  end
end

