class AddMoreProvidersInfraTables < ActiveRecord::Migration[5.1]
  def up
    create_table "providers_disks", id: :bigserial, force: :cascade do |t|
      t.string   "device_name"
      t.string   "device_type"
      t.string   "location"
      t.string   "filename"
      t.bigint   "hardware_id"
      t.string   "mode"
      t.string   "controller_type"
      t.bigint   "size"
      t.bigint   "free_space"
      t.bigint   "size_on_disk"
      t.boolean  "present",            default: true
      t.boolean  "start_connected",    default: true
      t.boolean  "auto_detect"
      t.datetime "created_on"
      t.datetime "updated_on"
      t.string   "disk_type"
      t.bigint   "storage_id"
      t.bigint   "backing_id"
      t.string   "backing_type"
      t.bigint   "storage_profile_id"
      t.boolean  "bootable"
      t.index ["device_name"], name: "index_disks_on_device_name", using: :btree
      t.index ["device_type"], name: "index_disks_on_device_type", using: :btree
      t.index ["hardware_id"], name: "index_disks_on_hardware_id", using: :btree
      t.index ["storage_id"], name: "index_disks_on_storage_id", using: :btree
    end

    create_table "providers_guest_devices", id: :bigserial, force: :cascade do |t|
      t.string  "device_name"
      t.string  "device_type"
      t.string  "location"
      t.string  "filename"
      t.bigint  "hardware_id"
      t.string  "mode"
      t.string  "controller_type"
      t.bigint  "size"
      t.bigint  "free_space"
      t.bigint  "size_on_disk"
      t.string  "address"
      t.bigint  "switch_id"
      t.bigint  "lan_id"
      t.string  "model"
      t.string  "iscsi_name"
      t.string  "iscsi_alias"
      t.boolean "present",                default: true
      t.boolean "start_connected",        default: true
      t.boolean "auto_detect"
      t.string  "uid_ems"
      t.boolean "chap_auth_enabled"
      t.string  "manufacturer"
      t.string  "field_replaceable_unit"
      t.bigint  "parent_device_id"
      t.string  "vlan_key"
      t.boolean "vlan_enabled"
      t.string  "peer_mac_address"
      t.index ["device_name"], name: "index_guest_devices_on_device_name", using: :btree
      t.index ["device_type"], name: "index_guest_devices_on_device_type", using: :btree
      t.index ["hardware_id"], name: "index_guest_devices_on_hardware_id", using: :btree
      t.index ["lan_id"], name: "index_guest_devices_on_lan_id", using: :btree
      t.index ["parent_device_id"], name: "index_guest_devices_on_parent_device_id", using: :btree
      t.index ["switch_id"], name: "index_guest_devices_on_switch_id", using: :btree
    end

    create_table "providers_hardwares", id: :bigserial, force: :cascade do |t|
      t.string  "config_version"
      t.string  "virtual_hw_version"
      t.string  "guest_os"
      t.integer "cpu_sockets",          default: 1
      t.string  "bios"
      t.string  "bios_location"
      t.string  "time_sync"
      t.text    "annotation"
      t.bigint  "vm_or_template_id"
      t.integer "memory_mb"
      t.bigint  "host_id"
      t.integer "cpu_speed"
      t.string  "cpu_type"
      t.bigint  "size_on_disk"
      t.string  "manufacturer",         default: ""
      t.string  "model",                default: ""
      t.integer "number_of_nics"
      t.integer "cpu_usage"
      t.integer "memory_usage"
      t.integer "cpu_cores_per_socket"
      t.integer "cpu_total_cores"
      t.boolean "vmotion_enabled"
      t.bigint  "disk_free_space"
      t.bigint  "disk_capacity"
      t.string  "guest_os_full_name"
      t.integer "memory_console"
      t.integer "bitness"
      t.string  "virtualization_type"
      t.string  "root_device_type"
      t.bigint  "computer_system_id"
      t.bigint  "disk_size_minimum"
      t.bigint  "memory_mb_minimum"
      t.boolean "introspected"
      t.string  "provision_state"
      t.string  "serial_number"
      t.bigint  "switch_id"
      t.index ["computer_system_id"], name: "index_hardwares_on_computer_system_id", using: :btree
      t.index ["host_id"], name: "index_hardwares_on_host_id", using: :btree
      t.index ["vm_or_template_id"], name: "index_hardwares_on_vm_id", using: :btree
    end

    create_table "providers_networks", id: :bigserial, force: :cascade do |t|
      t.bigint   "hardware_id"
      t.bigint   "device_id"
      t.string   "description"
      t.string   "guid"
      t.boolean  "dhcp_enabled"
      t.string   "ipaddress"
      t.string   "subnet_mask"
      t.datetime "lease_obtained"
      t.datetime "lease_expires"
      t.string   "default_gateway"
      t.string   "dhcp_server"
      t.string   "dns_server"
      t.string   "hostname"
      t.string   "domain"
      t.string   "ipv6address"
      t.index ["device_id"], name: "index_networks_on_device_id", using: :btree
      t.index ["hardware_id"], name: "index_networks_on_hardware_id", using: :btree
    end

    create_table "providers_operating_systems", id: :bigserial, force: :cascade do |t|
      t.string  "name"
      t.string  "product_name"
      t.string  "version"
      t.string  "build_number"
      t.string  "system_root"
      t.string  "distribution"
      t.string  "product_type"
      t.string  "service_pack"
      t.string  "productid"
      t.bigint  "vm_or_template_id"
      t.bigint  "host_id"
      t.integer "bitness"
      t.string  "product_key"
      t.integer "pw_hist"
      t.integer "max_pw_age"
      t.integer "min_pw_age"
      t.integer "min_pw_len"
      t.boolean "pw_complex"
      t.boolean "pw_encrypt"
      t.integer "lockout_threshold"
      t.bigint  "lockout_duration"
      t.integer "reset_lockout_counter"
      t.string  "system_type"
      t.bigint  "computer_system_id"
      t.string  "kernel_version"
      t.index ["computer_system_id"], name: "index_operating_systems_on_computer_system_id", using: :btree
      t.index ["host_id"], name: "index_operating_systems_on_host_id", using: :btree
      t.index ["vm_or_template_id"], name: "index_operating_systems_on_vm_id", using: :btree
    end
  end

  def down
    drop_table "providers_disks"
    drop_table "providers_guest_devices"
    drop_table "providers_hardwares"
    drop_table "providers_networks"
    drop_table "providers_operating_systems"
  end
end
