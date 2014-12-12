class StoreController < ApplicationController
  def index
  	@product = Product.all
  	if session[:counter].nil?
      session[:counter] = 0
    end
    	session[:counter] += 1
   	if session[:counter] > 5
      return session[:counter]         
    end
  	
  end	
end
