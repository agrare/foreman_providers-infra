module Providers
  class Infra::Vm < Infra::VmOrTemplate
    def disconnects
      ruby_clone
    end
  end
end
