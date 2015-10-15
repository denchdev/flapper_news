Rails.application.routes.draw do
  
  devise_for :users
  root to: 'application#angular'

  resources :posts, only: [:create, :index, :show] do
    resources :comments, only: [:show, :create] do 
      member do
        put '/upvotes' => 'comments#upvote'
      end
    end
    
    member do
        put '/upvotes' => 'posts#upvote'
    end
  end
  
end
