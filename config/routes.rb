
Rails.application.routes.draw do
  resources :reports, only: [:new, :create] do 
    get 'results' => "reports#results"
  end
end
