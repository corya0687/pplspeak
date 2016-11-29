class ChatRoomsController < ApplicationController

  before_filter :set_chat_room, only: [ :show, :destroy, :update]

  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)

    if @chat_room.save
      flash[:success] = "Chat Room Created"
      redirect_to chat_rooms_path
    else
      render "new"
    end

  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find_by(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
