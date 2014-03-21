CounsellingLog::Application.routes.draw do
  root "welcome#index"

  concern :meetable do
    resources :counselling_sessions, :only => [:index, :new, :create]
  end

  resources :supervisors, :concerns => :meetable
  resources :clients, :concerns => :meetable
  resources :organisations, :concerns => :meetable do
    resources :clients, :only => [:index, :new, :create]
  end
  resources :counselling_sessions
end
