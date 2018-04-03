Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/pharmacy'

  get 'pages/careproviders'

  get 'pages/faqs'

  get 'pages/news'

  get 'pages/contactus'

  get 'pages/updates'

  root to: 'pages#home'

  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  post 'contact-us', to: 'contacts#create', as: 'create_contact'
end
