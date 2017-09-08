module Api
  module V1
    class TasksController < ApplicationController
      skip_before_action :authenticate
      
      def index
        tasks = Task.order('created_at DESC')
        render json: { success: true, data: tasks}, status: :ok
      end

      def show
        task = Task.find(params[:id])
        render json: { success: true, data: task}, status: :ok
      end

      def create
        task = Task.new(task_params)

        if task.save
          render json: { success: true, data: task}, status: :ok
        else
          render json: { success: false, data: task.errors}, status: :unprocessable_entity
        end
      end

      def update
        task = Task.find(params[:id])
        if task.update(task_params)
          render json: { success: true, data: task}, status: :ok
        else
          render json: { success: false, data: task.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        task = Task.find(params[:id])
        task.destroy
        render json: { success: true, data: task}, status: :ok
      end

      private
        def task_params
          params.permit(:content, :state)
        end

        def set_task
        end
    end
  end
end
