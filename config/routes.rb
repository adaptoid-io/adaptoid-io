Rails.application.routes.draw do
  namespace :webhooks do
    namespace :github do
      post :push_event
    end
  end

  resources :posts, only: [:index, :show]
end
