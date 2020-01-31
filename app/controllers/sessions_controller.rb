class SessionsController < ApplicationController

    def new
    end
  
    def create
        user = User.find_by(username: params[:username])
        p user
        # If the user exists
        if user.nil?
          # Save the user id inside the browser cookie. This is how we keep the user 
          # logged in when they navigate around our website.
          user = User.new
          user.username = params[:username]
          user.save
          session[:user_id] = user.id
          flash.notice = "Signed in Successfully"
          redirect_to movies_path
        elsif user
          session[:user_id] = user.id
          flash.notice = "Signed in Successfully"
          redirect_to movies_path
        else
          flash.notice = "Unable to signed in"
          # If user's login doesn't work, send them back to the login form.
          redirect_to '/login'
        end
      end
    
      def destroy
        session[:user_id] = nil
        redirect_to '/login'
      end

      private
  
        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            params.require(:user).permit(:username)
          end

    
end
