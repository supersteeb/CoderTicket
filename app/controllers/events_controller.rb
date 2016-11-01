class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user, :only => [:new, :create, :edit, :update, :destroy, :publish]

  def index
    #@user = current_user # must figure out visitor's page... and rerouting due to nested routes
    if params[:search]
      @events = Event.search(params[:search]).order('name DESC')
    else
      @events = Event.all #where('starts_at > ?', Time.now)
      #@events = Event.published
    end
  end

  def show
    @user = current_user
  end

  def mine
    @user = current_user
    @events = Event.where('user_id = ?', @user.id)
  end


  def new
    @user = current_user
  	@event = Event.new
    @categories = Category.all
    @venues = Venue.all 
  end

  def create
    @user = current_user
    @event = Event.new(event_params)
    @categories = Category.all
    @venues = Venue.all 
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_path(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event}
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /events/:id/edit
  def edit
    #@user = User.find(params[:user_id])
    unless current_user.id == @event.user_id
      flash[:error] = 'You must be the creator to edit this event'
      redirect_to event_path(@event)
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html {redirect_to events_path, notice: 'Event was successfully updated.'}
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html {redirect_to events_path, notice: 'Event was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def publish
    @event = Event.find(params[:id])
    @event.published_at = Time.now
    if @event.save
      flash[:success] = 'Published successfully'
      redirect_to events_path
    else
      flash.now[:notice] = 'Published failed'
      redirect_to mine_events_path
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
  	params.require(:event).permit(:name, :user_id, :starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id)
  end

  def my_events
    @events = Event.where(user_id: current_user.id)
  end
  
end