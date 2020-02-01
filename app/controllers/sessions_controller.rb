class SessionsController < ApplicationController

    def new
    end
  
    def create
        p "!!!!!!"
        user = User.find_by(username: params[:username])
        # check user exists
        if user.nil?
          user = User.new
          user.username = params[:username]
          user.save
          session[:username] = user.username
          redirect_to movies_path
        else
          session[:username] = user.username
          flash.notice = "Signed in Successfully"
          redirect_to movies_path
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
