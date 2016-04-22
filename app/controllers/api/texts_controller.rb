class API::TextsController < ApplicationController
skip_before_action :verify_authenticity_token


#
#  Nd strong parameters
#
before_action :set_access_control_headers

  def set_access_control_headers

    headers['Access-Control-Allow-Origin'] = '*'

    headers['Access-Control-Alow-Methods'] = 'POST, GET, OPTIONS'

    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def preflight
    head 200
  end

def create
  puts "params From #{params[:From]}"
  #raise params[:From].inspect

  @cell = params[:From].slice!(-10, 10)
  puts @cell
  # begin

  @user = User.find_by(cell: @cell)
  # if @user.nil?
  #   render plain: 'You are not authoried to post a note at cabl.'
  #   return
    # end
  # rescue
  #   # ...respond with unauthorized
  # end

  if @user and @user.current_team
    @note = Note.new
    @note.content = params[:Body]
    @note.user_id = @user.id
    @note.team_id = @user.current_team.id

    if @note.save
    # send back some confirmation text to the sender,
    #  "Your note is posted"
      #render plain: 'Your note is posted!'
      render template: "api/texts/post_success.xml.erb", layout: false, content_type: "application/xml"

      #
      #  render template yyyyyyy layout: false, content_type: "appication/xml"
      #
      return
    else
    # send back a error message, "Your note didn't make it"
      #render plain:  "Your note didn't make it!"
      render template: "api/texts/post_failure.xml.erb", layout: false, content_type: "applicaton/xml"
      return
    end
  else
    #render plain:  "You are not authorized to post a note to cabl."
    render template: "api/texts/post_unauthorized.xml.erb", layout: false, content_type: "application/xml"
    return
  end
end


end
