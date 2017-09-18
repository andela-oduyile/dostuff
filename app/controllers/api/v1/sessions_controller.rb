module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate

       def create
         user = User.find_by(email: auth_params[:email])
         if user.authenticate(auth_params[:password])
           jwt = Auth.issue({user: user.id})
           render json: { success: true, message: 'Logged in successfully', token: jwt}, status: :ok
         else
           render json: { success: false, message: 'Invalid username or password'}, status: 400
         end
       end

       private
         def auth_params
           params.permit(:email, :password)
         end

    end
  end
end
