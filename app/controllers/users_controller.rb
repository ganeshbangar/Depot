class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
		
	def create
		@user = User.new(user_params)	
		respond_to do |format|
			if @user.save
				format.html { redirect_to users_path,
				notice: "User #{@user.name} was successfully created." }
				format.json { render action: 'show', status: :created, location: @user }
			else
				format.html { render action: 'new'}
				format.json { render json: @user.errors, status: :unprocessable_entity }	
			end
		end		
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to users_path, notice: "User #{@user.name} was successfully updated." }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
				
	def index
		@user = User.order(:name)
	end

	def destroy
		begin
		byebug
			@user = User.find(params[:id])
			@user.destroy
			flash[:notice] = "User #{@user.name} deleted"
			rescue StandardError => e
		
			flash[:notice] = e.message
			end
     redirect_to users_path
  end    
					
	def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
