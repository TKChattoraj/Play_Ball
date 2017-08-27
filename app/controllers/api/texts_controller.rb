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

    @cell = params[:From].slice!(-10, 10)
    puts @cell

    # For real, we want the method to determine whether the phone texitng the message is from an authorized user--manager.  For demonstration, however, the @user is going to be designated as Sparky

    #@user = User.find_by(cell: @cell)
    @user = User.find_by(first_name: 'Sparky')



    #if @user and @user.manager # manager method defined in User model
    if @user
      @alert = Alert.new
      @alert.content = params[:Body]
      @alert.user_id = @user.id
      @active_alerts = Alert.active

      if @alert.save

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
