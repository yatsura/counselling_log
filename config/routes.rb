CounsellingLog::Application.routes.draw do
  root "welcome#index"

  concern :loggable do
    resources :counselling_sessions
  end

  resources :organisations, :concerns => :loggable, :shallow => true do
    resources :clients, :concerns => :loggable
    resources :supervisors, :concerns => :loggable
  end
  resources :counselling_sessions
end
