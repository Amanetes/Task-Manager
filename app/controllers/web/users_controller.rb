# frozen_string_literal: true

module Web
  class UsersController < Web::ApplicationController
    before_action :set_user, only: %i[edit update destroy]

    def index
      @users = User.order(created_at: :desc)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = 'Вы успешно зарегистрировались'
        redirect_to root_url
      else
        flash.now[:error] = 'Не удалось зарегистрировать'
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email, :password,
        :password_confirmation
      )
    end
  end
end
