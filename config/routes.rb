Rails.application.routes.draw do


    root '/'
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/posts" => "posts#index"
    post "/posts" => "posts#create" 
    get "/posts/:id" => "posts#show"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#destroy"

    post "/users" => "users#create"
    get "/users/me" => "users#profile"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"

    get "/tags" => "tags#index"
    get "/tags/:id" => "tags#show" 

    post "/comments" => "comments#create"
    get "/comments/:id" => "comments#show"
    patch "/comments/:id" => "comments#update"
    delete "comments/:id" => "comments#destroy"

    post "/replies" => "replies#create"
    get "/replies/:id" => "replies#show"
    patch "/replies/:id" => "replies#update"
    delete "replies/:id" => "replies#destroy"

  end

    get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }


end
