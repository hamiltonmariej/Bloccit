Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index] do
      resources :sponsored_posts
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
