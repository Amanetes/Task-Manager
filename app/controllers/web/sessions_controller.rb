# frozen_string_literal: true

module Web
  class SessionsController < ApplicationController
    def new; end

    def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user.persisted?
        sign_in @user
        flash[:notice] = 'Вы вошли в систему'
        redirect_to root_url
      else
        flash.now[:error] = 'Не правильный логин и пароль'
        render :new, status: :unprocessable_entity
      end
    end
  end
end
