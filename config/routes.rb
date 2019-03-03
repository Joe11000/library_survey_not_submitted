
Rails.application.routes.draw do
   resources :reports, only: [:new, :create] 
   post 'upload_records_file' => 'reports#file_upload'
   
   root 'reports#new'
end
