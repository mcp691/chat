Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  resources :rooms do
    resources :messages
  end

  root 'static_pages#home'

end
