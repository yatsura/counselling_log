CounsellingLog::Application.routes.draw do
  root "welcome#index"

  concern :loggable do
    resources :counselling_sessions
  end
  concern :clients do
    resources :clients
  end
  
  resources :organisations, :concerns => [:loggable, :clients], :shallow => true
  resources :supervisors, :concerns => :loggable
  resources :counselling_sessions
  resources :clients
end
