# frozen_string_literal: true

module Web
  class TaskStatusesController < ApplicationController
    before_action :set_status, only: %i[edit update destroy]
    def index
      @statuses = TaskStatus.order(id: :desc)
    end

    def edit; end

    def update;end

    def destroy;end

    private

    def set_status
      @status = TaskStatus.find(params[:id])
    end
  end
end
