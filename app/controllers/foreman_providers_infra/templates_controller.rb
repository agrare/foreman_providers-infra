module ForemanProvidersInfra
  class TemplatesController < ::ApplicationController
    include ::ScopesPerAction

    def index
      @templates = action_scope_for(:index, resource_base_with_search).where(ems_id: params[:ems_id])
      render :partial => 'foreman_providers_infra/templates/list'
    end

    def model_of_controller
      Providers::Infra::Template
    end
  end
end
