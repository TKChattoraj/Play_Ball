class API::TextsController < ApplicationController
skip_before_action :verify_authenticity_token


#
#  Nd strong parameters
#
before_filter :set_access_control_headers

  def set_access_control_headers

    headers['Access-Control-Allow-Origin'] = '*'

    headers['Access-Control-Alow-Methods'] = 'POST, GET, OPTIONS'

    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def preflight
    head 200
  end



@cell = params[:from].delete '+'
@user = User.find_by!(cell: @cell)

if current_user.current_team
  note = Note.new
  @note.content = params[:body]
  @note.user_id = @user.id.current_team.id

end

if @note.save
  # send back some confirmation text to the sender,
  #  "Your note is posted"
else
  # send back a error message, "Your note didn't make it"
end

end
