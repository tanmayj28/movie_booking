class MoviesController < ApplicationController
  def index
    respond_to do |format|
      @movies = Movie.all
      format.json { render json: { movies: @movies }, status: :ok }
      format.html { render html: { movies: @movies }, status: :ok }
    end
  end

  def create
    respond_to do |format|
      begin
        @movie = Movie.new(movie_params)
        if @movie.save
          format.json { render json: { movie: @movie }, status: :ok }
          format.html { render html: { movie: @movie }, status: :ok }
        else
          format.html { render html: { movie: @movie.errors }, status: :unprocessable_entity }
          format.json { render json: { movie: @movie.errors }, status: :unprocessable_entity }
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
        @movie = Movie.find(params[:id])
        format.html { render html: { movie: @movie }, status: :ok }
        format.json { render json: { movie: @movie }, status: :ok }
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
          format.html { render html: { movie: @movie }, status: :ok }
          format.json { render json: { movie: @movie }, status: :ok }
        else
          format.html { render html: { movie: @movie.errors }, status: :unprocessable_entity }
          format.json { render json: { movie: @movie.errors }, status: :unprocessable_entity }
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
        @movie = Movie.find(params[:id])
        @movie.destroy
        format.html { render html: { mesage: 'Deleted!' }, status: :ok }
        format.json { render json: { mesage: 'Deleted!' }, status: :ok }
      rescue StandardError => e
        format.html { render html: { message: e.message }, status: :unprocessable_entity }
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :audi_no, :rating, :booking_theatre_id)
  end
end
