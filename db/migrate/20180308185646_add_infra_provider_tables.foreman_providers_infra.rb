class AddInfraProviderTables < ActiveRecord::Migration[5.1]
  def up
    create_table "providers_hosts", id: :bigserial, force: :cascade do |t|
      t.string   "name"
      t.string   "hostname"
      t.string   "ipaddress"
      t.string   "vmm_vendor"
      t.string   "vmm_version"
      t.string   "vmm_product"
      t.string   "vmm_buildnumber"
      t.datetime "created_on"
      t.datetime "updated_on"
      t.string   "guid"
      t.bigint   "ems_id"
      t.string   "user_assigned_os"
      t.string   "power_state",             default: ""
      t.integer  "smart"
      t.string   "settings"
      t.datetime "last_perf_capture_on"
      t.string   "uid_ems"
      t.string   "connection_state"
      t.string   "ssh_permit_root_login"
      t.string   "ems_ref_obj"
      t.boolean  "admin_disabled"
      t.string   "service_tag"
      t.string   "asset_tag"
      t.string   "ipmi_address"
      t.string   "mac_address"
      t.string   "type"
      t.boolean  "failover"
      t.string   "ems_ref"
      t.boolean  "hyperthreading"
      t.bigint   "ems_cluster_id"
      t.integer  "next_available_vnc_port"
      t.string   "hypervisor_hostname"
      t.bigint   "availability_zone_id"
      t.boolean  "maintenance"
      t.string   "maintenance_reason"
      t.bigint   "physical_server_id"
      t.index ["availability_zone_id"], name: "index_hosts_on_availability_zone_id", using: :btree
      t.index ["ems_id"], name: "index_hosts_on_ems_id", using: :btree
      t.index ["guid"], name: "index_hosts_on_guid", unique: true, using: :btree
      t.index ["hostname"], name: "index_hosts_on_hostname", using: :btree
      t.index ["ipaddress"], name: "index_hosts_on_ipaddress", using: :btree
    end

    create_table "providers_vms", id: :bigserial, force: :cascade do |t|
      t.string   "vendor"
      t.string   "format"
      t.string   "version"
      t.string   "name"
      t.text     "description"
      t.string   "location"
      t.string   "config_xml"
      t.string   "autostart"
      t.bigint   "host_id"
      t.datetime "last_sync_on"
      t.datetime "created_on"
      t.datetime "updated_on"
      t.bigint   "storage_id"
      t.string   "guid"
      t.bigint   "ems_id"
      t.datetime "last_scan_on"
      t.datetime "last_scan_attempt_on"
      t.string   "uid_ems"
      t.datetime "retires_on"
      t.boolean  "retired"
      t.datetime "boot_time"
      t.string   "tools_status"
      t.string   "standby_action"
      t.string   "power_state"
      t.datetime "state_changed_on"
      t.string   "previous_state"
      t.string   "connection_state"
      t.datetime "last_perf_capture_on"
      t.boolean  "registered"
      t.boolean  "busy"
      t.boolean  "smart"
      t.integer  "memory_reserve"
      t.boolean  "memory_reserve_expand"
      t.integer  "memory_limit"
      t.integer  "memory_shares"
      t.string   "memory_shares_level"
      t.integer  "cpu_reserve"
      t.boolean  "cpu_reserve_expand"
      t.integer  "cpu_limit"
      t.integer  "cpu_shares"
      t.string   "cpu_shares_level"
      t.string   "cpu_affinity"
      t.datetime "ems_created_on"
      t.boolean  "template",                 default: false
      t.bigint   "evm_owner_id"
      t.string   "ems_ref_obj"
      t.bigint   "miq_group_id"
      t.boolean  "linked_clone"
      t.boolean  "fault_tolerance"
      t.string   "type"
      t.string   "ems_ref"
      t.bigint   "ems_cluster_id"
      t.bigint   "retirement_warn"
      t.datetime "retirement_last_warn"
      t.integer  "vnc_port"
      t.bigint   "flavor_id"
      t.bigint   "availability_zone_id"
      t.boolean  "cloud"
      t.string   "retirement_state"
      t.bigint   "cloud_network_id"
      t.bigint   "cloud_subnet_id"
      t.bigint   "cloud_tenant_id"
      t.string   "raw_power_state"
      t.boolean  "publicly_available"
      t.bigint   "orchestration_stack_id"
      t.string   "retirement_requester"
      t.bigint   "tenant_id"
      t.bigint   "resource_group_id"
      t.boolean  "deprecated"
      t.bigint   "storage_profile_id"
      t.boolean  "cpu_hot_add_enabled"
      t.boolean  "cpu_hot_remove_enabled"
      t.boolean  "memory_hot_add_enabled"
      t.integer  "memory_hot_add_limit"
      t.integer  "memory_hot_add_increment"
      t.string   "hostname"
      t.index ["availability_zone_id"], name: "index_vms_on_availability_zone_id", using: :btree
      t.index ["ems_id"], name: "index_vms_on_ems_id", using: :btree
      t.index ["evm_owner_id"], name: "index_vms_on_evm_owner_id", using: :btree
      t.index ["flavor_id"], name: "index_vms_on_flavor_id", using: :btree
      t.index ["guid"], name: "index_vms_on_guid", unique: true, using: :btree
      t.index ["host_id"], name: "index_vms_on_host_id", using: :btree
      t.index ["location"], name: "index_vms_on_location", using: :btree
      t.index ["miq_group_id"], name: "index_vms_on_miq_group_id", using: :btree
      t.index ["name"], name: "index_vms_on_name", using: :btree
      t.index ["storage_id"], name: "index_vms_on_storage_id", using: :btree
      t.index ["uid_ems"], name: "index_vms_on_vmm_uuid", using: :btree
    end
  end

  def down
    drop_table "providers_hosts"
    drop_table "providers_vms"
  end
end
