class BookingTheatresController < ApplicationController
  def index
    respond_to do |format|
      @booking_theatres = BookingTheatre.all
      format.json { render json: { booking_theatres: @booking_theatres }, status: :ok }
      format.html { render html: { booking_theatres: @booking_theatres }, status: :ok }
    end
  end

  def create
    respond_to do |format|
      @booking_theatre = BookingTheatre.new(booking_theatre_params)
      if @booking_theatre.save
        format.json { render json: { booking_theatre: @booking_theatre }, status: :ok }
        format.html { render html: { booking_theatre: @booking_theatre }, status: :ok }
      else
        format.json { render json: { booking_theatre: @booking_theatre.errors }, status: :unprocessable_entity }
        format.html { render html: { booking_theatre: @booking_theatre.errors }, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      begin
        @booking_theatre = BookingTheatre.find(params[:id])
        format.html { render html: { booking_theatre: @booking_theatre }, status: :ok }
        format.json { render json: { booking_theatre: @booking_theatre }, status: :ok }
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
     @booking_theatre = BookingTheatre.find(params[:id])
      if @booking_theatre.update(booking_theatre_params)
        format.html { render html: { booking_theatre: @booking_theatre }, status: :ok }
        format.json { render json: { booking_theatre: @booking_theatre }, status: :ok }
      else
        format.html { render html: { booking_theatre: @booking_theatre.errors }, status: :unprocessable_entity }
        format.json { render json: { booking_theatre: @booking_theatre.errors }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @booking_theatre = BookingTheatre.find(params[:id])
        @booking_theatre.destroy
        format.html { render html: { mesage: 'Deleted!' }, status: :ok }
        format.json { render json: { mesage: 'Deleted!' }, status: :ok }
      rescue StandardError => e
        format.html { render html: { message: e.message }, status: :unprocessable_entity }
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def booking_theatre_params
    params.require(:booking_theatre).permit(:theatre_name, :address, :phone)
  end
end
