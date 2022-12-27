Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show update]

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
