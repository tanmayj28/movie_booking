class SeatTypesController < ApplicationController
  def index
    respond_to do |format|
      @seat_types = SeatType.all
      format.json { render json: { seat_types: @seat_types }, status: :ok }
      format.html { render html: { seat_types: @seat_types }, status: :ok }
    end
  end

  def create
    respond_to do |format|
      begin
        @seat_type = SeatType.new(seat_type_params)
        if @seat_type.save
          format.html { render html: { seat_type: @seat_type }, status: :ok }
          format.json { render json: { seat_type: @seat_type }, status: :ok }
        else
          format.html { render html: { seat_type: @seat_type.errors }, status: :unprocessable_entity }
          format.json { render json: { seat_type: @seat_type.errors }, status: :unprocessable_entity }
        end
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      begin
        @seat_type = SeatType.find(params[:id])
        format.html { render html: { seat_type: @seat_type }, status: :ok }
        format.json { render json: { seat_type: @seat_type }, status: :ok }
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @seat_type = SeatType.find(params[:id])
        if @seat_type.update(seat_type_params)
          format.html { render html: { seat_type: @seat_type }, status: :ok }
          format.json { render json: { seat_type: @seat_type }, status: :ok }
        else
          format.html { render html: { seat_type: @seat_type.errors }, status: :unprocessable_entity }
          format.json { render json: { seat_type: @seat_type.errors }, status: :unprocessable_entity }
        end
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @seat_type = SeatType.find(params[:id])
        @seat_type.destroy
        format.html { render html: { mesage: 'Deleted!' }, status: :ok }
        format.json { render json: { mesage: 'Deleted!' }, status: :ok }
      rescue StandardError => e
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
        format.html { render html: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def seat_type_params
    params.require(:seat_type).permit(:seat_class, :ticket_id)
  end
end
