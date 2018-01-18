class AudiScreensController < ApplicationController
  def index
    respond_to do |format|
      @audi_screens = AudiScreen.all
      format.json { render json: { audi_screens: @audi_screens }, status: :ok }
      format.html { render html: { audi_screens: @audi_screens }, status: :ok }
    end
  end

  def create
    respond_to do |format|
      begin
        @audi_screen = AudiScreen.new(audi_screen_params)
        if @audi_screen.save
          format.json { render json: { audi_screen: @audi_screen }, status: :ok }
          format.html { render html: { audi_screen: @audi_screen }, status: :ok }
        else
          format.json { render json: { audi_screen: @audi_screen.errors }, status: :unprocessable_entity }
          format.html { render html: { audi_screen: @audi_screen.errors }, status: :unprocessable_entity }
        end
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      begin
        @audi_screen = AudiScreen.find(params[:id])
        format.json { render json: { audi_screen: @audi_screen }, status: :ok }
        format.html { render html: { audi_screen: @audi_screen }, status: :ok }
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @audi_screen = AudiScreen.find(params[:id])
        if @audi_screen.update(audi_screen_params)
          format.json { render json: { audi_screen: @audi_screen }, status: :ok }
          format.html { render html: { audi_screens: @audi_screens }, status: :ok }
        else
          format.json { render json: { audi_screen: @audi_screen.errors }, status: :unprocessable_entity }
          format.html { render html: { audi_screen: @audi_screen.errors }, status: :unprocessable_entity }
        end
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @audi_screen = AudiScreen.find(params[:id])
        @audi_screen.destroy
        format.json { render json: { mesage: 'Deleted!' }, status: :ok }
        format.html { render html: { mesage: 'Deleted' }, status: :ok }        
      rescue StandardError => e
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
        format.html { render html: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def audi_screen_params
    params.require(:audi_screen).permit(:capacity, :movie_name, :booking_theatre_id, :show_time_id)
  end
end
