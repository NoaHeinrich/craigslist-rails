Rails.application.routes.draw do
  get "/" => "categories#index", as: "categories_path"
  get "/categories/:id" => "categories#show", as: "category"

  get "categories/:category_id/articles/new" => "articles#new", as: "new_article"
  # get "articles/new" => "articles#other_new", as: "other_new_article"
  post "categories/:category_id/articles" => "articles#create"
  get "/articles/:id/edit" => "articles#edit"
  patch "/articles/:id" => "articles#update"
  delete "/articles/:id" => "articles#destroy"
  get "/articles/:id" => "articles#show", as: "article"

end
