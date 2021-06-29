class OrderMailer < ApplicationMailer
  helper :order

  def order_confirmation(order)
    @order = order
    mail(to: @order.customer.email,
         subject: "Tickets Order Confirmation for #{order.showtime.movie.name} - Marvelous Matinée Movies")
  end
end
