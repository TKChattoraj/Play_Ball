class WelcomeController < ApplicationController
  def index
    @teams = Team.all

  end

  def about
  end
end
