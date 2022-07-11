# frozen_string_literal: true

module Web
  class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: %i[show edit update destroy]

    def index
      @tasks = Task.order(created_at: :desc)
    end

    def show;end

    def new
      @task = Task.new
    end

    def edit;end

    def update;end

    def destroy;end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :test, :creator_id, :executor_id, :task_status_id)
    end
  end
end
