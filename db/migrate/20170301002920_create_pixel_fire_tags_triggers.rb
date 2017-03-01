class CreatePixelFireTagsTriggers < ActiveRecord::Migration[5.0]
  def change
    create_table :pixel_fire_tags_triggers do |t|
      t.integer :tag_id, null: false
      t.integer :trigger_id, null: false

      t.timestamps
    end
  end
end
