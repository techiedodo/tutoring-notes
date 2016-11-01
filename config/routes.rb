Rails.application.routes.draw do
  devise_for :tutors
  root 'home#index'
  resources :students
  resources :tut_sessions
  resources :notes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
