module Providers
  class Infra::Network < ApplicationRecord
    belongs_to :hardware
    belongs_to :guest_device, :foreign_key => "device_id", :inverse_of => :network
  end
end
