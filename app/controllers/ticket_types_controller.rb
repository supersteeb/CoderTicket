class TicketTypesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    unless current_user.id == @event.user_id
      flash[:error] = 'You must be the creator to edit this event'
      redirect_to event_path(@event)
    end
  	@ticket_type = TicketType.new
  end

  def create
  	@ticket_type = TicketType.new(ticket_type_params)
  	if @ticket_type.save
  		flash[:success] = "ticket type created!"
  		redirect_to event_path(@event)
  	else
  		flash[:error] = "Cannot create ticket: #{@ticket_type.errors.full_messages.to_sentence}"
  		redirect_to root_path
  	end
  end

  def show
  end

  private

  def ticket_type_params
  	params.require(:ticket_type).permit(:name,:price,:max_quantity,:event_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
