# frozen_string_literal: true

module AuthConcern
  extend ActiveSupport::Concern

  included do
    private

    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session.delete(:user_id)
      session.clear
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def signed_in?
      session[:user_id].present? && current_user.present?
    end

    def authenticate_user!
      return if signed_in?

      flash[:warn] = 'Необходима аутентификация!'
      redirect_to root_url, status: :see_other
    end

    helper_method :current_user, :signed_in?
  end
end
