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
        
        redirect_to @product
        
        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
     end
    
end
