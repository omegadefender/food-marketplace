require 'securerandom'

class ChargesController < ApplicationController

    def new

    end

    def create
        @product = Product.find(params[:product_id])

        customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
            :source  => params[:stripeToken]
        )
    
        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => @product.cost_per_unit.to_i,
            :description => @product.title,
            :currency    => 'aud'
        )
    
        current_user.products << @product
        
        # Create a new Order object in conjunction with creating a new charge transaction

        @order = Order.new()
        @order.quantity = @product.quantity
        @order.total_amount = @product.cost_per_unit
        @order.payment_details = "#{@product.title}: #{@product.description}"
        @order.receipt = SecureRandom.hex(6)
        @order.user_id = current_user.id
        @order.product_id = @product.id
        @order.save

        # Create a new Order object in conjunction with creating a new charge transaction
        
        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
     end
    
end
