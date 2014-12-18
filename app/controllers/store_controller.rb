class StoreController < ApplicationController
 	skip_before_action :authorize
  def index
  	@product = Product.all
    @cart = current_cart
    session[:counter].nil? ? session[:counter] = 0 : session[:counter] += 1	
  end	
end
