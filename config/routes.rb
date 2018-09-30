Rails.application.routes.draw do
  get 'dengonban/index'
  post 'dengonban/index'
  get 'dengonban', to: 'dengonban#index'
  post 'dengonban', to: 'dengonban#index'




  get 'hello/index'
  post 'hello/index'
  get 'hello/other'

  get 'helo/index'
end
