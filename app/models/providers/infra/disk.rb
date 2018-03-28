module Providers
  class Infra::Disk < ApplicationRecord
    belongs_to :hardware
  end
end
