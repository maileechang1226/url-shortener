Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :shortlinks, only: [:new, :create]
  get ':url', to: 'shortlinks#redirect'
  get ':url/counts', to: 'shortlinks#counts'
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"
end
