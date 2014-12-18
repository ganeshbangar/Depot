class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize 
  protect_from_forgery with: :exception

  def current_cart
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end

	def authorize
		unless User.find_by(id: session[:user_id])
			redirect_to login_path, notice: "Please log in"
		end
	end		
end
