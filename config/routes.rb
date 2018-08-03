Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  authenticate :user do
    root to: 'fouls#new'
    resources :fouls
  end
end
