Rails.application.routes.draw do
  get 'new_action', to: 'foreman_providers_infra/hosts#new_action'
end
