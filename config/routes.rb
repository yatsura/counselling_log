CounsellingLog::Application.routes.draw do
  root "welcome#index"

  resources :clients do
    resources :counselling_sessions  
  end
  resources :organisations
  resources :supervisors
  resources :users
end
