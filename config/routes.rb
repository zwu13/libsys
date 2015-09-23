Rails.application.routes.draw do
  get 'admins/new'

  root'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
end