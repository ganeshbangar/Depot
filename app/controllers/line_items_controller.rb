class LineItemsController < ApplicationController

def create
	@cart = current_cart
	product = Product.find(params[:product_id])
	@line_item = @cart.add_product(product.id)
	respond_to do |format|
	if @line_item.save
		session[:counter] = 0
		format.html { redirect_to(@line_item.cart) }
		format.xml { render xml: @line_item, status: :created, location: @line_item }
	else
		format.html { render action: "new" }
		format.xml { render xml: @line_item.errors, status: :unprocessable_entity }
	end
end
end
end
