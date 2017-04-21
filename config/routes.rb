Rails.application.routes.draw do
  get '/' => 'users#index'
  post '/create' => 'users#create'
  post '/login' => 'users#login'
  get 'users/:id' => 'users#show'
  delete '/log_out/:id' => 'users#log_out'

  get '/posts' => 'posts#index'
  post '/posts/create' => 'posts#create'
  get 'posts/:id' => 'posts#show'
  delete '/posts/:id' => 'posts#destroy'

  get '/likes/:id' => 'likes#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
