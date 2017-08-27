class TextChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'text_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
