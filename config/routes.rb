Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  authenticate :user do
    resources :fouls
  end
end
