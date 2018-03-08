module Providers
  class VmOrTemplate < ApplicationRecord
    include NewWithTypeStiMixin

    self.table_name = "providers_vms"

    VENDOR_TYPES = {
      # DB            Displayed
      "azure"     => "Azure",
      "vmware"    => "VMware",
      "microsoft" => "Microsoft",
      "xen"       => "XenSource",
      "parallels" => "Parallels",
      "amazon"    => "Amazon",
      "redhat"    => "RedHat",
      "openstack" => "OpenStack",
      "google"    => "Google",
      "kubevirt"  => "KubeVirt",
      "unknown"   => "Unknown"
    }

    POWER_OPS = %w(start stop suspend reset shutdown_guest standby_guest reboot_guest)

    validates_presence_of     :name, :location
    validates                 :vendor, :inclusion => {:in => VENDOR_TYPES.keys}

    belongs_to                :host
    belongs_to                :ext_management_system, :foreign_key => "ems_id"
  end
end
