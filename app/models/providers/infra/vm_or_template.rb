module Providers
  class Infra::VmOrTemplate < ApplicationRecord
    include NewWithTypeStiMixin
    extend ForemanProviders::Logging

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

    def state
      (power_state || "unknown").downcase
    end
    alias_method :current_state, :state

    # Override raw_power_state= attribute setter in order to impose side effects
    # of setting previous_state and updating state_changed_on
    def raw_power_state=(new_state)
      return unless new_state

      unless raw_power_state == new_state
        self.previous_state   = raw_power_state
        self.state_changed_on = Time.now.utc
        super
        self.power_state      = calculate_power_state
      end
      new_state
    end

    def self.calculate_power_state(raw_power_state)
      (raw_power_state == "never") ? "never" : "unknown"
    end

    def self.post_refresh_ems(ems_id, update_start_time)
      update_start_time = update_start_time.utc
      ems = ExtManagementSystem.find(ems_id)

      # Collect the newly added VMs
      added_vms = ems.vms_and_templates.where("created_on >= ?", update_start_time)

      unless added_vms.empty?
        added_vms.each do |vm|
          net = vm.hardware.networks.detect { |net| net.ipaddress }
          next if net.nil?
          begin
            Host::Managed.create!(:name => net.ipaddress)
          rescue => err
            _log.error("Error creating Host::Managed: :name =>#{net.ipaddress} (vm.name=#{vm.name}). Reason:<#{err}>")
          end
        end
      end
    end

    private

    def power_state=(new_power_state)
      super
    end

    def calculate_power_state
      self.class.calculate_power_state(raw_power_state)
    end
  end
end
