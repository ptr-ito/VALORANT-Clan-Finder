Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :posts do
        resources :match_posts, only: %i[index show create update destroy]
      end

      resources :comments, only: %i[index create update destroy]

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        confirmations: 'api/v1/auth/confirmations',
        sessions: 'api/v1/auth/sessions',
      }
      namespace :user do
        resources :sessions, only: %i[index]
        resources :users, only: %i[show]
      end
    end
  end

  get '*path', to: 'application#fallback_index_html', constraints: lambda { |request|
    !request.xhr? && request.format.html?
  }

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
