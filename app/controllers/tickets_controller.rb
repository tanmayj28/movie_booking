class TicketsController < ApplicationController
  def index
    respond_to do |format|
      @tickets = Ticket.all
      format.json { render json: { tickets: @tickets }, status: :ok }
      format.html { render html: { tickets: @tickets }, status: :ok }
    end
  end

  def create
    respond_to do |format|
      begin
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
          format.json { render json: { ticket: @ticket }, status: :ok }
          format.html { render html: { ticket: @ticket }, status: :ok }
        else
          format.html { render html: { ticket: @ticket.errors }, status: :unprocessable_entity }
          format.json { render json: { ticket: @ticket.errors }, status: :unprocessable_entity }
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
        @ticket = Ticket.find(params[:id])
        format.html { render html: { ticket: @ticket }, status: :ok }
        format.json { render json: { ticket: @ticket }, status: :ok }
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @ticket = Ticket.find(params[:id])
        if @ticket.update(ticket_params)
          format.html { render html: { ticket: @ticket }, status: :ok }
          format.json { render json: { ticket: @ticket }, status: :ok }
        else
          format.html { render html: { ticket: @ticket.errors }, status: :unprocessable_entity }
          format.json { render json: { ticket: @ticket.errors }, status: :unprocessable_entity }
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
        @ticket = Ticket.find(params[:id])
        @ticket.destroy
        format.html { render html: { mesage: 'Deleted!' }, status: :ok }
        format.json { render json: { mesage: 'Deleted!' }, status: :ok }
      rescue StandardError => e
        format.html { render html: { message: e.message }, status: :unprocessable_entity }
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:seat, :show_time_id, :movie_id, :audi_screen_id, :customer_id)
  end
end
