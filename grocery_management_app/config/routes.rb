Rails.application.routes.draw do
    root 'home#index'

    devise_for :users, controllers: { registrations: "registrations"}
    devise_for :grocers, skip: [:sessions, :registrations]
    devise_for :clients, skip: [:sessions, :registrations]

    resources :grocers
    match 'grocer/show_exisiting_order' => 'grocers#show_exisiting_order', via: :get
    resources :items
    match 'item/units_left' => 'items#units_left', via: :get

    resources :clients
    match '/client/client_order_list', to: 'clients#client_order_list', via: :get
    # get 'clients/client_order_list' => 'clients#client_order_list', :as => :client_order_list
    match 'client/grocer_item_list' => 'clients#grocer_item_list', via: :get
    resources :orders
    resources :carts, only: [:create, :edit, :update, :destroy]
    match '/cart/edit', to: 'carts#edit', via: :get


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
