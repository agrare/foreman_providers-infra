module ForemanProvidersInfra
  class VmsController < ::ApplicationController
    include ::ScopesPerAction

    def index
      @vms = action_scope_for(:index, resource_base_with_search).where(ems_id: params[:ems_id])
      render :partial => 'foreman_providers_infra/vms/list'
    end

    def show
      @vm = resource_base.find(params[:id])
    end

    def model_of_controller
      Providers::Infra::Vm
    end
  end
end
