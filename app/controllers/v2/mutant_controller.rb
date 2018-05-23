module V2
  class MutantController < ApplicationController
    def create
      if AdnValidator.new.exec(params[:dna]) &&
         AdnChecker.new.is_mutant?(params[:dna])
        head 200
      else
        head 403
      end
    end
  end
end
