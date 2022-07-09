# frozen_string_literal: true

module Web
  class UsersController < Web::ApplicationController
    before_action :set_user, only: %i[edit update destroy]
    before_action :authorize_user!
    after_action :verify_authorized

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

    def update
      if @user.update(user_params)
        flash[:success] = 'Пользователь обновлен'
        redirect_to root_url
      else
        flash.now[:error] = 'Не удалось удалить пользователя'
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @user.destroy
        flash[:success] = 'Пользователь удален'
        redirect_to root_url
      else
        flash.now[error] = 'Не удалось удалить пользователя'
        redirect_to users_url, status: :see_other
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def authorize_user!
      authorize(@user || User)
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
