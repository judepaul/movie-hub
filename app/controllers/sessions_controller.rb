class SessionsController < ApplicationController

    def new
    end
  
    def create
        p "!!!!!!"
        user = User.find_by(username: params[:username])
        p user
        # check user exists
        if user.nil?
          user = User.new
          user.username = params[:username]
          user.save
          @user = user
          p @user
          redirect_to movies_path(id:user.id)
        else
            p "@@@@@@"
          @user = user
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
