Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  authenticate :user do
    root to: 'games#index'
    resources :games do
      resources :fouls
      resources :settles
    end
  end
end
