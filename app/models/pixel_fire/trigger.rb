module PixelFire
  class Trigger < ApplicationRecord
    has_many :tags_triggers
    has_many :tags, through: :tags_triggers
    validates :name, presence: true, uniqueness: true
    validates :page_url, presence: true, unless: -> (trigger) { trigger.fire_on_all_pages? }

    scope :matches, -> (path) do
      ids = []
      ::PixelFire::Trigger.pluck(:id, :page_url, :fire_on_all_pages).each do |vals|
        if vals[2] == true
          ids << vals[0]
        elsif path =~ Regexp.new(vals[1])
          ids << vals[0]
        end
      end
      if ids != []
        where(id: ids)
      else
        where("1 = 0")
      end
    end

    def update_tags(tag_ids)
      tag_ids      ||= []
      current_ids    = tags_triggers.pluck(:tag_id)
      unchanged_ids  = tag_ids & current_ids
      new_ids        = tag_ids - unchanged_ids
      remove_ids     = current_ids - unchanged_ids

      tags_triggers.where(tag_id: remove_ids).map(&:destroy) if remove_ids.present?
      new_ids.each do |tag_id|
        tags_triggers.create(tag_id: tag_id)
      end
    end
  end
end
