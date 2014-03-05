CounsellingLog::Application.routes.draw do
  root "welcome#index"

  concern :loggable do
    resources :counselling_sessions
  end

  resources :organisations, :concerns => :loggable, :shallow => true do
    resources :clients, :concerns => :loggable
  end
  resources :supervisors, :concerns => :loggable
  resources :counselling_sessions
end
