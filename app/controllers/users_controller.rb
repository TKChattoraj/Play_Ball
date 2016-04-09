class UsersController < ApplicationController

    def new
      @user = User.new
      @team = Team.new
    end

    def create
      @user = User.new
      @user.first_name = params[:user][:first_name]
      @user.last_name = params[:user][:last_name]
      @user.email = params[:user][:email]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]

      @user.save
      @roster = Roster.new
      @roster.user_id = @user.id
      @roster.team_id = params[:team][:id]
      @roster.manager = true


      if (@user.id && @roster.save)
        flash[:notice] = "Now Batting: #{@user.first_name}!"
        create_session(@user)
        redirect_to root_path
      else
        flash[:error] = "There was an error in creating this user. Please try again"
        render :new
      end


    end

    def show
      @user = User.find(params[:id])
      @posts = @user.posts.visible_to(current_user)
    end



end
