Rails.application.routes.draw do
  
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
        devise_for :admins, controllers: {
            sessions: 'admins/sessions'
        }
        devise_for :customers
        
        
        namespace :admin do
            resources :customers
        end
 
        root to: 'shares#top'
        resources :shares, only: [:index, :show] do
           collection do
               get 'search'
            end
        end
        
        resources :customers, only: [:create,:show,:edit, :update]
        resources :itineraries 
        resources :records
        get '/records/draft/:id' => 'records#draft', as: 'records_draft'
        
        
        resources :genres, only: [:index, :create, :edit, :update, :destroy]
        resources :lists, only: [:index, :destroy, :create, :update]
         get '/lists/map/:id' => 'lists#map', as: 'lists_map'
      
        resources :plans do
            resources :schedules, only: [:new, :create, :index, :edit, :update, :destroy]
        end
        
        
        
        resources :relationships, only: [:create, :destroy]
        get '/relationships/follow_button' => 'relationships#follow_button', as: 'follow_button'

       

end

