Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/pharmacy'

  get 'pages/careproviders'

  get 'pages/emar'

  get 'pages/faqs'

  get 'pages/news'

  get 'pages/contactus'

  get 'pages/updates'

  # root to: 'pages#home'
  root to: 'application#hello'
end
