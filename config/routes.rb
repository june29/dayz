Dayz::Application.routes.draw do
  resources :days, only: [:create]

  get "/:date", constraints: { date: /\d{4}-\d{2}-\d{2}/ }, to: "days#show",   as: "day"
  put "/:date", constraints: { date: /\d{4}-\d{2}-\d{2}/ }, to: "days#update"

  get "/search", to: "days#search", as: "search"

  root to: "days#index"
end
