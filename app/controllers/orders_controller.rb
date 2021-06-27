class OrdersController < ApplicationController
  before_action :set_showtime

  def new
    redirect_to(root_path) if @showtime.nil? || @showtime.sold_out? || @showtime.date_time.past?

    @order = Order.new
    @customer = Customer.new
    @error_msgs = []
  end

  def create
    @customer = Customer.find_or_initialize_by(customer_params)
    @order = Order.new(order_params)
    if @customer.save && @order.save
      @order.showtime.decrease_available_tickets(@order.quantity)
      redirect_to(@order)
    else
      @error_msgs = @customer.errors.full_messages + @order.errors.full_messages
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :email)
    end

    def order_params
      params[:order][:showtime_id] = params[:showtime_id]
      params[:order][:customer_id] = @customer.id
      params.require(:order).permit(:quantity, :cc_number, :cc_security_code, :cc_expiration, :showtime_id, :customer_id)
    end

    def set_showtime
      @showtime = Showtime.find_by(id: params[:showtime_id])
    end
end
