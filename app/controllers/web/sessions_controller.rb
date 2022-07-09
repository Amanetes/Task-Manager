# frozen_string_literal: true

module Web
  class SessionsController < ApplicationController
    before_action :authenticate_user!, only: %i[destroy]

    def new; end

    def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user&.authenticate(params[:session][:password])
        sign_in @user
        flash[:notice] = 'Вы вошли в систему'
        redirect_to root_url
      else
        flash.now[:error] = 'Неправильный логин и пароль'
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      sign_out
      flash[:notice] = 'Вы вышли из системы'
      redirect_to root_url, status: :see_other
    end
  end
end
