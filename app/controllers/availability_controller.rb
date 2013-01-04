class AvailabilityController < ApplicationController

  layout false, :only => [:types, :rooms] 

  def show
    @start_date = Time.now.to_date
    @end_date = @start_date + 14.days
    @availability = Allocation.availability_by_type(@start_date, @end_date)
  end

  def types
    @start_date = params[:start_date].present? ? Date.strptime(params[:start_date], "%Y-%m-%d") : Time.now.to_date
    if @start_date < Time.now.to_date
      @start_date = Time.now.to_date
    end
    @end_date = params[:end_date].present? ? Date.strptime(params[:end_date], "%Y-%m-%d") : @start_date + 14.days 
    
    @availability = Allocation.availability_by_type(@start_date, @end_date)
    respond_to do |format|
    	format.html { render :partial => "types" }
    	#format.json
   	end	
  end

  def rooms
    redirect_to :types unless params[:type].present?

    @start_date = params[:start_date].present? ? Date.strptime(params[:start_date], "%Y-%m-%d") : Time.now.to_date
    @end_date = params[:end_date].present? ? Date.strptime(params[:end_date], "%Y-%m-%d") : @start_date + 14.days
    @room_type = params[:type]
    @rooms = Room.where("room_type_id = ?", @room_type)
    
    @availability = Allocation.availability_by_room(@start_date, @end_date, @room_type)
    respond_to do |format|
    	format.html { render :partial => "rooms" }
    	#format.json
   	end
  end

end
