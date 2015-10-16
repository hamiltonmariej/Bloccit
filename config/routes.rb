Rails.application.routes.draw do

  resources :topics do
    resources :sponsored_posts, :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
