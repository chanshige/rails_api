Rails.application.routes.draw do
  # sample
  get '/greeting(/:name)', to: 'greeting#index'
end
