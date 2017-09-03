class WelcomeController < ApplicationController
  def index

    #welcome#index view calls standings partial--which contains the index functionality embedded at the begining.  This is done because the standings partial is used throughout the site.
    flash[:notice] = "Welcome.  This is a demo site. Anyone can use with the pre-built mock registration.  Just hit 'Sign In' and follow the prompts.  Your personal stuff is not needed (or wanted)."
  end

  def about
  end
end
