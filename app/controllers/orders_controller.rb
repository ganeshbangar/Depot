class OrdersController < ApplicationController

	def new
		@cart = current_cart
		if @cart.line_items.empty?
			redirect_to store_index_path, notice: "Your cart is empty."
			return
		end
		@order = Order.new
		respond_to do |format|
			format.html # new.html.erb
			format.xml { render xml: @order }
		end	
	end

	# def create
	# 	@order = Order.new(param_values)

	# end
		
	# def param_values
	# 	params.require(:order).permit(:name, :address, :email, :pay_type )		
	# end
end	
