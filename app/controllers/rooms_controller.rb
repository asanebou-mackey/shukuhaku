class RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduce, :price, :address, :image, :user_id))
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to room_path(@room.id) #("/rooms/#{@room.id}")でもOK
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

end
