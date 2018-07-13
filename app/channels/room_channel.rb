class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
    stop_all_streams
    stream_for data["room_id"]
  end
end
