class ReservationsController < ApplicationController
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    @reservation = Reservation.new
    @reservation.guest = Guest.new
    @allocation = Allocation.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
    @allocation = Allocation.where("reservation_id = ?", @reservation.id).first
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(params[:reservation])
    #NOTE - this is a hacky method jm 180812
    room_alias = params[:allocation][:room]
    room = Room.where("alias = ?", room_alias).first
    room_typef = RoomType.find(params[:allocation][:room_type])
    @allocation = Allocation.new
    @allocation.room = room
    @allocation.room_type = room_typef

    respond_to do |format|
      if @reservation.save
        @allocation.reservation = @reservation
        @allocation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        puts('res errors')
        @reservation.errors.each do |error|
          puts(error.to_s)
        end
        format.html { render action: "new" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  def arrivals 
    params[:date]? date = params[:date] : date = Time.now
    @reservations = Reservation.reservations_list_by_date(date)
  end

end
