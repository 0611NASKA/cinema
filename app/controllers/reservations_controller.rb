class ReservationsController < ApplicationController
  before_action :login_required

  def step0
    @tickets = Ticket.all
  end

  def step1
    @reservation = Reservation.find(params[:id])
    @quantity = 1
  end

  def create
    @reservation = Reservation.new(
      member_id: current_member.id, schedule_id: params[:schedule_id], confirm_time: DateTime.current, status: 0
    )
    render "step0"
  end
end
