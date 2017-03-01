class CreatePixelFireTriggers < ActiveRecord::Migration[5.0]
  def change
    create_table :pixel_fire_triggers do |t|
      t.string :name, null: false
      t.boolean :fire_on_all_pages, default: true
      t.string :page_url

      t.timestamps
    end
  end
end
