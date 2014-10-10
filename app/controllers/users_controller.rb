class UsersController < ApplicationController
	include UsersHelper
	
	def create
		@user = User.new user_params
		@user.sms = true
		@user.voice = true
		
		if @user.save
            flash[:notice] = "Your account has been created! Please login."
            email = @user.email
            mobile = @user.mobile
            send_email(email) 
            send_sms(mobile)
            send_voice(mobile)
            redirect_to root_path
        else
            # Re-render the template that led here. Errors will be displayed
            # because there is a @user instance variable now.
            render "welcome/index"
        end
	end

	def update
		@user = User.find(params[:id])
	
		if @user.update user_params
			redirect_to user_path(@user)
			flash[:notice] = "Your account has been updated!"
		else
			render :edit
		end
		#Put info into database.
	end

	def edit
		@user = current_user
	end

	def show
		@user = current_user
		#Show settings of current user.  
	end



	private

	def user_params
		params.require(:user).permit( 
			:password,
			:password_confirmation,
			:email,
			:mobile,
			:voice,
			:sms
			)
	end
end
