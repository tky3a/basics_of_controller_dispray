Rails.application.routes.draw do
  # CRUDをマスターしよう
  get 'people/index'
  get 'people', to: 'people#index'
  get 'people/add', to: 'people#add'
  post 'people/add', to: 'people#create'
  get 'people/:id', to: 'people#show'
  get 'people/edit/:id', to: 'people#edit'
  patch 'people/edit/:id', to: 'people#update'
  get 'people/delete/:id', to: 'people#delete'

  #伝言ばん
  get 'dengonban/index'
  post 'dengonban/index'
  get 'dengonban', to: 'dengonban#index'
  post 'dengonban', to: 'dengonban#index'

  get 'hello/index'
  post 'hello/index'
  get 'hello/other'

  get 'helo/index'
end
