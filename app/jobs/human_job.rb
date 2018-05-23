class HumanJob < ApplicationJob
  queue_as :human

  def perform(dna)
    Human.create(dna: dna)
  end
end
