Cloudspokes::Application.routes.draw do
  root to: 'content#show', id: 'home'
  match "/members/order_by_name"      => "members#index", :defaults => { :order_by => 'name' }
  match "/members/order_by_win"       => "members#index", :defaults => { :order_by => 'total_wins__c' }
  match "/members/order_by_active"    => "members#index", :defaults => { :order_by => 'challenges_entered__c' }
  match "/members/search"             => "members#search"
  match "/members/:id/past_challenges"    => "members#past_challenges"
  match "/members/:id/active_challenges"  => "members#active_challenges"
  resources :members

  match "/account/:id/challenges"     => "accounts#challenges"
  match "/account/:id/school"         => "accounts#school"
  match "/account/:id/details"        => "accounts#details"
  match "/account/:id/password"       => "accounts#password"

  match "/reset_password"             => "accounts#reset_password"
  match "/require_password"           => "accounts#require_password"

  match "/:id", to: "content#show", as: "content"
  
  get 'challenges/index'
  get 'sessions/login'
  get 'sessions/sfdcauth'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'  

end
