class WelcomesController < ApplicationController
  def home
    @name = params[:name]
  end
end
