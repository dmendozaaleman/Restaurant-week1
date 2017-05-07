class OrdersController < ApplicationController

	def show
		@product = Product.find params[:product_id]
    	@order = Order.find params[:id]
	end 

	def new
		@product = Product.find params[:product_id]
	end

	def create
		@product = Product.find params[:product_id]
    	@order = Order.new(order_params)
    	@order.product = @product
        if @order.save
           flash[:success] = "Order summitted. Thank you!"
           redirect_to product_order_path(@product,@order)
        else
        	flash[:error] = "Error: #{@order.errors.full_messages.to_sentence}"
            render 'new'
        end
  	end

  	private
  	def order_params
      	params.require(:order).permit(:name, :phone, :address)
    end

end
