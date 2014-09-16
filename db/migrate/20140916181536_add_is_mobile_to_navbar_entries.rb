class AddIsMobileToNavbarEntries < ActiveRecord::Migration
  def change
    add_column :navbar_entries, :is_mobile, :boolean
  end
end
