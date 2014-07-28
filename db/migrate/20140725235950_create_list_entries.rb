class CreateListEntries < ActiveRecord::Migration
  def change
    create_table :list_entries do |t|
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
