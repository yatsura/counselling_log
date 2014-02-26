CounsellingLog::Application.routes.draw do
  root "welcome#index"

  concern :loggable do
    resources :counselling_sessions
  end
  
  resources :clients, :concerns => :loggable
  resources :organisations, :concerns => :loggable
  resources :supervisors, :concerns => :loggable
  resources :counselling_sessions
end
