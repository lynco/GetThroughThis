class CreateSearchDropdowns < ActiveRecord::Migration
  def change
    create_table :search_dropdowns do |t|
      t.string :shown_query
      t.string :ran_query
      t.string :ran_query_type

      t.timestamps
    end
  end
end
