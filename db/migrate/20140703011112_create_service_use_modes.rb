class CreateServiceUseModes < ActiveRecord::Migration
  def change
    create_table :service_use_modes do |t|
      t.string :name

      t.timestamps
    end
  end
end
