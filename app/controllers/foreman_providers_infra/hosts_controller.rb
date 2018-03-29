module ForemanProvidersInfra
  class HostsController < ::ApplicationController
    include ::ScopesPerAction

    def index
      @hosts = action_scope_for(:index, resource_base_with_search).where(ems_id: params[:ems_id])
      render :partial => 'foreman_providers_infra/hosts/list'
    end

    def model_of_controller
      Providers::Infra::Host
    end
  end
end
