class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user
    respond_to do |format|
      if @message.save
        # ActionCable.server.broadcast 'room_channel', message: @message
        format.html { redirect_to @room, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @room }
        format.js
      else
        format.html { redirect_to @room, alert: 'Review was not saved successfully.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
    redirect_to room_path(@room)
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    room = @message.room
    @message.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:user_id, :content)
  end
end
