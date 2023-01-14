Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :posts do
        resources :match_posts, only: %i[index show create update destroy] do
          resources :comments, only: %i[index create update destroy], shallow: true
        end
      end

      resources :notifications, only: [:index] do
        resource :read, only: [:create], module: :notifications
      end

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        confirmations: 'api/v1/auth/confirmations',
      }
      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
