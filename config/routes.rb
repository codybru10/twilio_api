Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: "welcome#show"

  resources :users do
    resources :messages
    resources :contacts
  end
end
