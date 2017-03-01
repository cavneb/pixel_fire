class CreatePixelFireTags < ActiveRecord::Migration[5.0]
  def change
    create_table :pixel_fire_tags do |t|
      t.string :name
      t.text :custom_html
      t.string :target, default: "body"

      t.timestamps
    end
  end
end
