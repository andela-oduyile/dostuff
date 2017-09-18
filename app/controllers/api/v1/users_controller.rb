module Api
  module V1

    class UsersController < ApplicationController
      skip_before_action :authenticate

      def create
        user = User.new(users_params)
        if user.save
          jwt = Auth.issue({user: user.id})
          render json: { success: true, message: 'Signed up successfully', token: jwt}, status: :ok
        else
          render json: { success: false, message: 'An error occured'}, status: 400
        end
      end

      private

      def users_params
        params.permit(:email, :password)
      end
    end

  end
end
