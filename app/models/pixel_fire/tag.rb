module PixelFire
  class Tag < ApplicationRecord
    has_many :tags_triggers
    has_many :triggers, through: :tags_triggers
    validates :name, presence: true, uniqueness: true
    validates :custom_html, presence: true

    def update_triggers(trigger_ids)
      trigger_ids  ||= []
      current_ids    = tags_triggers.pluck(:trigger_id)
      unchanged_ids  = trigger_ids & current_ids || []
      new_ids        = trigger_ids - unchanged_ids
      remove_ids     = current_ids - unchanged_ids

      tags_triggers.where(trigger_id: remove_ids).map(&:destroy) if remove_ids.present?
      new_ids.each do |trigger_id|
        tags_triggers.create(trigger_id: trigger_id)
      end
    end
  end
end
