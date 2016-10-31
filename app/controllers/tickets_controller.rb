class TicketsController < ApplicationController
  before_action :set_event, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
  #	@ticket_types = TicketType.all
  end

  def new
  	@event = Event.find(params[:event_id])
  	@ticket = Ticket.new
  end

  def create
  	@ticket = Ticket.new ticket_params
  	if @ticket.save
  		flash[:success] = "ticket bought!"
  		redirect_to root_path
  	else
  		flash[:error] = "Cannot purchase ticket: #{@ticket.errors.full_messages.to_sentence}"
  		redirect_back fallback_location: root_path
  	end
  end

  def edit

  end

  def update #should make it that can't lower the ticket purchase beyond what's been already been purchased

  end

  #if you want to destroy, destroy the event

  private

  def set_event
   # @event = Event.find(params[:event_id])
  end

  def ticket_params
  	params.require(:ticket).permit(:ticket_type_id, :quantity)
  end

end
