Rails.application.routes.draw do
  namespace :webhooks do
    namespace :github do
      post :push_event
    end
  end

  get "posts/:slug", to: 'posts#show'
end
