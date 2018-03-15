module Providers
  class Infra::Host < ApplicationRecord
    include NewWithTypeStiMixin

    VENDOR_TYPES = {
      # DB            Displayed
      "microsoft"       => "Microsoft",
      "redhat"          => "RedHat",
      "kubevirt"        => "KubeVirt",
      "vmware"          => "VMware",
      "openstack_infra" => "OpenStack Infrastructure",
      "unknown"         => "Unknown",
      nil               => "Unknown",
    }.freeze

    validates_presence_of     :name
    validates_inclusion_of    :vmm_vendor, :in => VENDOR_TYPES.keys

    belongs_to :ext_management_system, :foreign_key => "ems_id"
    has_many   :vms_and_templates, :dependent => :nullify
    has_many   :vms, :inverse_of => :host
    has_many   :templates, :inverse_of => :host

    alias_attribute     :state,   :power_state
    alias_attribute     :to_s,    :name
  end
end
