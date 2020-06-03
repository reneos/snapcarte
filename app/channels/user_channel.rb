class UserChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:id])
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

  # OrderChannel.broadcast_to(
  #   @order,
  #   render_to_string(partial: "notification", locals: { notification:  })
  # )
