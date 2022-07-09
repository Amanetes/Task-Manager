# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index'

    resources :users, except: %i[show]
    resource :session, only: %i[new create destroy]
    resources :task_statuses, as: :statuses, except: %i[show]
  end
end
