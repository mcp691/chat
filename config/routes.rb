Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  resources :rooms do
    resources :messages do
      resources :users
    end
  end

  root 'static_pages#home'

end
