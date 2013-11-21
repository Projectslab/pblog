Pblog::Application.routes.draw do
  
  # posts
  resources :posts

  # sessions
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # users
  controller :users do
    post 'users' => :create
    get 'profile' => :profile
    get 'signup' => :new
    get 'super_delete' => :super_delete
  end

  root 'posts#index'
end
