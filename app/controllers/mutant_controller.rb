class MutantController < ApplicationController
  def create
    if AdnChecker.new.is_mutant?(params[:dna])
      head 200
    else
      head 403
    end
  end
end
