module Providers
  class Infra::Hardware < ApplicationRecord
    belongs_to :vm_or_template
    belongs_to :vm,            :foreign_key => :vm_or_template_id
    belongs_to :miq_template,  :foreign_key => :vm_or_template_id

    has_many    :networks, :dependent => :destroy
    has_many    :disks, -> { order(:location) }, :dependent => :destroy
    has_many    :guest_devices, :dependent => :destroy
  end
end
