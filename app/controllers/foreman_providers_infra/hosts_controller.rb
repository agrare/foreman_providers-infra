module ForemanProvidersInfra
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_providers_infra/layouts/new_layout'

    def new_action
      # automatically renders view/foreman_providers_infra/hosts/new_action
    end
  end
end
