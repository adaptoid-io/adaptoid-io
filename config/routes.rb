Rails.application.routes.draw do
  namespace :github do
    namespace :webhooks do
      post :push_event
    end
  end
end
