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
    if attempt_save(@customer)
      @order[:customer_id] = @customer.id
      if attempt_save(@order)
        on_order_save_success
      end
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
      params.require(:order).permit(:quantity, :cc_number, :cc_security_code, :cc_expiration, :showtime_id)
    end

    def set_showtime
      @showtime = Showtime.find_by(id: params[:showtime_id])
    end

    def attempt_save(object)
      return true if object.save

      @error_msgs = object.errors.full_messages
      render :new and return false
    end

    def on_order_save_success
      @order.showtime.decrease_available_tickets(@order.quantity)
      OrderMailer.order_confirmation(@order).deliver
      redirect_to(@order)
    end
end
