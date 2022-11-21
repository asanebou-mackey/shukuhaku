class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  #def new
    #@reservation = Reservation.new
    #@room = Room.find(params[:reservation][:room_id])
  #end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start, :end, :number, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservation_path(@reservation.id)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @totaldays = (@reservation.end - @reservation.start).to_i
    @totalprice = @totaldays * @room.price * @reservation.number
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:start, :end, :number, :user_id, :room_id))
    @totaldays = (@reservation.end - @reservation.start).to_i
    @totalprice = @totaldays * @room.price * @reservation.number
  end

end
