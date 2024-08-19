Rails.application.routes.draw do

  post "helps/:reviews_id/:post_id/destroy" => "helps#destroy"
  post "helps/:reviews_id/:post_id/create" => "helps#create"

  post "likes/:post_id/destroy" => "likes#destroy"
  post "likes/:post_id/create" => "likes#create"

  get "posts/:user_id/detail" => "posts#detail"

  post "reviews/create" => "reviews#create"
  get "reviews/:id/edit" => "reviews#edit"
  post "reviews/:id/update" => "reviews#update"
  post "reviews/:id/destroy" => "reviews#destroy"

  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

  get "posts/sf" => "posts#sf"
  get "posts/action" => "posts#action"
  get "posts/comedy" => "posts#comedy"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id/show" => "posts#show"
  post "posts/:id/destroy" => "posts#destroy"

  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  get "users/:id/edit" => "users#edit"
  get "users/:id/show" => "users#show"
  post "users/:id/destroy" => "users#destroy"

  get "/" => "home#top"
  get "/home/about" => "home#about"

  match '*path', to: 'application#render_404', via: :all

end
