Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # new and edit excluded, expose api related actions only
  resources :contacts, only: [
    :index, :show, :create, :update, :destroy
  ]

  # special search by tag for contacts
  get "contacts/tag/:tag", to: "contacts#by_tag"

  # TODO: protect with basic auth, or something similar
  mount Yabeda::Prometheus::Exporter => "/i/metrics"
end
