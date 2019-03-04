Rails.application.routes.draw do
   resources :reports, only: [:new, :create] 
   
   root 'reports#new'
end
