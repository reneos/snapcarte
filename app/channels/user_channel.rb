class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

  # OrderChannel.broadcast_to(
  #   @order,
  #   render_to_string(partial: "notification", locals: { notification:  })
  # )
