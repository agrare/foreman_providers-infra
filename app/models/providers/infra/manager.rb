module Providers
  class Infra::Manager < ExtManagementSystem
    has_many :hosts, :foreign_key => "ems_id", :dependent => :nullify
    has_many :vms,   :foreign_key => "ems_id", :dependent => :nullify
  end
end
