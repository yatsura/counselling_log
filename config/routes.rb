CounsellingLog::Application.routes.draw do
  root "welcome#index"

  resources :clients
  resources :organisations
  resources :supervisors
  resources :users
  resources :counselling_sessions
end
