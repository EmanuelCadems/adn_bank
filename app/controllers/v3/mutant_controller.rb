module V3
  class MutantController < ApplicationController
    def create
      if AdnValidator.new.exec(params[:dna])
        if AdnChecker.new.is_mutant?(params[:dna])
          MutantJob.perform_later params[:dna]
          head 200
        else
          HumanJob.perform_later params[:dna]
          head 403
        end
      else
        head 403
      end
    end
  end
end
