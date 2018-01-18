class ShowTimesController < ApplicationController
  def index
    respond_to do |format|
      @show_times = ShowTime.all
      format.html { render html: { show_times: @show_times }, status: :ok }
      format.json { render json: { show_times: @show_times }, status: :ok }
    end
  end

  def create
    respond_to do |format|
      begin
        @show_time = ShowTime.new(show_time_params)
        if @show_time.save
          format.json { render json: { show_time: @show_time }, status: :ok }
          format.html { render html: { show_time: @show_time }, status: :ok }
        else
          format.html { render html: { show_time: @show_time.errors }, status: :unprocessable_entity }
          format.json { render json: { show_time: @show_time.errors }, status: :unprocessable_entity }
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
        @show_time = ShowTime.find(params[:id])
        format.html { render html: { show_time: @show_time }, status: :ok }
        format.json { render json: { show_time: @show_time }, status: :ok }
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @show_time = ShowTime.find(params[:id])
        if @show_time.update(show_time_params)
          format.html { render html: { show_time: @show_time }, status: :ok }
          format.json { render json: { show_time: @show_time }, status: :ok }
        else
          format.html { render html: { show_time: @show_time.errors }, status: :unprocessable_entity }
          format.json { render json: { show_time: @show_time.errors }, status: :unprocessable_entity }
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
        @show_time = ShowTime.find(params[:id])
        @show_time.destroy
        format.json { render json: { mesage: 'Deleted!' }, status: :ok }
        format.html { render html: { mesage: 'Deleted!' }, status: :ok }
      rescue StandardError => e
        format.html { render html: { message: e.message }, status: :unprocessable_entity }
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def show_time_params
    params.require(:show_time).permit(:movie_time, :movie_id)
  end
end
