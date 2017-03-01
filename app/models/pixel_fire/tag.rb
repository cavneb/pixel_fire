module PixelFire
  class Tag < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :custom_html, presence: true
  end
end
