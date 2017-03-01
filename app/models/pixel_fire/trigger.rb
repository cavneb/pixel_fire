module PixelFire
  class Trigger < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :page_url, presence: true, unless: -> (trigger) { trigger.fire_on_all_pages? }
  end
end
