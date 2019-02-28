
Rails.application.routes.draw do
   resources :reports, only: [:new, :create, :index] 
   
   root 'reports#new'
end
