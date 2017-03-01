class CreatePixelFireTagsTriggers < ActiveRecord::Migration[5.0]
  def change
    create_table :pixel_fire_tags_triggers do |t|
      t.references :tag, foreign_key: true
      t.references :trigger, foreign_key: true

      t.timestamps
    end
  end
end
