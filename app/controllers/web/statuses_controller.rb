# frozen_string_literal: true

module Web
  class StatusesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_status, only: %i[edit update destroy]

    def index
      @statuses = TaskStatus.order(id: :desc)
    end

    def new
      @status = TaskStatus.new
    end

    def create
      @status = TaskStatus.new(status_params)
      if @status.save
        flash[:success] = 'Статус успешно создан'
        redirect_to statuses_url
      else
        flash.now[:error] = 'Не удалось создать статус'
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @status.update(status_params)
        flash[:success] = 'Статус успешно обновлен'
        redirect_to statuses_url
      else
        flash.now[:error] = 'Не удалось обновить статус'
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @status.destroy
        flash[:success] = 'Статус успешно удален'
        redirect_back_or_to(statuses_url, status: :see_other)
      else
        flash.now[:error] = 'Не удалось удалить статус'
        redirect_to statuses_url, status: :see_other
      end
    end

    private

    def set_status
      @status = TaskStatus.find(params[:id])
    end

    def status_params
      params.require(:task_status).permit(:name)
    end
  end
end
