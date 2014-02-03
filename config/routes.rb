CounsellingLog::Application.routes.draw do
  root "welcome#index"

  resources :clients
end
