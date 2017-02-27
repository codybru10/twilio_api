Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: "welcome#show"

  resources :users do
    resources :messages
  end
  resources :users do
    resources :contacts
  end
  resources :contacts do
    resources :messages
  end
end
