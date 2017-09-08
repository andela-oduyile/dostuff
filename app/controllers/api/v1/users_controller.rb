module Api
  module V1

    class UsersController < ApplicationController
      skip_before_action :authenticate

      def create
        @user = User.new(users_params)
        if @user.save
          render json: { success: true, message: 'Thank you for signing up!'}, status: :ok
        else
          render json: { success: false, message: 'An error occured'}, status: :unprocessable_entity
        end
      end

      private

      def users_params
        params.permit(:email, :password)
      end
    end

  end
end
