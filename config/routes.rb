Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get  '/', to: 'static#index'
  resources :google_calender_api do
    get 'client', on: :collection
  end
end
