module V3
  class StatsController < ApplicationController
    def index
      render json: Stats.new.exec, status: 200
    end
  end
end
