class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :template
      t.string :layout
      t.string :slug
    end
  end
end
