Rails.application.routes.draw do
  scope path: '/foreman_providers/infra', as: :foreman_providers_infra do
    get ':ems_id/vms', to: 'foreman_providers_infra/vms#index'
    get 'vms/:id', to: 'foreman_providers_infra/vms#show'

    get ':ems_id/templates', to: 'foreman_providers_infra/templates#index'
    get ':ems_id/hosts', to: 'foreman_providers_infra/hosts#index'
  end
end
