class VenuesController < ApplicationController
  def new
  	@user = current_user
  	@venue = Venue.new
  end

  def create
  	@user = current_user
  	@venue = Venue.new(event_params)

  	respond_to do |format|
  	  if @venue.save
  	    format.html { redirect_to events_path, notice: 'Venue was successfully created.' }
  	    format.json { render :show, status: :created, location: @venue}
  	  else
  	    format.html { render :new }
  	    format.json { render json: @venue.errors, status: :unprocessable_entity }
  	  end
  	end
  end

  private

  def event_params
  	params.require(:venue).permit(:name, :full_address, :region_id)
  end
end
