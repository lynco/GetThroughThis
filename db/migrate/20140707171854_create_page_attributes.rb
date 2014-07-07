class CreatePageAttributes < ActiveRecord::Migration
  def change
    create_table :page_attributes do |t|
      t.string :key
      t.text :value
      t.integer :page_id
    end
  end
end
