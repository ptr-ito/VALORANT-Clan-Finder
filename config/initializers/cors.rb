# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # 今回はRailsのポートが3000番、Reactのポートが3001番にするので、Reactのリクエストを許可するためにlocalhost:3000を設定
    origins 'http://localhost:3001', 'https://valofinder.magia.runteq.jp'


    resource '*',
             headers: :any,
             expose: %i[access-token expiry token-type uid client],
             methods: %i[get post put patch delete options head]
  end
end
