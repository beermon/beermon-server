Beermon::Application.routes.draw do

  resources :beers, :only => [:index, :create, :show, :update, :destroy] do
    resources :kegs, :only => [:create, :show]
    resources :ratings, :only => [:create, :new, :show]
  end

  resources :taps, :only => [:index, :show, :update] do
    resource :keg, :only => [:update, :show]
  end

  resources :kegs, :only => [] do
    resources :measurements, :only => [:index, :create, :show]
  end

  resources :dashboard

  get '/dashboard/call/:manufacturer_id', :to => 'dashboard#call', :as => :call_brewery
  get '/callback', :to => 'callback#index'

  get '/login', :to => 'sessions#new', :as => :login
  post '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'

  root :to => 'dashboard#index'

end
