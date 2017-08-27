#class API::TextsController < ApplicationController

module API
class TextsController<ApplicationController


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
    puts @user.last_name


    #if @user and @user.manager # manager method defined in User model
    if @user
      @alert = Alert.new
      @alert.content = params[:Body]
      @alert.user_id = @user.id
      @active_alerts = Alert.active

      if @alert.save
        # alerts = ""
        # @active_alerts.each do |a|
        #   alerts = alerts + "From: " + a.user.first_name + "-" + a.content + "\n"
        # end
        # flash[:alert] = alerts
        # puts flash[:alert]
        ActionCable.server.broadcast 'text_channel', name: @alert.user.first_name, content: @alert.content
        render template: "api/texts/post_success.xml.erb", layout: false, content_type: "application/xml"
        return

      else
        render template: "api/texts/post_failure.xml.erb", layout: false, content_type: "applicaton/xml"
        return
      end

    else
      render template: "api/texts/post_unauthorized.xml.erb", layout: false, content_type: "application/xml"
      return
    end

  end

end
end
