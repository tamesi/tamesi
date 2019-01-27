Rails.application.routes.draw do
  devise_for :users
 get 'home' => 'homes#top'
 get 'about' => 'abouts#top'
 root 'books#index'
  resources :books
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
