Rails.application.routes.draw do
  devise_for :users

#para que funcione cerrar sesión
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
 
# ruta por defecto  
  root 'posts#index' 
  
#rutas de posts  
  resources :posts, only: [:index, :new, :show, :create, :edit, :update, :destroy]  


# devise_scope :user do
#   resources :posts
# end

#crea la ruta para guardar los comentarios dentro de los recursos de posts
  resources :posts do
  	resources :comments, only: [:create]
  end



  # get 'posts#index' # funciona al ingresar en el navegador localhost:3000/post#index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
