Rails.application.routes.draw do
  resources :articles
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/api/v1/graphiql", graphql_path: "/api/v1/graphql"
  end
  namespace :api do
    namespace :v1 do
      post "/graphql", to: "graphql#execute"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
