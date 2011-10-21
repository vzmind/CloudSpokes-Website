Cloudspokes::Application.routes.draw do
  root to: 'content#show', id: 'home'
  match "/members/sort_by_name"   => "members#index", :defaults => { :sort_by => 'name' }
  match "/members/sort_by_win"    => "members#index", :defaults => { :sort_by => 'total_wins__c' }
  match "/members/sort_by_active" => "members#index", :defaults => { :sort_by => 'challenges_entered__c' }
  match "/members/search"         => "members#search"
  resources :members
  match "/:id", to: "content#show", as: "content"
  
  get 'challenges/index'
  get 'sessions/login'
  get 'sessions/sfdcauth'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'  

end
