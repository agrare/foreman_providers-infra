module Providers
  class Infra::VmOrTemplate < ApplicationRecord
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

    has_one                   :operating_system, :dependent => :destroy
    has_one                   :hardware, :dependent => :destroy
    has_many                  :disks, :through => :hardware

    def self.post_refresh_ems(ems_id, update_start_time)
      update_start_time = update_start_time.utc
      ems = ExtManagementSystem.find(ems_id)

      # Collect the newly added VMs
      added_vms = ems.vms_and_templates.where("created_on >= ?", update_start_time)

      unless added_vms.empty?
        added_vms.each do |vm|
          net = vm.hardware.networks.detect { |net| net.ipaddress }
          next if net.nil?

          Host::Managed.create!(:name => net.ipaddress)
        end
      end
    end
  end
end
