module Providers
  class Infra::GuestDevice < ApplicationRecord
    belongs_to :hardware

    has_one :vm_or_template, :through => :hardware
    has_one :vm,             :through => :hardware
    has_one :miq_template,   :through => :hardware

    has_one :network, :foreign_key => "device_id", :dependent => :destroy, :inverse_of => :guest_device
  end
end
