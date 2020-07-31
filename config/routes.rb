Rails.application.routes.draw do
  resources :projects, only: :index do
    resources :todos, only: :update
  end

  post '/todos', to: 'todos#create'
end
