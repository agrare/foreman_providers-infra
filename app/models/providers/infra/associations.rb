module Providers::Infra::Associations
  extend ActiveSupport::Concern

  included do
    has_many :hosts, :foreign_key => :ems_id, :dependent => :nullify, :inverse_of => :ext_management_system
    has_many :vms_and_templates, :foreign_key => :ems_id, :dependent => :nullify,
             :class_name => "Providers::Infra::VmOrTemplate", :inverse_of => :ext_management_system
    has_many :templates, :foreign_key => :ems_id, :inverse_of => :ext_management_system
    has_many :vms,       :foreign_key => :ems_id, :inverse_of => :ext_management_system
  end
end
