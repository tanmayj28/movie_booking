class CustomersController < ApplicationController
  def index
    respond_to do |format|
      @customers = Customer.all
      format.json { render json: { customers: @customers }, status: :ok }
      format.html { render html: { customers: @customers }, status: :ok }
    end
  end

  def create
    respond_to do |format|
      begin
        @customer = Customer.new(customer_params)
        if @customer.save
          format.html { render html: { customer: @customer }, status: :ok }
          format.json { render json: { customer: @customer }, status: :ok }
        else
          format.html { render html: { customer: @customer.errors }, status: :unprocessable_entity }
          format.json { render json: { customer: @customer.errors }, status: :unprocessable_entity }
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
        @customer = Customer.find(params[:id])
        format.html { render html: { customer: @customer }, status: :ok }
        format.json { render json: { customer: @customer }, status: :ok }
      rescue StandardError => e
        format.html { render html: { error: e.message }, status: :unprocessable_entity }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
          format.html { render html: { customer: @customer }, status: :ok }
          format.json { render json: { customer: @customer }, status: :ok }
        else
          format.html { render html: { customer: @customer.errors }, status: :unprocessable_entity }
          format.json { render json: { customer: @customer.errors }, status: :unprocessable_entity }
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
        @customer = Customer.find(params[:id])
        @customer.destroy
        format.html { render html: { mesage: 'Deleted!' }, status: :ok }
        format.json { render json: { mesage: 'Deleted!' }, status: :ok }
      rescue StandardError => e
        format.html { render html: { message: e.message }, status: :unprocessable_entity }
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :age, :gender, :booking_theatre_id)
  end
end
