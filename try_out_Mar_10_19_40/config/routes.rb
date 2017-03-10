Rails.application.routes.draw do
    root 'home#index'

    devise_for :users, controllers: { registrations: "registrations"}
    devise_for :grocers, skip: [:sessions, :registrations]
    devise_for :clients, skip: [:sessions, :registrations]

    resources :grocers
    resources :items

    resources :clients do
        get 'clients/client_order_list', :on => :member
        get 'clients/grocer_item_list', :on => :member
    end
    resources :orders
    resources :carts, only: [:create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
