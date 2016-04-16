class UsersController < ApplicationController

    def new
      @user = User.new
      @roster = Roster.new
    end

    def create
      #raise params.inspect
      @user = User.new(user_params)
      # @user.first_name = params[:user][:first_name]
      # @user.last_name = params[:user][:last_name]
      # @user.email = params[:user][:email]
      # @user.password = params[:user][:password]
      # @user.password_confirmation = params[:user][:password_confirmation]

      @user.save
      # @roster = Roster.new  #need to think about nested strong parameters
      @roster = @user.rosters.new
      @roster.user_id = @user.id
      @roster.team_id = params[:user][:roster][:team_id]
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

    end


private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :cell)
end

def roster_params
  params.require(:user).permit({:roster =>[:team_id]} )
end



end
