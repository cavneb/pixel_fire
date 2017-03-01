module PixelFire
  class TagsTrigger < ApplicationRecord
    belongs_to :tag
    belongs_to :trigger
  end
end
