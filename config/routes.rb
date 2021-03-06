Rails.application.routes.draw do
  resources :news_blogs

  devise_for :users, path_names: {
    sign_up: '' #Stop Sign Up
  }
  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
  end

  get 'sitemap', to: 'sitemaps#index'

  get 'home', to: 'pages#home', as: 'home'
  get 'pharmacy', to: 'pages#pharmacy', as: 'pharmacy'
  get 'careproviders', to: 'pages#careproviders', as: 'careproviders'
  get 'faqs', to: 'pages#faqs', as: 'faqs'
  get 'news', to: 'pages#news', as: 'news'
  get 'news_show/:id', to: 'pages#news_show', as: 'show'
  get 'contactus', to: 'pages#contactus', as: 'contactus'
  get 'updates', to: 'pages#updates', as: 'updates'

  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  post 'contact-us', to: 'contacts#create', as: 'create_contact'

  root to: 'pages#home'

end
