Rails.application.routes.draw do
  get "/items" => "items#index"
  post "/items" => "items#create"
  get "/items/:id" => "items#show"
  patch "/items/:id" => "items#update"
  # delete "/items/:id" => "items#destroy"

  post "/delete_item/:id" => "items#destroy"
end
